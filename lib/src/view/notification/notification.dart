import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/common/widgets/warning_confirm_dialog.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/model/dto/notification/notification_dto.dart';
import 'package:smart_farm/src/view/export.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';
import 'package:smart_farm/src/viewmodel/notification/notification_bloc.dart';

class NotificationModel {
  final String id;
  final String userId;
  final String content;
  final String title;
  final DateTime createdAt;
  final bool isRead;
  final String? taskId;
  final String? medicalSymptomId;
  final String? cageId;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.content,
    required this.title,
    required this.createdAt,
    required this.isRead,
    this.taskId,
    this.medicalSymptomId,
    this.cageId,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      userId: json['userId'],
      content: json['content'],
      title: json['title'],
      createdAt: DateTime.parse(json['createdAt']),
      isRead: json['isRead'],
      taskId: json['taskId'],
      medicalSymptomId: json['medicalSymptomId'],
      cageId: json['cageId'],
    );
  }
}

class NotificationWidget extends StatefulWidget {
  final String userId;
  const NotificationWidget({super.key, required this.userId});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = true;
  List<NotificationDto> _allNotifications = [];
  List<NotificationDto> _unreadNotifications = [];
  String userId = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadNotifications();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadNotifications() async {
    context
        .read<NotificationBloc>()
        .add(NotificationEvent.getNotificationsByUserId());
  }

  Future<void> _refreshNotifications() async {
    await _loadNotifications();
  }

  void _markAsRead(NotificationDto notification) {
    context.read<NotificationBloc>().add(
        NotificationEvent.markReadNotification(notification: notification));
  }

  void _markAllAsRead() {
    context
        .read<NotificationBloc>()
        .add(NotificationEvent.markReadAllNotification());
  }

  void _navigateToDetails(NotificationDto notification) {
    // Điều hướng dựa vào loại thông báo
    if (notification.medicalSymptomId != null) {
      // Điều hướng đến trang báo cáo triệu chứng
      // Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalSymptomDetailsScreen(id: notification.medicalSymptomId!)));
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //       content: Text(
      //           'Đang điều hướng đến báo cáo triệu chứng ID: ${notification.medicalSymptomId}')),
      // );
      context.push(RouteName.home);
    } else if (notification.taskId != null) {
      // Điều hướng đến trang nhiệm vụ
      // Navigator.push(context, MaterialPageRoute(builder: (context) => TaskDetailWidget(taskId: notification.taskId!)));
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //       content: Text(
      //           'Đang điều hướng đến công việc có ID: ${notification.taskId}')),
      // );
      context.push(RouteName.taskDetail, extra: notification.taskId!);
    } else if (notification.cageId != null) {
      // Điều hướng đến trang thông tin chuồng
      // Navigator.push(context, MaterialPageRoute(builder: (context) => CageDetailsScreen(id: notification.cageId!)));
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //       content: Text(
      //           'Đang điều hướng đến thông tin chuồng ID: ${notification.cageId}')),
      // );
      context.push(RouteName.cage, extra: notification.cageId!);
    }
  }

  void _handleOnTap(NotificationDto notification) {
// Đánh dấu thông báo là đã đọc
    if (!notification.isRead) {
      _markAsRead(notification);
    } else {
      _navigateToDetails(notification);
    }
  }

  String _formatTimeAgo(DateTime dateTime) {
    final now = TimeUtils.customNow();
    final difference = now.difference(dateTime);

    if (difference.inDays > 7) {
      return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ngày trước';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} giờ trước';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} phút trước';
    } else {
      return 'Vừa xong';
    }
  }

  Widget _buildNotificationItem(NotificationDto notification) {
    // Xác định icon dựa vào loại thông báo
    IconData notificationIcon;
    Color iconColor;

    if (notification.medicalSymptomId != null) {
      notificationIcon = Icons.medical_services_outlined;
      iconColor = Colors.red;
    } else if (notification.taskId != null) {
      notificationIcon = Icons.assignment_outlined;
      iconColor = Colors.orange;
    } else if (notification.title.contains("nhiệt độ")) {
      notificationIcon = Icons.thermostat_outlined;
      iconColor = Colors.deepOrange;
    } else if (notification.title.contains("trọng lượng")) {
      notificationIcon = Icons.monitor_weight_outlined;
      iconColor = Colors.green;
    } else if (notification.title.contains("vaccine")) {
      notificationIcon = Icons.vaccines_outlined;
      iconColor = Colors.blue;
    } else {
      notificationIcon = Icons.notifications_outlined;
      iconColor = Theme.of(context).primaryColor;
    }

    return Dismissible(
      key: Key(notification.id),
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(
          Icons.delete_outline,
          color: Colors.white,
          size: 28,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return WarningConfirmationDialog(
              title: 'Xóa thông báo',
              content: const Text('Bạn có chắc chắn muốn xóa?'),
              primaryButtonText: 'Xác nhận',
              onPrimaryButtonPressed: () {
                Navigator.of(context).pop(true);
              },
              secondaryButtonText: 'Hủy',
              onSecondaryButtonPressed: () {
                Navigator.of(context).pop(false);
              },
            );
          },
        );
      },
      onDismissed: (direction) {
        context.read<NotificationBloc>().add(
            NotificationEvent.deleteNotificationById(
                notificationId: notification.id));
      },
      child: InkWell(
        onTap: () => _handleOnTap(notification),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: notification.isRead ? Colors.white : Colors.blue.shade50,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade200,
                width: 1,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  notificationIcon,
                  color: iconColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            notification.title,
                            style: TextStyle(
                              fontWeight: notification.isRead
                                  ? FontWeight.normal
                                  : FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _formatTimeAgo(
                              DateTime.parse(notification.createdAt)),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification.content,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        height: 1.4,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    // if (notification.cageId != null)
                    //   Row(
                    //     children: [
                    //       Icon(
                    //         Icons.home_outlined,
                    //         size: 14,
                    //         color: Colors.grey.shade600,
                    //       ),
                    //       const SizedBox(width: 4),
                    //       Text(
                    //         notification.cageId!.substring(0, 4),
                    //         style: TextStyle(
                    //           fontSize: 12,
                    //           color: Colors.grey.shade600,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                  ],
                ),
              ),
              if (!notification.isRead)
                Container(
                  margin: const EdgeInsets.only(left: 8, top: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearIcons.emptyBoxIcon,
          const SizedBox(height: 24),
          Text(
            'Không có thông báo',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Bạn sẽ nhận được thông báo khi có sự kiện mới',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationBloc, NotificationState>(
      listener: (context, state) {
        state.maybeWhen(
          getNotificationsByUserIdInProgress: () {
            setState(() {
              _isLoading = true;
            });
          },
          getNotificationsByUserIdSuccess: (notifications) {
            setState(() {
              _allNotifications = notifications;
              _unreadNotifications = notifications
                  .where((notification) => !notification.isRead)
                  .toList();
              _isLoading = false;
            });
          },
          getNotificationsByUserIdFailure: (error) {
            setState(() {
              _isLoading = false;
            });
          },
          markReadNotificationInProgress: () {},
          markReadNotificationSuccess: (notification) {
            _navigateToDetails(notification);
            _loadNotifications();
          },
          markReadNotificationFailure: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error),
                duration: const Duration(seconds: 2),
              ),
            );
          },
          markReadAllNotificationInProgress: () {
            setState(() {
              _isLoading = true;
            });
          },
          markReadAllNotificationSuccess: () {
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Đã đánh dấu tất cả thông báo là đã đọc'),
                duration: Duration(seconds: 2),
              ),
            );
            _loadNotifications();
          },
          markReadAllNotificationFailure: (error) {
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error),
                duration: const Duration(seconds: 2),
              ),
            );
          },
          deleteNotificationByIdInProgress: () {
            setState(() {
              _isLoading = true;
            });
          },
          deleteNotificationByIdSuccess: () {
            setState(() {
              _isLoading = false;
            });
            _loadNotifications();
          },
          deleteNotificationByIdFailure: (error) {
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error),
                duration: const Duration(seconds: 2),
              ),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: CustomAppBar(
          title: Text(
            'Thông báo',
            style:
                Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 22),
          ),
          centerTitle: false,
          appBarHeight: MediaQuery.of(context).size.height * 0.08,
          actions: [
            if (_unreadNotifications.isNotEmpty)
              IconButton(
                icon: const Icon(Icons.done_all_outlined),
                tooltip: 'Đánh dấu tất cả là đã đọc',
                onPressed: _markAllAsRead,
              ),
            IconButton(
              icon: const Icon(Icons.refresh_outlined),
              tooltip: 'Làm mới',
              onPressed: _refreshNotifications,
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Theme.of(context).primaryColor,
                tabs: [
                  Tab(
                    text: 'Tất cả (${_allNotifications.length})',
                  ),
                  Tab(
                    text: 'Chưa đọc (${_unreadNotifications.length})',
                  ),
                ],
              ),
            ),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : TabBarView(
                      controller: _tabController,
                      children: [
                        // Tab Tất cả
                        _allNotifications.isEmpty
                            ? _buildEmptyState()
                            : RefreshIndicator(
                                onRefresh: _refreshNotifications,
                                child: ListView.builder(
                                  itemCount: _allNotifications.length,
                                  itemBuilder: (context, index) {
                                    return _buildNotificationItem(
                                        _allNotifications[index]);
                                  },
                                ),
                              ),

                        // Tab Chưa đọc
                        _unreadNotifications.isEmpty
                            ? _buildEmptyState()
                            : RefreshIndicator(
                                onRefresh: _refreshNotifications,
                                child: ListView.builder(
                                  itemCount: _unreadNotifications.length,
                                  itemBuilder: (context, index) {
                                    return _buildNotificationItem(
                                        _unreadNotifications[index]);
                                  },
                                ),
                              ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
