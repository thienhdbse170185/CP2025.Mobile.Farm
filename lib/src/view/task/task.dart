import 'dart:async';
import 'dart:developer';

import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/constants/task_type_data_constant.dart';
import 'package:smart_farm/src/model/task/cage_filter.dart';
import 'package:smart_farm/src/view/widgets/task_list.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart'; // Import the TaskCard widget

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget>
    with SingleTickerProviderStateMixin {
  DateTime selectedDate = DateTime.now(); // Store the selected date
  String selectedFilter = 'Tất cả'; // Default filter
  List<CageFilter> availableCageFilters = []; // List of available cage filters
  Map<String, List<TaskHaveCageName>> taskSorted = {}; // Updated to Map

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

  // Task type options
  final List<Map<String, dynamic>> _taskTypes = [
    {
      'id': 'all',
      'name': 'Tất cả',
      'icon': Icons.all_inclusive,
    },
    {
      'id': TaskTypeDataConstant.feeding,
      'name': 'Cho ăn',
      'icon': Icons.restaurant,
    },
    {
      'id': TaskTypeDataConstant.health,
      'name': 'Cho uống thuốc',
      'icon': Icons.medical_services,
    },
    {
      'id': TaskTypeDataConstant.vaccin,
      'name': 'Tiêm vacxin',
      'icon': Icons.vaccines,
    },
  ];

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

  // Animation controllers
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;

  // Thêm các biến để kiểm soát hiển thị và animation
  final ScrollController _scrollController = ScrollController();
  bool _showSearchAndFilter = true;
  double _lastOffset = 0;

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
    final DateTime now = DateTime.now();
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
    _scrollController.addListener(_onScroll);

    // Khởi tạo animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Tạo animation slide
    _slideAnimation = Tween<double>(
      begin: 0,
      end:
          -140, // Điều chỉnh giá trị này tùy theo chiều cao của phần search và filter
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Khởi động với trạng thái hiện
    _animationController.value = 0;

    // Fetch tasks for the selected date when the widget is initialized
    // context
    //     .read<TaskBloc>()
    //     .add(TaskEvent.getTasksByUserIdAndDate(DateTime.now(), null));
    context
        .read<TaskBloc>()
        .add(TaskEvent.getTasks('', '', '', '', DateTime.now(), null, 1, 20));
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onScroll() {
    final currentOffset = _scrollController.offset;
    if (currentOffset < 0) return;

    if (currentOffset > _lastOffset &&
        _showSearchAndFilter &&
        currentOffset > 10) {
      setState(() => _showSearchAndFilter = false);
      _animationController.forward();
    } else if (currentOffset < _lastOffset && !_showSearchAndFilter) {
      setState(() => _showSearchAndFilter = true);
      _animationController.reverse();
    }
    _lastOffset = currentOffset;
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

  void _showTaskTypeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: const Row(
              children: [
                Icon(Icons.work_outline),
                SizedBox(width: 16),
                Text(
                  'Chọn loại công việc',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: _taskTypes
                  .map((type) => RadioListTile(
                        title: Row(
                          children: [
                            Text(type['name']),
                          ],
                        ),
                        value: type['id'],
                        groupValue: _selectedTaskType,
                        onChanged: (value) {
                          setState(() {
                            _selectedTaskType = value.toString();
                          });
                          Navigator.pop(context);
                          _filterTasks();
                        },
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _showSessionBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: 8),
                const Text(
                  'Chọn buổi',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                RadioListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.all_inclusive),
                      SizedBox(width: 12),
                      Text('Tất cả'),
                    ],
                  ),
                  value: null,
                  groupValue: _selectedSession,
                  onChanged: (value) {
                    setState(() {
                      _selectedSession = null;
                    });
                    Navigator.pop(context);
                    _filterTasks();
                  },
                ),
                RadioListTile(
                  title: Row(
                    children: [
                      Image.asset('assets/images/morning.png',
                          width: 24, height: 24),
                      const SizedBox(width: 12),
                      const Text('Buổi sáng'),
                    ],
                  ),
                  value: 1,
                  groupValue: _selectedSession,
                  onChanged: (value) {
                    setState(() {
                      _selectedSession = 1;
                    });
                    Navigator.pop(context);
                    _filterTasks();
                  },
                ),
                RadioListTile(
                  title: Row(
                    children: [
                      Image.asset('assets/images/noon.png',
                          width: 24, height: 24),
                      const SizedBox(width: 12),
                      const Text('Buổi trưa'),
                    ],
                  ),
                  value: 2,
                  groupValue: _selectedSession,
                  onChanged: (value) {
                    setState(() {
                      _selectedSession = 2;
                    });
                    Navigator.pop(context);
                    _filterTasks();
                  },
                ),
                RadioListTile(
                  title: Row(
                    children: [
                      Image.asset('assets/images/afternoon.png',
                          width: 24, height: 24),
                      const SizedBox(width: 12),
                      const Text('Buổi trưa'),
                    ],
                  ),
                  value: 3,
                  groupValue: _selectedSession,
                  onChanged: (value) {
                    setState(() {
                      _selectedSession = 3;
                    });
                    Navigator.pop(context);
                    _filterTasks();
                  },
                ),
                RadioListTile(
                  title: Row(
                    children: [
                      Image.asset('assets/images/moon.png',
                          width: 24, height: 24),
                      const SizedBox(width: 12),
                      const Text('Buổi tối'),
                    ],
                  ),
                  value: 4,
                  groupValue: _selectedSession,
                  onChanged: (value) {
                    setState(() {
                      _selectedSession = 4;
                    });
                    Navigator.pop(context);
                    _filterTasks();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                LinearIcons.chickenIcon,
                const SizedBox(width: 8),
                const Text(
                  'Chọn chuồng nuôi',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                RadioListTile(
                  title: Row(
                    children: [
                      LinearIcons.farmHouseIcon,
                      const SizedBox(width: 12),
                      const Text('Tất cả'),
                    ],
                  ),
                  value: 'all',
                  groupValue: _selectedCage,
                  onChanged: (value) {
                    setState(() {
                      _selectedCage = value.toString();
                    });
                    Navigator.pop(context);
                    _filterTasks();
                  },
                ),
                ...availableCageFilters.map((cage) => RadioListTile(
                      title: Row(
                        children: [
                          LinearIcons.chickenIcon,
                          const SizedBox(width: 12),
                          Text(cage.cageName),
                        ],
                      ),
                      value: cage.cageId,
                      groupValue: _selectedCage,
                      onChanged: (value) {
                        setState(() {
                          _selectedCage = value.toString();
                        });
                        Navigator.pop(context);
                        _filterTasks();
                      },
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Thêm hàm show bottom sheet cho status
  void _showStatusBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: const Row(
              children: [
                Icon(Icons.flag_outlined),
                SizedBox(width: 16),
                Text(
                  'Chọn trạng thái',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: _statuses
                  .map((status) => RadioListTile(
                        title: Row(
                          children: [
                            Icon(
                              status['id'] == 'all'
                                  ? Icons.all_inclusive
                                  : Icons.circle,
                              color: status['color'],
                              size: status['id'] == 'all' ? 24 : 12,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              status['name'],
                              style: TextStyle(
                                color: status['color'],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        value: status['id'],
                        groupValue: _selectedStatus,
                        activeColor: status['color'],
                        onChanged: (value) {
                          setState(() {
                            _selectedStatus = value.toString();
                          });
                          Navigator.pop(context);
                          _filterTasks();
                        },
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

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
          loading: () {
            log("Đang lấy danh sách công việc...");
          },
          getTasksSuccess: (tasks, cageList) {
            log("Lấy danh sách công việc thành công!");
            setState(() {
              taskSorted = tasks;
              availableCageFilters = cageList;
            });
          },
          getTasksFailure: (e) {
            log("Lấy danh sách công việc thất bại! Message:");
            log(e.toString());
          },
          getTasksByUserIdAndDateLoading: () {
            log("Đang lấy danh sách công việc...");
            LoadingDialog.show(context, "Đang lấy danh sách công việc...");
          },
          getTasksByUserIdAndDateSuccess: (tasks, cageList) {
            // Update the tasksByDate list with the new tasks
            setState(() {
              taskSorted = tasks;
              availableCageFilters = cageList;
            });

            LoadingDialog.hide(context);
          },
          getTasksByUserIdAndDateFailure: (e) {
            LoadingDialog.hide(context);
            if (e.contains('no-task-found')) {
              log("Không tìm thấy công việc!");
              setState(() {
                taskSorted = {};
                availableCageFilters = [];
              });
            } else {
              log("Lấy danh sách công việc thất bại! Message:");
              log(e.toString());
              SnackBar(content: Text('Lỗi: ${e.toString()}'));
            }
          },
          filteredTaskLoading: () {
            log("Đang lọc công việc...");
            LoadingDialog.show(context, "Đang lọc công việc...");
          },
          filteredTasksSuccess: (filteredTasks) {
            log("Lọc công việc thành công!");
            setState(() {
              taskSorted = filteredTasks;
            });

            LoadingDialog.hide(context);
          },
          filteredTasksFailure: (e) {
            log("Lọc công việc thất bại! Message:");
            log(e.toString());
            LoadingDialog.hide(context);
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
                _selectedTaskType,
                _selectedCage,
                _selectedStatus,
                selectedDate,
                _selectedSession,
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
                    const SizedBox(height: 8.0),
                    // Date Selection - với animation ẩn/hiện
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      height: _showSearchAndFilter ? null : 0,
                      child: ClipRect(
                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            opacity: _showSearchAndFilter ? 1.0 : 0.0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    isToday ? 'Hôm nay' : dayOfWeek,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontSize: 22),
                                  ),
                                  InkWell(
                                    onTap: () => _selectDate(context),
                                    child: Chip(
                                      shape: const StadiumBorder(
                                          side: BorderSide(
                                              width: 0,
                                              color: Colors.transparent)),
                                      label: Text(
                                        formattedDate,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
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
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Search and Filter section - không có animation
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          // Search bar - luôn hiển thị
                          TextField(
                            controller: _searchController,
                            onChanged: _onSearchChanged,
                            decoration: InputDecoration(
                              hintText: 'Tìm kiếm theo tên công việc...',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Filter chips - có animation ẩn/hiện
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            height: _showSearchAndFilter ? 40 : 0,
                            child: ClipRect(
                              child: AnimatedSize(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  opacity: _showSearchAndFilter ? 1.0 : 0.0,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        FilterChip(
                                          showCheckmark: false,
                                          label: Text(_getTaskTypeLabel()),
                                          selected: _selectedTaskType != 'all',
                                          onSelected: (_) =>
                                              _showTaskTypeBottomSheet(),
                                          avatar:
                                              const Icon(Icons.work_outline),
                                          labelStyle: TextStyle(
                                            color: _selectedTaskType != 'all'
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                : null,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        FilterChip(
                                          showCheckmark: false,
                                          label: Text(_getCageLabel()),
                                          selected: _selectedCage != 'all',
                                          onSelected: (_) =>
                                              _showCageBottomSheet(),
                                          avatar: LinearIcons.chickenIcon,
                                          labelStyle: TextStyle(
                                            color: _selectedCage != 'all'
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                : null,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        FilterChip(
                                          showCheckmark: false,
                                          label: Text(_getSessionLabel()),
                                          selected: _selectedSession != null,
                                          onSelected: (_) =>
                                              _showSessionBottomSheet(),
                                          avatar: const Icon(Icons.access_time),
                                          labelStyle: TextStyle(
                                            color: _selectedSession != null
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                : null,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        FilterChip(
                                          showCheckmark: false,
                                          label: Text(_getStatusLabel()),
                                          selected: _selectedStatus != 'all',
                                          onSelected: (_) =>
                                              _showStatusBottomSheet(),
                                          avatar:
                                              const Icon(Icons.flag_outlined),
                                          labelStyle: TextStyle(
                                            color: _selectedStatus != 'all'
                                                ? _statuses.firstWhere((s) =>
                                                    s['id'] ==
                                                    _selectedStatus)['color']
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Sort chips - có animation ẩn/hiện
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                height: _showSearchAndFilter ? null : 0,
                child: ClipRect(
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      opacity: _showSearchAndFilter ? 1.0 : 0.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          children: [
                            const Spacer(),
                            Text(
                              'Sắp xếp theo:',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 8),
                            ..._sortOptions.map((option) => Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: FilterChip(
                                    showCheckmark: false,
                                    selected: _sortBy == option['id'],
                                    onSelected: (_) {
                                      setState(() {
                                        if (_sortBy == option['id']) {
                                          _sortAscending = !_sortAscending;
                                        } else {
                                          _sortBy = option['id'];
                                          _sortAscending = true;
                                        }
                                      });
                                      _sortTasks();
                                    },
                                    avatar: null,
                                    labelStyle: TextStyle(
                                      color: _sortBy == option['id']
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : null,
                                    ),
                                    label: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          option['icon'] as IconData,
                                          size: 20,
                                          color: _sortBy == option['id']
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                              : null,
                                        ),
                                        if (_sortBy == option['id'])
                                          Icon(
                                            _sortAscending
                                                ? Icons.arrow_upward
                                                : Icons.arrow_downward,
                                            size: 16,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
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
    );
  }

  // Hàm build task list với empty state
  Widget _buildTaskList() {
    if (taskSorted.isEmpty) {
      return _buildEmptyState();
    }

    return ListView(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
      children: [
        ..._buildSessionSections(),
      ],
    );
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

  // Helper methods to get labels
  String _getTaskTypeLabel() {
    if (_selectedTaskType == 'all') return 'Loại công việc';
    return _taskTypes.firstWhere((t) => t['id'] == _selectedTaskType)['name'] ??
        '';
  }

  String _getCageLabel() {
    if (_selectedCage == 'all') return 'Chuồng nuôi';
    final cage =
        availableCageFilters.firstWhere((c) => c.cageId == _selectedCage);
    return cage.cageName;
  }

  String _getSessionLabel() {
    if (_selectedSession == null) return 'Buổi';
    return _sessions.firstWhere((s) => s['id'] == _selectedSession)['name'] ??
        '';
  }

  // Thêm helper method để lấy label cho status chip
  String _getStatusLabel() {
    if (_selectedStatus == 'all') return 'Trạng thái';
    return _statuses.firstWhere((s) => s['id'] == _selectedStatus)['name'];
  }
}
