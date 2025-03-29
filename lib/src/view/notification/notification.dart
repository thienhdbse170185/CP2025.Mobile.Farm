import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';

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
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = true;
  List<NotificationModel> _allNotifications = [];
  List<NotificationModel> _unreadNotifications = [];

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
    // Giả lập việc tải dữ liệu
    await Future.delayed(const Duration(seconds: 1));

    // Tạo dữ liệu mẫu
    final List<NotificationModel> notifications = [
      NotificationModel(
          id: "c4a9dc4a-ffd9-4613-9eaf-caa8c5ee9138",
          userId: "babc4332-d7d8-457b-af12-765a992c4314",
          content:
              "Một báo cáo triệu chứng mới từ Cage 1 đã được gửi vào lúc 03/28/2025 20:08:14.\r\nVui lòng kiểm tra và xử lý kịp thời để đảm bảo sức khỏe cho vật nuôi.",
          title: "Bạn có báo cáo bệnh mới",
          createdAt: DateTime.parse("2025-03-28T20:08:14.167"),
          isRead: false,
          medicalSymptomId: "e31cce63-857c-4009-abc3-24b5c5bf4cc2",
          cageId: "f37f0727-435d-4d80-9c29-ae2f41b49c9d"),
      NotificationModel(
          id: "d5b0ed5b-6fe0-4723-8eag-dba9d3e0c239",
          userId: "babc4332-d7d8-457b-af12-765a992c4314",
          content:
              "Nhiệm vụ 'Kiểm tra khẩu phần ăn' đã đến hạn cho Cage 2. Vui lòng thực hiện và cập nhật trạng thái.",
          title: "Nhiệm vụ cần thực hiện",
          createdAt: DateTime.parse("2025-03-28T15:30:00.000"),
          isRead: false,
          taskId: "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
          cageId: "g48f1738-546e-5e91-0d30-bf3f52c50d0e"),
      NotificationModel(
          id: "e6c1fe6c-7gf1-5834-9fbh-ecb0e4f1d340",
          userId: "babc4332-d7d8-457b-af12-765a992c4314",
          content:
              "Cage 3 đã đạt đến mốc trọng lượng tiêu chuẩn. Vui lòng kiểm tra và cập nhật kế hoạch dinh dưỡng phù hợp.",
          title: "Cập nhật trọng lượng",
          createdAt: DateTime.parse("2025-03-27T09:15:22.345"),
          isRead: true,
          cageId: "h59g2849-657f-6f02-1e41-cg4g63d61e1f"),
      NotificationModel(
          id: "f7d2gf7d-8hg2-6945-0gci-fdc1f5g2e451",
          userId: "babc4332-d7d8-457b-af12-765a992c4314",
          content:
              "Hệ thống đã phát hiện nhiệt độ bất thường ở Cage 4. Vui lòng kiểm tra hệ thống điều hòa và đảm bảo môi trường thích hợp cho vật nuôi.",
          title: "Cảnh báo nhiệt độ bất thường",
          createdAt: DateTime.parse("2025-03-26T14:45:10.789"),
          isRead: true,
          cageId: "i60h3950-768g-7g13-2f52-dh5h74e72f2g"),
      NotificationModel(
          id: "g8e3hg8e-9ih3-7056-1hdj-gee2g6h3f562",
          userId: "babc4332-d7d8-457b-af12-765a992c4314",
          content:
              "Lịch tiêm vaccine cho Cage 5 đã được cập nhật. Vui lòng xem chi tiết và lên kế hoạch thực hiện.",
          title: "Cập nhật lịch tiêm vaccine",
          createdAt: DateTime.parse("2025-03-25T11:20:05.234"),
          isRead: false,
          cageId: "j71i4061-879h-8h24-3g63-ei6i85f83g3h"),
    ];

    setState(() {
      _allNotifications = notifications;
      _unreadNotifications =
          notifications.where((notification) => !notification.isRead).toList();
      _isLoading = false;
    });
  }

  Future<void> _refreshNotifications() async {
    setState(() {
      _isLoading = true;
    });
    await _loadNotifications();
  }

  void _markAsRead(NotificationModel notification) {
    setState(() {
      final index =
          _allNotifications.indexWhere((n) => n.id == notification.id);
      if (index != -1) {
        _allNotifications[index] = NotificationModel(
          id: notification.id,
          userId: notification.userId,
          content: notification.content,
          title: notification.title,
          createdAt: notification.createdAt,
          isRead: true,
          taskId: notification.taskId,
          medicalSymptomId: notification.medicalSymptomId,
          cageId: notification.cageId,
        );

        _unreadNotifications.removeWhere((n) => n.id == notification.id);
      }
    });

    // Ở đây sẽ là API call để cập nhật trạng thái đã đọc trên server
    // markNotificationAsRead(notification.id);
  }

  void _markAllAsRead() {
    setState(() {
      _allNotifications = _allNotifications
          .map((notification) => NotificationModel(
                id: notification.id,
                userId: notification.userId,
                content: notification.content,
                title: notification.title,
                createdAt: notification.createdAt,
                isRead: true,
                taskId: notification.taskId,
                medicalSymptomId: notification.medicalSymptomId,
                cageId: notification.cageId,
              ))
          .toList();

      _unreadNotifications = [];
    });

    // Ở đây sẽ là API call để cập nhật tất cả thông báo đã đọc trên server
    // markAllNotificationsAsRead();
  }

  void _navigateToDetails(NotificationModel notification) {
    // Đánh dấu thông báo là đã đọc
    if (!notification.isRead) {
      _markAsRead(notification);
    }

    // Điều hướng dựa vào loại thông báo
    if (notification.medicalSymptomId != null) {
      // Điều hướng đến trang báo cáo triệu chứng
      // Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalSymptomDetailsScreen(id: notification.medicalSymptomId!)));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Đang điều hướng đến báo cáo triệu chứng ID: ${notification.medicalSymptomId}')),
      );
    } else if (notification.taskId != null) {
      // Điều hướng đến trang nhiệm vụ
      // Navigator.push(context, MaterialPageRoute(builder: (context) => TaskDetailsScreen(id: notification.taskId!)));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Đang điều hướng đến nhiệm vụ ID: ${notification.taskId}')),
      );
    } else if (notification.cageId != null) {
      // Điều hướng đến trang thông tin chuồng
      // Navigator.push(context, MaterialPageRoute(builder: (context) => CageDetailsScreen(id: notification.cageId!)));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Đang điều hướng đến thông tin chuồng ID: ${notification.cageId}')),
      );
    }
  }

  String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
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

  Widget _buildNotificationItem(NotificationModel notification) {
    final bool isToday = notification.createdAt.day == DateTime.now().day &&
        notification.createdAt.month == DateTime.now().month &&
        notification.createdAt.year == DateTime.now().year;

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
            return AlertDialog(
              title: const Text('Xác nhận'),
              content: const Text('Bạn có chắc chắn muốn xóa thông báo này?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Hủy'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Xóa'),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (direction) {
        setState(() {
          _allNotifications.removeWhere((item) => item.id == notification.id);
          if (!notification.isRead) {
            _unreadNotifications
                .removeWhere((item) => item.id == notification.id);
          }
        });

        // Ở đây sẽ là API call để xóa thông báo
        // deleteNotification(notification.id);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đã xóa thông báo'),
            duration: Duration(seconds: 2),
          ),
        );
      },
      child: InkWell(
        onTap: () => _navigateToDetails(notification),
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
                          _formatTimeAgo(notification.createdAt),
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
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    if (notification.cageId != null)
                      Row(
                        children: [
                          Icon(
                            Icons.home_outlined,
                            size: 14,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Chuồng ${notification.cageId!.substring(0, 4)}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
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
    return Scaffold(
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
    );
  }
}
