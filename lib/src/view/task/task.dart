import 'dart:async';
import 'dart:developer';

import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:data_layer/model/entity/task/tash_type/task_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/constants/task_type_data_constant.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/model/task/cage_filter.dart';
import 'package:smart_farm/src/view/widgets/task_list.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget>
    with SingleTickerProviderStateMixin {
  DateTime selectedDate = TimeUtils.customNow(); // Store the selected date
  String selectedFilter = 'Tất cả'; // Default filter
  List<CageFilter> availableCageFilters = []; // List of available cage filters
  Map<String, List<TaskHaveCageName>> taskSorted = {}; // Updated to Map
  bool _isProcessing = false;

  final TextEditingController _searchController = TextEditingController();

  // Add new states for sorting and filtering
  String _sortBy = 'time'; // 'time', 'name', 'status'
  bool _sortAscending = true;
  String _selectedTaskType = 'all';
  int? _selectedSession;

  Timer? _debounce;

  // Filter states
  String _selectedCage = 'all';

  // Thêm biến cho status filter
  String _selectedStatus = 'all';

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

  // Thay thế _taskTypes hardcode bằng danh sách từ API
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

  String _getCurrentSessionName() {
    int currentSession = TimeUtils.getCurrentSession();
    switch (currentSession) {
      case 1:
        return 'Buổi sáng';
      case 2:
        return 'Buổi trưa';
      case 3:
        return 'Buổi chiều';
      case 4:
        return 'Buổi tối';
      default:
        return 'Buổi khuya';
    }
  }

  String _getCurrentSessionImage() {
    int currentSession = TimeUtils.getCurrentSession();
    String imagePath = '';
    switch (currentSession) {
      case 1:
        imagePath = 'assets/images/morning.png';
      case 2:
        imagePath = 'assets/images/noon.png';
      case 3:
        imagePath = 'assets/images/afternoon.png';
      case 4:
        imagePath = 'assets/images/moon.png';
      default:
        imagePath = 'assets/images/moon.png';
    }
    return imagePath;
  }

  // Session options
  final List<Map<String, dynamic>> _sessions = [
    {'id': 'all', 'name': 'Tất cả'},
    {'id': 1, 'name': 'Buổi sáng'},
    {'id': 2, 'name': 'Buổi trưa'},
    {'id': 3, 'name': 'Buổi chiều'},
    {'id': 4, 'name': 'Buổi tối'},
  ];

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

  // Thêm các biến để kiểm soát hiển thị và animation
  final ScrollController _scrollController = ScrollController();

  // Function to format the selected date to a string (e.g., "Nov 19, 2024")
  String get formattedDate {
    return DateFormat('EEEE, dd/MM/yyyy', 'vi').format(selectedDate);
  }

  // Function to get the day of the week for the selected date in Vietnamese
  String get dayOfWeek {
    return DateFormat('EEEE', 'vi_VN')
        .format(selectedDate); // Full day name in Vietnamese (e.g., "Thứ Hai")
  }

  // Function to check if the selected date is today
  bool get isToday {
    final DateTime now = TimeUtils.customNow();
    return selectedDate.year == now.year &&
        selectedDate.month == now.month &&
        selectedDate.day == now.day;
  }

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2024),
          lastDate: DateTime(2026),
        )) ??
        selectedDate;

    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      // Call the API to fetch tasks for the selected date
      context
          .read<TaskBloc>()
          .add(TaskEvent.getTasksByUserIdAndDate(picked, null));
    }
  }

  @override
  void initState() {
    super.initState();
    // _scrollController.addListener(_onScroll);

    // Fetch tasks for the selected date when the widget is initialized
    // context
    //     .read<TaskBloc>()
    //     .add(TaskEvent.getTasksByUserIdAndDate(DateTime.now(), null));
    context.read<TaskBloc>().add(
        TaskEvent.getTasks('', '', '', '', TimeUtils.customNow(), null, 1, 20));
    _refreshTasks();
  }

  void _refreshTasks() {
    context.read<TaskBloc>().add(TaskEvent.getTasks(
          _searchController.text,
          _selectedStatus == 'all' ? null : _selectedStatus,
          _selectedTaskType == 'all' ? null : _selectedTaskType,
          _selectedCage == 'all' ? null : _selectedCage,
          selectedDate,
          _selectedSession,
          1,
          20,
        ));
  }

  @override
  void dispose() {
    // _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  // Hàm xử lý search với debounce
  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _filterTasks(searchQuery: query);
    });
  }

  // Hàm filter tasks
  void _filterTasks({String? searchQuery}) {
    if (taskSorted.isEmpty) return;

    if (searchQuery != null && searchQuery.isNotEmpty) {
      context.read<TaskBloc>().add(TaskEvent.getTasks(
            searchQuery,
            _selectedStatus == 'all' ? null : _selectedStatus,
            _selectedTaskType == 'all' ? null : _selectedTaskType,
            _selectedCage == 'all' ? null : _selectedCage,
            selectedDate,
            _selectedSession,
            1,
            20,
          ));
    } else {
      context.read<TaskBloc>().add(TaskEvent.getTasks(
            '',
            _selectedStatus == 'all' ? null : _selectedStatus,
            _selectedTaskType == 'all' ? null : _selectedTaskType,
            _selectedCage == 'all' ? null : _selectedCage,
            selectedDate,
            _selectedSession,
            1,
            20,
          ));
    }
  }

  // void _showTaskTypeBottomSheet() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) => Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.all(16),
  //           child: const Row(
  //             children: [
  //               Icon(Icons.work_outline),
  //               SizedBox(width: 16),
  //               Text(
  //                 'Chọn loại công việc',
  //                 style: TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Expanded(
  //           child: ListView(
  //             children: _buildTaskTypeOptions()
  //                 .map((type) => RadioListTile(
  //                       title: Row(
  //                         children: [
  //                           Icon(type['icon'] as IconData),
  //                           const SizedBox(width: 8),
  //                           Text(type['name']),
  //                         ],
  //                       ),
  //                       value: type['id'],
  //                       groupValue: _selectedTaskType,
  //                       onChanged: (value) {
  //                         setState(() {
  //                           _selectedTaskType = value.toString();
  //                         });
  //                         Navigator.pop(context);
  //                         _filterTasks();
  //                       },
  //                     ))
  //                 .toList(),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // void _showSessionBottomSheet() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) => Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.all(16),
  //           child: Row(
  //             children: [
  //               const Icon(Icons.access_time),
  //               const SizedBox(width: 8),
  //               const Text(
  //                 'Chọn buổi',
  //                 style: TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Expanded(
  //           child: ListView(
  //             children: [
  //               RadioListTile(
  //                 title: const Row(
  //                   children: [
  //                     Icon(Icons.all_inclusive),
  //                     SizedBox(width: 12),
  //                     Text('Tất cả'),
  //                   ],
  //                 ),
  //                 value: null,
  //                 groupValue: _selectedSession,
  //                 onChanged: (value) {
  //                   setState(() {
  //                     _selectedSession = null;
  //                   });
  //                   Navigator.pop(context);
  //                   _filterTasks();
  //                 },
  //               ),
  //               RadioListTile(
  //                 title: Row(
  //                   children: [
  //                     Image.asset('assets/images/morning.png',
  //                         width: 24, height: 24),
  //                     const SizedBox(width: 12),
  //                     const Text('Buổi sáng'),
  //                   ],
  //                 ),
  //                 value: 1,
  //                 groupValue: _selectedSession,
  //                 onChanged: (value) {
  //                   setState(() {
  //                     _selectedSession = 1;
  //                   });
  //                   Navigator.pop(context);
  //                   _filterTasks();
  //                 },
  //               ),
  //               RadioListTile(
  //                 title: Row(
  //                   children: [
  //                     Image.asset('assets/images/noon.png',
  //                         width: 24, height: 24),
  //                     const SizedBox(width: 12),
  //                     const Text('Buổi trưa'),
  //                   ],
  //                 ),
  //                 value: 2,
  //                 groupValue: _selectedSession,
  //                 onChanged: (value) {
  //                   setState(() {
  //                     _selectedSession = 2;
  //                   });
  //                   Navigator.pop(context);
  //                   _filterTasks();
  //                 },
  //               ),
  //               RadioListTile(
  //                 title: Row(
  //                   children: [
  //                     Image.asset('assets/images/afternoon.png',
  //                         width: 24, height: 24),
  //                     const SizedBox(width: 12),
  //                     const Text('Buổi trưa'),
  //                   ],
  //                 ),
  //                 value: 3,
  //                 groupValue: _selectedSession,
  //                 onChanged: (value) {
  //                   setState(() {
  //                     _selectedSession = 3;
  //                   });
  //                   Navigator.pop(context);
  //                   _filterTasks();
  //                 },
  //               ),
  //               RadioListTile(
  //                 title: Row(
  //                   children: [
  //                     Image.asset('assets/images/moon.png',
  //                         width: 24, height: 24),
  //                     const SizedBox(width: 12),
  //                     const Text('Buổi tối'),
  //                   ],
  //                 ),
  //                 value: 4,
  //                 groupValue: _selectedSession,
  //                 onChanged: (value) {
  //                   setState(() {
  //                     _selectedSession = 4;
  //                   });
  //                   Navigator.pop(context);
  //                   _filterTasks();
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // void _showCageBottomSheet() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) => Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.all(16),
  //           child: Row(
  //             children: [
  //               LinearIcons.chickenIcon,
  //               const SizedBox(width: 8),
  //               const Text(
  //                 'Chọn chuồng nuôi',
  //                 style: TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Expanded(
  //           child: ListView(
  //             children: [
  //               RadioListTile(
  //                 title: Row(
  //                   children: [
  //                     LinearIcons.farmHouseIcon,
  //                     const SizedBox(width: 12),
  //                     const Text('Tất cả'),
  //                   ],
  //                 ),
  //                 value: 'all',
  //                 groupValue: _selectedCage,
  //                 onChanged: (value) {
  //                   setState(() {
  //                     _selectedCage = value.toString();
  //                   });
  //                   Navigator.pop(context);
  //                   _filterTasks();
  //                 },
  //               ),
  //               ...availableCageFilters.map((cage) => RadioListTile(
  //                     title: Row(
  //                       children: [
  //                         LinearIcons.chickenIcon,
  //                         const SizedBox(width: 12),
  //                         Text(cage.cageName),
  //                       ],
  //                     ),
  //                     value: cage.cageId,
  //                     groupValue: _selectedCage,
  //                     onChanged: (value) {
  //                       setState(() {
  //                         _selectedCage = value.toString();
  //                       });
  //                       Navigator.pop(context);
  //                       _filterTasks();
  //                     },
  //                   )),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // // Thêm hàm show bottom sheet cho status
  // void _showStatusBottomSheet() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) => Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.all(16),
  //           child: const Row(
  //             children: [
  //               Icon(Icons.flag_outlined),
  //               SizedBox(width: 16),
  //               Text(
  //                 'Chọn trạng thái',
  //                 style: TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Expanded(
  //           child: ListView(
  //             children: _statuses
  //                 .map((status) => RadioListTile(
  //                       title: Row(
  //                         children: [
  //                           Icon(
  //                             status['id'] == 'all'
  //                                 ? Icons.all_inclusive
  //                                 : Icons.circle,
  //                             color: status['color'],
  //                             size: status['id'] == 'all' ? 24 : 12,
  //                           ),
  //                           const SizedBox(width: 12),
  //                           Text(
  //                             status['name'],
  //                             style: TextStyle(
  //                               color: status['color'],
  //                               fontWeight: FontWeight.w500,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       value: status['id'],
  //                       groupValue: _selectedStatus,
  //                       activeColor: status['color'],
  //                       onChanged: (value) {
  //                         setState(() {
  //                           _selectedStatus = value.toString();
  //                         });
  //                         Navigator.pop(context);
  //                         _filterTasks();
  //                       },
  //                     ))
  //                 .toList(),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Hàm sort tasks
  void _sortTasks() {
    if (taskSorted.isEmpty) return;

    setState(() {
      // Tạo một Map mới để lưu kết quả sort
      Map<String, List<TaskHaveCageName>> newSortedMap = {};

      // Xử lý từng session
      taskSorted.forEach((key, tasks) {
        // Tạo bản sao mới hoàn toàn của danh sách
        List<TaskHaveCageName> sortedTasks = List<TaskHaveCageName>.from(tasks);

        // Sort theo tiêu chí được chọn
        sortedTasks.sort((a, b) {
          int compare;
          switch (_sortBy) {
            case 'time':
              compare = DateTime.parse(a.dueDate)
                  .compareTo(DateTime.parse(b.dueDate));
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
              // Trả về danh sách theo thứ tự gốc
              return 0;
          }
          return _sortAscending ? compare : -compare;
        });

        // Thêm danh sách đã sort vào Map mới
        newSortedMap[key] = sortedTasks;
      });

      // Cập nhật state với Map mới
      taskSorted = newSortedMap;
    });

    log("taskSorted: $taskSorted");
  }

  // Update UI in build method
  @override
  Widget build(BuildContext context) {
    final availableLocations = taskSorted.values
        .expand(
            (tasks) => tasks.map((task) => task.cageName)) // Extract cageName
        .toSet();
    if (availableLocations.isNotEmpty) {
      availableLocations.add('Tất cả'); // Ensure 'Tất cả' is always available
    }

    return BlocListener<TaskBloc, TaskState>(
      listener: (context, state) {
        state.maybeWhen(
          getTasksInProgress: () {
            log("Đang lấy danh sách công việc...");
            setState(() {
              _isProcessing = true;
            });
          },
          getTasksSuccess: (tasks, cageList, taskTypeList) {
            log("Lấy danh sách công việc thành công!");
            setState(() {
              taskSorted = tasks;
              if (availableTaskTypeFilters.isEmpty) {
                availableTaskTypeFilters = taskTypeList;
              }
              if (availableCageFilters.isEmpty) {
                availableCageFilters = cageList;
              }
              _isProcessing = false;
            });
          },
          getTasksFailure: (e) {
            log("Lấy danh sách công việc thất bại! Message:");
            log(e.toString());
            setState(() {
              taskSorted = {};
              _isProcessing = false;
            });
          },
          getTasksByUserIdAndDateLoading: () {
            log("Đang lấy danh sách công việc...");
            setState(() {
              _isProcessing = true;
            });
          },
          getTasksByUserIdAndDateSuccess: (tasks, cageList) {
            // Update the tasksByDate list with the new tasks
            setState(() {
              taskSorted = tasks;
              availableCageFilters = cageList;
              _isProcessing = false;
            });
          },
          getTasksByUserIdAndDateFailure: (e) {
            if (e.contains('no-task-found')) {
              log("Không tìm thấy công việc!");
              setState(() {
                taskSorted = {};
                availableCageFilters = [];
                _isProcessing = false;
              });
            } else {
              log("Lấy danh sách công việc thất bại! Message:");
              log(e.toString());
              SnackBar(content: Text('Lỗi: ${e.toString()}'));
              _isProcessing = false;
            }
          },
          filteredTaskLoading: () {
            log("Đang lọc công việc...");
            setState(() {
              _isProcessing = true;
            });
          },
          filteredTasksSuccess: (filteredTasks) {
            log("Lọc công việc thành công!");
            setState(() {
              taskSorted = filteredTasks;
              _isProcessing = false;
            });
          },
          filteredTasksFailure: (e) {
            log("Lọc công việc thất bại! Message:");
            log(e.toString());
            setState(() {
              _isProcessing = false;
            });
          },
          updateStatusTaskSuccess: () async {
            log("Cập nhật trạng thái công việc thành công!");
            _refreshTasks();
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<TaskBloc>().add(TaskEvent.getTasks(
                _searchController.text,
                _selectedTaskType == 'all' ? null : _selectedTaskType,
                _selectedCage == 'all' ? null : _selectedCage,
                _selectedStatus == 'all' ? null : _selectedStatus,
                selectedDate,
                _selectedSession,
                1,
                20));
          },
          child: WillPopScope(
            onWillPop: () async {
              Navigator.pop(context, true); // Pass true to indicate success
              return false;
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
                      const SizedBox(height: 8.0),
                      // Date Selection row with session info
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  _getCurrentSessionImage(),
                                  width: 32,
                                  height: 32,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Buổi hiện tại',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                    Text(
                                      _getCurrentSessionName(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(fontSize: 22),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () => _selectDate(context),
                              child: Chip(
                                shape: const StadiumBorder(
                                    side: BorderSide(
                                        width: 0, color: Colors.transparent)),
                                label: Text(
                                  formattedDate,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                avatar: LinearIcons.calendarIcon,
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Optimized Search and Filter Bar
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            // Expanded Search Bar
                            Expanded(
                              child: SearchBar(
                                controller: _searchController,
                                onChanged: _onSearchChanged,
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
                            // Filter Button with Active Filter Count Badge
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
                // Task List
                Expanded(
                  child: _buildTaskList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Check if any filter is active
  bool _hasActiveFilters() {
    return _selectedTaskType != 'all' ||
        _selectedCage != 'all' ||
        _selectedStatus != 'all' ||
        _selectedSession != null;
  }

  // Count number of active filters
  int _getActiveFilterCount() {
    int count = 0;
    if (_selectedTaskType != 'all') count++;
    if (_selectedCage != 'all') count++;
    if (_selectedStatus != 'all') count++;
    if (_selectedSession != null) count++;
    return count;
  }

  // Build filter button with badge
  Widget _buildFilterButton() {
    final activeCount = _getActiveFilterCount();

    return Material(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: _showFilterBottomSheet,
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
        onTap: _showSortBottomSheet,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Icon(
            _sortAscending ? Icons.arrow_upward : Icons.arrow_downward,
            size: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }

  // Build active filter chips
  List<Widget> _buildActiveFilterChips() {
    List<Widget> chips = [];

    // Task Type Chip
    if (_selectedTaskType != 'all') {
      chips.add(
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Chip(
            labelStyle: TextStyle(fontSize: 12),
            visualDensity: VisualDensity.compact,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            label: Text(_getTaskTypeLabel()),
            deleteIcon: Icon(Icons.close, size: 16),
            onDeleted: () {
              setState(() {
                _selectedTaskType = 'all';
              });
              _filterTasks();
            },
          ),
        ),
      );
    }

    // Cage Chip
    if (_selectedCage != 'all') {
      chips.add(
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Chip(
            labelStyle: TextStyle(fontSize: 12),
            visualDensity: VisualDensity.compact,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            label: Text(_getCageLabel()),
            deleteIcon: Icon(Icons.close, size: 16),
            onDeleted: () {
              setState(() {
                _selectedCage = 'all';
              });
              _filterTasks();
            },
          ),
        ),
      );
    }

    // Session Chip
    if (_selectedSession != null) {
      chips.add(
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Chip(
            labelStyle: TextStyle(fontSize: 12),
            visualDensity: VisualDensity.compact,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            label: Text(TimeUtils.getCurrentSessionName()),
            deleteIcon: Icon(Icons.close, size: 16),
            onDeleted: () {
              setState(() {
                _selectedSession = null;
              });
              _filterTasks();
            },
          ),
        ),
      );
    }

    // Status Chip
    if (_selectedStatus != 'all') {
      final statusColor =
          _statuses.firstWhere((s) => s['id'] == _selectedStatus)['color'];
      chips.add(
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Chip(
            labelStyle: TextStyle(fontSize: 12, color: statusColor),
            backgroundColor: statusColor.withOpacity(0.1),
            visualDensity: VisualDensity.compact,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            label: Text(_getStatusLabel()),
            deleteIcon: Icon(Icons.close, size: 16, color: statusColor),
            onDeleted: () {
              setState(() {
                _selectedStatus = 'all';
              });
              _filterTasks();
            },
          ),
        ),
      );
    }

    return chips;
  }

  // Combined filter bottom sheet
  void _showFilterBottomSheet() {
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
                          _selectedTaskType = 'all';
                          _selectedCage = 'all';
                          _selectedStatus = 'all';
                          _selectedSession = null;
                        });
                        _filterTasks();
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
                  Divider(),

                  // Cage Section
                  _buildFilterSection(
                    title: 'Chuồng nuôi',
                    icon: Icons.home_work_outlined,
                    options: [
                      {'id': 'all', 'name': 'Tất cả'},
                      ...availableCageFilters.map((cage) => {
                            'id': cage.cageId,
                            'name': cage.cageName,
                          }),
                    ],
                    selectedValue: _selectedCage,
                    onSelected: (value) {
                      setState(() {
                        _selectedCage = value;
                      });
                    },
                  ),
                  Divider(),

                  // Session Section
                  _buildFilterSection(
                    title: 'Buổi',
                    icon: Icons.access_time,
                    options: _sessions
                        .map((s) => {
                              'id': s['id'],
                              'name': s['name'],
                              'image': s['id'] == 1
                                  ? 'assets/images/morning.png'
                                  : s['id'] == 2
                                      ? 'assets/images/noon.png'
                                      : s['id'] == 3
                                          ? 'assets/images/afternoon.png'
                                          : s['id'] == 4
                                              ? 'assets/images/moon.png'
                                              : null,
                            })
                        .toList(),
                    selectedValue: _selectedSession?.toString() ?? 'all',
                    onSelected: (value) {
                      setState(() {
                        _selectedSession =
                            value == 'all' ? null : int.parse(value);
                      });
                    },
                  ),
                  Divider(),

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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  _filterTasks();
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

  // Build filter section for the bottom sheet
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

  // Show sort bottom sheet
  void _showSortBottomSheet() {
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
                  _sortTasks();
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // ...existing code...

  // Helper methods to get labels
  String _getTaskTypeLabel() {
    if (_selectedTaskType == 'all') return 'Loại công việc';
    final taskType = availableTaskTypeFilters.firstWhere(
      (t) => t.taskTypeId == _selectedTaskType,
      orElse: () => TaskType(taskTypeId: '', taskTypeName: ''),
    );
    return taskType.taskTypeName.isNotEmpty
        ? taskType.taskTypeName
        : 'Loại công việc';
  }

  String _getCageLabel() {
    if (_selectedCage == 'all') return 'Chuồng nuôi';
    final cage = availableCageFilters.firstWhere(
      (c) => c.cageId == _selectedCage,
      orElse: () =>
          CageFilter(cageId: '', cageName: 'Không xác định', cageType: ''),
    );
    return cage.cageName;
  }

  // Hàm build task list với empty state
  Widget _buildTaskList() {
    if (_isProcessing) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Center(child: CircularProgressIndicator()),
      );
    } else if (taskSorted.isEmpty) {
      return _buildEmptyState();
    } else if (taskSorted.values.every((tasks) => tasks.isEmpty)) {
      return _buildEmptyState();
    } else {
      return SingleChildScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 24.0),
        child: Column(
          children: _buildSessionSections(),
        ),
      );
    }
  }

  // Hàm build empty state
  Widget _buildEmptyState() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.4),
            ),
            width: 120,
            height: 120,
            child: Icon(
              Icons.task_alt_outlined,
              size: 64,
              color: Theme.of(context).primaryColor.withOpacity(0.4),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Không có công việc nào\n trong ngày này',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<TaskBloc>().add(TaskEvent.getTasks(
                    _searchController.text,
                    _selectedTaskType == 'all' ? null : _selectedTaskType,
                    _selectedCage == 'all' ? null : _selectedCage,
                    _selectedStatus == 'all' ? null : _selectedStatus,
                    selectedDate,
                    _selectedSession,
                    1,
                    20,
                  ));
            },
            child: const Text('Tải lại'),
          ),
        ],
      ),
    );
  }

  // Hàm build các section theo buổi
  List<Widget> _buildSessionSections() {
    return taskSorted.entries.map((entry) {
      final session = entry.key;
      final sessionTasks = entry.value;
      final totalTasks = sessionTasks.length;

      String sessionTitle, image = 'assets/images/default.png';
      switch (session) {
        case 'Morning':
          sessionTitle = 'Buổi sáng';
          image = 'assets/images/morning.png';
          break;
        case 'Noon':
          sessionTitle = 'Buổi trưa';
          image = 'assets/images/noon.png';
          break;
        case 'Afternoon':
          sessionTitle = 'Buổi chiều';
          image = 'assets/images/afternoon.png';
          break;
        case 'Evening':
          sessionTitle = 'Buổi tối';
          image = 'assets/images/moon.png';
          break;
        default:
          sessionTitle = 'Khác';
      }

      return totalTasks > 0
          ? Container(
              color: Colors.white,
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Image.asset(image, width: 32, height: 32),
                        const SizedBox(width: 8),
                        Text(
                          sessionTitle,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            context.read<TaskBloc>().add(TaskEvent.getTasks(
                                _searchController.text,
                                _selectedTaskType == 'all'
                                    ? null
                                    : _selectedTaskType,
                                _selectedCage == 'all' ? null : _selectedCage,
                                _selectedStatus == 'all'
                                    ? null
                                    : _selectedStatus,
                                selectedDate,
                                _selectedSession,
                                1,
                                20));
                          },
                          child: Icon(Icons.refresh_outlined, size: 16),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '$totalTasks công việc',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...sessionTasks.map((task) => TaskListWidget(tasks: [task])),
                ],
              ),
            )
          : Container();
    }).toList();
  }

  // Thêm helper method để lấy label cho status chip

  String _getStatusLabel() {
    if (_selectedStatus == 'all') return 'Trạng thái';
    return _statuses.firstWhere((s) => s['id'] == _selectedStatus)['name'];
  }
}
