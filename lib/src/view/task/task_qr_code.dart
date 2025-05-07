import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/warning_confirm_dialog.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/constants/task_type_data_constant.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/model/dto/egg_harvest/egg_harvest_dto.dart';
import 'package:smart_farm/src/model/dto/index.dart';
import 'package:smart_farm/src/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:smart_farm/src/model/entity/task/tash_type/task_type.dart';
import 'package:smart_farm/src/view/symptom/cage_option.dart';
import 'package:smart_farm/src/viewmodel/index.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';
import 'package:smart_farm/src/viewmodel/task_qr_code/task_qr_code_cubit.dart';

class TaskQRCodeWidget extends StatefulWidget {
  const TaskQRCodeWidget({super.key, required this.cage});
  final CageOption cage;

  @override
  State<TaskQRCodeWidget> createState() => _TaskQRCodeWidgetState();
}

class _TaskQRCodeWidgetState extends State<TaskQRCodeWidget> {
  bool _isProcessing = false;
  bool _isLoading = false;

  List<TaskHaveCageName>? _tasks;
  List<TaskHaveCageName>? _filteredTasks;

  final TextEditingController logController = TextEditingController();
  final TextEditingController morningController = TextEditingController();
  final TextEditingController noonController = TextEditingController();
  final TextEditingController afternoonController = TextEditingController();
  final TextEditingController eveningController = TextEditingController();

  final Set<String> _selectedTaskIds = {};
  final TextEditingController _searchController = TextEditingController();

  List<double> weightList = [];

  double? recommendedWeight;
  double actualWeight = 0;
  DateTime? logTime;
  TaskHaveCageName? _processingTask;
  String _selectedTaskType = 'all';
  String _selectedStatus = 'all';
  String _sortBy = 'status'; // 'time', 'name', 'status'
  bool _sortAscending = true;
  String? _username;
  GrowthStageDto? growthStage;
  String? userName = '';
  String taskStatus = 'Loading...'; // Start directly at 'in progress'

  // --- Prescription related variables ---
  PrescriptionDto? prescription;
  String? prescriptionId;

  // --- Food related variables ---
  List<String> foodList = [
    "--- Chọn loại thức ăn ---",
    "Loại thức ăn 1",
    "Loại thức ăn 2",
    "Loại thức ăn 3"
  ];
  String? selectedFood = "--- Chọn loại thức ăn ---";

  // --- Vaccine related variables ---
  List<VaccineScheduleDto> vaccineScheduleList = [];
  VaccineScheduleLogDto? vaccineScheduleLog;
  VaccineScheduleDto? vaccineSchedule;

  // --- Animal sale related variables ---
  SaleTypeDto? saleType;
  DateTime? saleDate;

  // --- Egg harvest related variables ---
  EggHarvestDto? eggHarvest;

  // --- Upload image related variables ---
  UploadImageDto? uploadImage;

  // Thêm danh sách status options
  final List<Map<String, dynamic>> _statuses = [
    {
      'id': 'all',
      'name': 'Tất cả',
      'color': Colors.grey,
    },
    {
      'id': StatusDataConstant.pending,
      'name': StatusDataConstant.pendingVn,
      'color': Colors.blue,
    },
    {
      'id': StatusDataConstant.inProgress,
      'name': StatusDataConstant.inProgressVn,
      'color': Colors.orange,
    },
    {
      'id': StatusDataConstant.done,
      'name': StatusDataConstant.doneVn,
      'color': Colors.green,
    },
    {
      'id': StatusDataConstant.overdue,
      'name': StatusDataConstant.overdueVn,
      'color': Colors.red,
    },
  ];

  // Thêm biến để lưu danh sách task type từ API
  List<TaskType> availableTaskTypeFilters = [];

  // Xóa _taskTypes hardcode và thay bằng hàm build từ availableTaskTypeFilters
  List<Map<String, dynamic>> _buildTaskTypeOptions() {
    return [
      {
        'id': 'all',
        'name': 'Tất cả',
        'icon': Icons.all_inclusive,
      },
      ...availableTaskTypeFilters.map((type) => {
            'id': type.taskTypeId,
            'name': type.taskTypeName,
            'icon': _getTaskTypeIcon(type.taskTypeId),
          }),
    ];
  }

  // Helper function để map taskTypeId sang icon
  IconData _getTaskTypeIcon(String taskTypeId) {
    switch (taskTypeId) {
      case TaskTypeDataConstant.feeding:
        return Icons.restaurant;
      case TaskTypeDataConstant.health:
        return Icons.medical_services;
      case TaskTypeDataConstant.vaccin:
        return Icons.vaccines;
      default:
        return Icons.work_outline;
    }
  }

  // Thêm sort options
  final List<Map<String, dynamic>> _sortOptions = [
    {
      'id': 'time',
      'name': 'Thời gian',
      'icon': Icons.access_time,
    },
    {
      'id': 'name',
      'name': 'Tên',
      'icon': Icons.sort_by_alpha,
    },
    {
      'id': 'status',
      'name': 'Trạng thái',
      'icon': Icons.flag_outlined,
    },
  ];

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const UserEvent.getUserProfile());
    context.read<TaskBloc>().add(
        TaskEvent.getTasksByScanQRCode('', '', '', widget.cage.id, 1, 100));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _saveSelectedTasks() {
    if (_selectedTaskIds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Chưa có công việc nào được chọn'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    // Update all selected tasks
    context.read<TaskBloc>().add(
          TaskEvent.updateMultipleTask(
            _selectedTaskIds.toList(),
            StatusDataConstant.done,
          ),
        );

    // Clear selection after saving
    setState(() {
      _selectedTaskIds.clear();
    });
  }

  void _sortTasks() {
    if (_tasks == null || _tasks!.isEmpty) return;

    setState(() {
      _filteredTasks = List.from(_tasks!);

      _filteredTasks!.sort((a, b) {
        int compare;
        switch (_sortBy) {
          case 'time':
            compare =
                DateTime.parse(a.dueDate).compareTo(DateTime.parse(b.dueDate));
            break;
          case 'name':
            compare = a.taskName.compareTo(b.taskName);
            break;
          case 'status':
            final statusPriority = {
              StatusDataConstant.pending: 0,
              StatusDataConstant.inProgress: 1,
              StatusDataConstant.done: 2,
              StatusDataConstant.overdue: 3,
            };
            compare = (statusPriority[a.status] ?? 0)
                .compareTo(statusPriority[b.status] ?? 0);
            break;
          default:
            return 0;
        }
        return _sortAscending ? compare : -compare;
      });
    });

    log("taskSorted: $_filteredTasks");
  }

  // Hàm filter tasks
  void _filterTasks({String? searchQuery}) {
    if (_tasks == null) return;

    if (searchQuery != null && searchQuery.isNotEmpty) {
      context.read<TaskBloc>().add(TaskEvent.getTasksByScanQRCode(
            searchQuery,
            _selectedStatus == 'all' ? null : _selectedStatus,
            _selectedTaskType == 'all' ? null : _selectedTaskType,
            widget.cage.id,
            1,
            100,
          ));
    } else {
      context.read<TaskBloc>().add(TaskEvent.getTasksByScanQRCode(
            '',
            _selectedStatus == 'all' ? null : _selectedStatus,
            _selectedTaskType == 'all' ? null : _selectedTaskType,
            widget.cage.id,
            1,
            100,
          ));
    }
  }

  // Add new UI building methods for filter and sort buttons
  Widget _buildFilterButton() {
    final activeCount = _getActiveFilterCount();

    return Material(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: _showStatusBottomSheet,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.filter_list,
                size: 20,
                color: activeCount > 0
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
              if (activeCount > 0)
                Container(
                  margin: EdgeInsets.only(left: 4),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    activeCount.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Build sort button
  Widget _buildSortButton() {
    return Material(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: _showTaskTypeBottomSheet,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Icon(
            Icons.sort,
            size: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }

  // Count number of active filters (reuse this for the badge display)
  int _getActiveFilterCount() {
    int count = 0;
    // Add your existing filter count logic here
    // For example:
    if (_selectedStatus != 'all') count++;
    if (_selectedTaskType != 'all') count++;
    // Add other filters as needed
    return count;
  }

  // Check if any filter is active
  bool _hasActiveFilters() {
    // Add your existing logic to check if any filter is active
    return _selectedStatus != 'all' || _selectedTaskType != 'all';
    // Add other filters as needed
  }

  // Add active filter chips display function
  List<Widget> _buildActiveFilterChips() {
    List<Widget> chips = [];

    // Status Chip (if status is selected)
    if (_selectedStatus != 'all') {
      final statusInfo = _statuses.firstWhere(
        (s) => s['id'] == _selectedStatus,
        orElse: () => _statuses[0],
      );

      chips.add(
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Chip(
            labelStyle: TextStyle(fontSize: 12, color: statusInfo['color']),
            backgroundColor: statusInfo['color'].withOpacity(0.1),
            visualDensity: VisualDensity.compact,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            label: Text(statusInfo['name']),
            deleteIcon: Icon(Icons.close, size: 16, color: statusInfo['color']),
            onDeleted: () {
              setState(() {
                _selectedStatus = 'all';
              });
              // Add your filter update logic here
            },
          ),
        ),
      );
    }

    // Task Type Chip (if task type is selected)
    if (_selectedTaskType != 'all') {
      final taskTypeInfo = availableTaskTypeFilters.firstWhere(
        (t) => t.taskTypeId == _selectedTaskType,
        orElse: () => TaskType(taskTypeId: '', taskTypeName: ''),
      );

      chips.add(
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Chip(
            labelStyle: TextStyle(fontSize: 12),
            visualDensity: VisualDensity.compact,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            label: Text(taskTypeInfo.taskTypeName),
            deleteIcon: Icon(Icons.close, size: 16),
            onDeleted: () {
              setState(() {
                _selectedTaskType = 'all';
              });
              // Add your filter update logic here
            },
          ),
        ),
      );
    }

    // Add other filter chips as needed

    return chips;
  }

  void _handleClose() {
    showDialog(
        context: context,
        builder: (context) {
          return WarningConfirmationDialog(
            title: 'Xác nhận',
            content: const Text('Bạn có chắc chắn muốn thoát không?'),
            onPrimaryButtonPressed: () {
              context.go(RouteName.home);
            },
            onSecondaryButtonPressed: () {
              context.pop(); // Close the dialog
            },
            primaryButtonText: 'Xác nhận',
            secondaryButtonText: 'Đóng',
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TaskBloc, TaskState>(
          listener: (context, state) {
            state.maybeWhen(
              getTasksByScanQRCodeLoading: () {
                log("Đang tải thông tin công việc...");
                setState(() {
                  _isLoading = true;
                });
              },
              getTasksByScanQRCodeSuccess: (tasks, taskTypeList) {
                setState(() {
                  _tasks = tasks;
                  _filteredTasks = tasks;
                  availableTaskTypeFilters = taskTypeList;
                });
                _sortTasks(); // Sort tasks after fetching
                setState(() {
                  _isLoading = false;
                });
              },
              getTasksByScanQRCodeFailure: (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Không thể tải danh sách công việc')),
                );
                setState(() {
                  _isLoading = false;
                });
              },
              updateMultipleTaskSuccess: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Cập nhật trạng thái công việc thành công'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                // Refresh task list
                context.read<TaskBloc>().add(TaskEvent.getTasksByScanQRCode(
                    _searchController.text,
                    _selectedStatus,
                    _selectedTaskType,
                    widget.cage.id,
                    1,
                    20));
              },
              updateMultipleTaskFailure: (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Không thể cập nhật trạng thái công việc'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<UserBloc, UserState>(listener: (context, state) {
          state.maybeWhen(
            getUserProfileInProgress: () {
              log('Đang lấy thông tin người dùng...');
            },
            getUserProfileSuccess: (username, email, _) {
              log('Lấy thông tin người dùng thành công!');
              setState(() {
                _username = username;
              });
            },
            getUserProfileFailure: (e) {
              log('Lấy thông tin người dùng thất bại!');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Lỗi: Không thể lấy thông tin người dùng')),
              );
            },
            orElse: () {},
          );
        }),
        BlocListener<TaskQrCodeCubit, TaskQrCodeState>(
          listener: (context, state) {
            state.maybeWhen(
              createFoodLogInProgress: () {
                setState(() {
                  _isProcessing = true;
                });
              },
              createFoodLogSuccess: () {
                context.pop();
                setState(() {
                  _isProcessing = false;
                });
                if (_processingTask != null) {
                  setState(() => _selectedTaskIds.add(_processingTask!.id));
                }
              },
              createFoodLogFailure: () async {
                context.pop();
                setState(() {
                  _isProcessing = false;
                });
              },
              orElse: () {},
            );
          },
        )
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<TaskBloc>().add(TaskEvent.getTasksByScanQRCode(
                _searchController.text,
                _selectedStatus,
                _selectedTaskType,
                widget.cage.id,
                1,
                20));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.4),
                  image: DecorationImage(
                    image: const AssetImage('assets/images/leaf.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.1),
                      BlendMode.dstATop,
                    ),
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with Title and Close button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Quét công việc',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: _handleClose,
                          ),
                        ],
                      ),
                    ),

                    // Optimized Search and Filter Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        children: [
                          // Expanded Search Bar
                          Expanded(
                            child: SearchBar(
                              controller: _searchController,
                              onChanged: (query) {
                                // Your existing search logic
                                setState(() {
                                  _filterTasks(searchQuery: query);
                                });
                              },
                              backgroundColor: WidgetStateProperty.all(
                                Theme.of(context).colorScheme.surface,
                              ),
                              shape: WidgetStateProperty.all(StadiumBorder(
                                  side: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ))),
                              hintText: 'Tìm kiếm công việc',
                              leading: Icon(Icons.search, size: 20),
                              trailing: [
                                _searchController.text.isNotEmpty
                                    ? IconButton(
                                        icon: Icon(Icons.clear, size: 20),
                                        onPressed: () {
                                          setState(() {
                                            _searchController.clear();
                                          });
                                          // Your existing clear search logic
                                          _filterTasks(searchQuery: '');
                                        },
                                      )
                                    : SizedBox.shrink(),
                              ],
                              padding: WidgetStateProperty.all(
                                EdgeInsets.symmetric(horizontal: 12.0),
                              ),
                              elevation: WidgetStateProperty.all(0),
                            ),
                          ),
                          // Filter Button
                          const SizedBox(width: 8),
                          _buildFilterButton(),
                          // Sort Button
                          const SizedBox(width: 8),
                          _buildSortButton(),
                        ],
                      ),
                    ),

                    // Active Filter Chips Row (only show if filters are applied)
                    if (_hasActiveFilters())
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: _buildActiveFilterChips(),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Rest of your existing content for task list/scanner
              Padding(
                  padding: const EdgeInsets.only(
                      left: 16, top: 16, right: 16, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Công việc hôm nay',
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                'Tại chuồng: ',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                widget.cage.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text('${_isLoading ? '...' : _tasks?.length} công việc')
                    ],
                  )),
              // Tasks List
              _isLoading
                  ? Expanded(child: Center(child: CircularProgressIndicator()))
                  : Expanded(
                      child: _filteredTasks == null
                          ? const Center(child: CircularProgressIndicator())
                          : _filteredTasks!.isEmpty
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.task_outlined,
                                        size: 64,
                                        color: Colors.grey[400],
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        'Không có công việc nào',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: _filteredTasks!.length,
                                  padding: const EdgeInsets.only(
                                      left: 16, top: 16, right: 16, bottom: 80),
                                  itemBuilder: (context, index) {
                                    final task = _filteredTasks![index];
                                    return TaskCard(
                                      task: task,
                                      actualWeight: actualWeight.toInt(),
                                      recommendedWeight:
                                          recommendedWeight?.toInt(),
                                      onStatusChanged: (newStatus) {
                                        // Handle status change
                                        context.read<TaskBloc>().add(
                                              TaskEvent.updateTask(
                                                task.id,
                                                newStatus,
                                              ),
                                            );
                                      },
                                      isSelected:
                                          _selectedTaskIds.contains(task.id),
                                      onSelected: (bool? value) {
                                        if (value == true) {
                                          if ([
                                            TaskTypeDataConstant.feeding,
                                            TaskTypeDataConstant.health,
                                            TaskTypeDataConstant.vaccin,
                                            TaskTypeDataConstant.sellAnimal,
                                          ].contains(
                                              task.taskType.taskTypeName)) {
                                            context.push(RouteName.taskReport,
                                                extra: {
                                                  'task': task,
                                                  'source': 'qrcode',
                                                }).then((result) {
                                              if (result != null &&
                                                  result
                                                      is Map<String, dynamic>) {
                                                if (result['reload'] == true &&
                                                    result['source'] ==
                                                        'qrcode') {
                                                  // Refresh task list
                                                  context.read<TaskBloc>().add(
                                                      TaskEvent
                                                          .getTasksByScanQRCode(
                                                              _searchController
                                                                  .text,
                                                              _selectedStatus,
                                                              _selectedTaskType,
                                                              widget.cage.id,
                                                              1,
                                                              20));
                                                }
                                              }
                                            });
                                          } else {
                                            setState(() =>
                                                _selectedTaskIds.add(task.id));
                                          }
                                        } else {
                                          setState(() =>
                                              _selectedTaskIds.remove(task.id));
                                        }
                                      },
                                    );
                                  },
                                ),
                    ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding:
              EdgeInsets.only(bottom: (_selectedTaskIds.isNotEmpty ? 80 : 0)),
          child: FloatingActionButton.extended(
            onPressed: () {
              context.push(RouteName.createSymptom, extra: {
                'cageName': widget.cage.name,
              });
            },
            icon: const Icon(Icons.add_alert),
            label: const Text('Báo bệnh'),
          ),
        ),
        bottomSheet: _selectedTaskIds.isNotEmpty
            ? Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Đã thực hiện',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                        ),
                        Text(
                          '${_selectedTaskIds.length} công việc',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    FilledButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => WarningConfirmationDialog(
                                  title: 'Lưu công việc',
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        child: Card.outlined(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 16.0,
                                              top: 16.0,
                                              bottom: 16.0,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Các công việc đã chọn:',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                ..._selectedTaskIds.map(
                                                    (taskId) => Text(
                                                        _filteredTasks!
                                                            .firstWhere(
                                                                (task) =>
                                                                    task.id ==
                                                                    taskId)
                                                            .taskName,
                                                        style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary,
                                                        ))),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        'Bạn có chắc chắn muốn cập nhật trạng thái cho các công việc đã chọn?',
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  onPrimaryButtonPressed: () {
                                    Navigator.pop(context); // Close dialog

                                    _saveSelectedTasks();
                                  },
                                  onSecondaryButtonPressed: () {
                                    Navigator.pop(context); // Close dialog
                                  },
                                  primaryButtonText: 'Xác nhận',
                                  secondaryButtonText: 'Hủy',
                                ));
                      },
                      child: const Text('Xác nhận hoàn thành'),
                    ),
                  ],
                ),
              )
            : null,
      ),
    );
  }

  void _showStatusBottomSheet() {
    // Modify existing bottom sheet to match the style from task.dart
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 8),
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lọc công việc',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (_hasActiveFilters())
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedStatus = 'all';
                          _selectedTaskType = 'all';
                          // Reset other filters as needed
                        });
                        Navigator.pop(context);
                      },
                      child: Text('Xóa bộ lọc'),
                    ),
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: ListView(
                controller: scrollController,
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  // Status Section
                  _buildFilterSection(
                    title: 'Trạng thái',
                    icon: Icons.flag_outlined,
                    options: _statuses,
                    selectedValue: _selectedStatus,
                    onSelected: (value) {
                      setState(() {
                        _selectedStatus = value;
                      });
                    },
                    isColoredOption: true,
                  ),
                  Divider(),

                  // Task Type Section
                  _buildFilterSection(
                    title: 'Loại công việc',
                    icon: Icons.work_outline,
                    options: _buildTaskTypeOptions(),
                    selectedValue: _selectedTaskType,
                    onSelected: (value) {
                      setState(() {
                        _selectedTaskType = value;
                      });
                    },
                  ),

                  // Add other filter sections as needed
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Your existing filter apply logic
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Áp dụng'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Add method to build filter sections in bottom sheet
  Widget _buildFilterSection({
    required String title,
    required IconData icon,
    required List<Map<String, dynamic>> options,
    required String selectedValue,
    required Function(String) onSelected,
    bool isColoredOption = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.map((option) {
            final bool isSelected =
                option['id'].toString() == selectedValue.toString();

            return InkWell(
              onTap: () => onSelected(option['id'].toString()),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? (isColoredOption && option['id'] != 'all'
                          ? option['color'].withOpacity(0.1)
                          : Theme.of(context).colorScheme.primaryContainer)
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                  border: isSelected
                      ? Border.all(
                          color: isColoredOption && option['id'] != 'all'
                              ? option['color']
                              : Theme.of(context).colorScheme.primary,
                          width: 1,
                        )
                      : null,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (option['image'] != null)
                      Image.asset(option['image'], width: 16, height: 16)
                    else if (isColoredOption && option['id'] != 'all')
                      Icon(
                        Icons.circle,
                        size: 12,
                        color: option['color'],
                      )
                    else if (option['icon'] != null)
                      Icon(
                        option['icon'],
                        size: 16,
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : null,
                      ),
                    SizedBox(width: 6),
                    Text(
                      option['name'],
                      style: TextStyle(
                        fontSize: 14,
                        color: isSelected
                            ? (isColoredOption && option['id'] != 'all'
                                ? option['color']
                                : Theme.of(context).colorScheme.primary)
                            : null,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 8),
      ],
    );
  }

  // Update the existing sort bottom sheet method with new UI
  void _showTaskTypeBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(top: 8),
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.sort),
                SizedBox(width: 8),
                Text(
                  'Sắp xếp theo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          ListView(
            shrinkWrap: true,
            children: _sortOptions.map((option) {
              final bool isSelected = _sortBy == option['id'];
              return ListTile(
                leading: Icon(
                  option['icon'] as IconData,
                  color:
                      isSelected ? Theme.of(context).colorScheme.primary : null,
                ),
                title: Text(
                  option['name'],
                  style: TextStyle(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : null,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                trailing: isSelected
                    ? Icon(
                        _sortAscending
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : null,
                onTap: () {
                  setState(() {
                    if (_sortBy == option['id']) {
                      _sortAscending = !_sortAscending;
                    } else {
                      _sortBy = option['id'];
                      _sortAscending = true;
                    }
                  });
                  Navigator.pop(context);
                  // Your existing sort application logic
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final TaskHaveCageName task;
  final Function(String) onStatusChanged;
  final bool isSelected;
  final Function(bool?) onSelected;
  final int? actualWeight;
  final int? recommendedWeight;
  final PrescriptionDto? prescription;

  const TaskCard({
    super.key,
    required this.task,
    required this.onStatusChanged,
    required this.isSelected,
    required this.onSelected,
    this.actualWeight,
    this.recommendedWeight,
    this.prescription,
  });

  Widget _buildLogInfo(BuildContext context, TaskHaveCageName task) {
    if (!isSelected) return const SizedBox.shrink();

    String logInfo = '';
    Widget? icon;
    Color? color;

    switch (task.taskType.taskTypeName) {
      case TaskTypeDataConstant.feeding:
        logInfo = 'Đã cho ăn: ${actualWeight}g';
        icon = Icon(
          Icons.restaurant_rounded,
          size: 16,
          color: Theme.of(context).colorScheme.primary,
        );
        color = Theme.of(context).colorScheme.primary;
        break;
      case TaskTypeDataConstant.health:
        logInfo = 'Đã cho uống thuốc';
        icon = Icon(
          Icons.medical_services_rounded,
          size: 16,
          color: Theme.of(context).colorScheme.tertiary,
        );
        color = Theme.of(context).colorScheme.tertiary;
        break;
      case TaskTypeDataConstant.vaccin:
        logInfo = 'Đã tiêm vắc xin';
        icon = Icon(
          Icons.vaccines_rounded,
          size: 16,
          color: Theme.of(context).colorScheme.secondary,
        );
        color = Theme.of(context).colorScheme.secondary;
        break;
      default:
        return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 4),
          Text(
            logInfo,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (task.taskType.taskTypeName == TaskTypeDataConstant.feeding) ...[
            const SizedBox(width: 4),
            Text(
              '(Khuyến nghị: ${recommendedWeight}g)',
              style: TextStyle(
                fontSize: 12,
                color: color.withOpacity(0.7),
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = task.status == StatusDataConstant.done;
    final bool needsLog = [
      TaskTypeDataConstant.feeding,
      TaskTypeDataConstant.health,
      TaskTypeDataConstant.vaccin
    ].contains(task.taskType.taskTypeName);

    return Card.outlined(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          context.push(RouteName.taskDetail, extra: task.id);
        },
        // borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 10),
          // padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (!isCompleted)
                    Row(
                      children: [
                        Checkbox(
                          value: isSelected,
                          onChanged: needsLog
                              ? (value) {
                                  if (value == false) {
                                    onSelected(false);
                                  } else {
                                    onSelected(true);
                                  }
                                }
                              : onSelected,
                          activeColor: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  Expanded(
                    child: Text(
                      task.taskName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color:
                            isCompleted ? Theme.of(context).primaryColor : null,
                        // decoration:
                        //     isCompleted ? TextDecoration.lineThrough : null,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                task.description,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    DateFormat('HH:mm, dd/MM/yyyy')
                        .format(DateTime.parse(task.dueDate)),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  _buildStatusChip(context),
                ],
              ),
              _buildLogInfo(context, task),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context) {
    Color color;
    String label;

    switch (task.status) {
      case StatusDataConstant.done:
        color = Colors.green;
        label = StatusDataConstant.doneVn;
        break;
      case StatusDataConstant.inProgress:
        color = Colors.orange;
        label = StatusDataConstant.inProgressVn;
        break;
      case StatusDataConstant.pending:
        color = Colors.blue;
        label = StatusDataConstant.pendingVn;
        break;
      case StatusDataConstant.overdue:
        color = Colors.red;
        label = StatusDataConstant.overdueVn;
        break;
      default:
        color = Colors.grey;
        label = 'Không xác định';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
