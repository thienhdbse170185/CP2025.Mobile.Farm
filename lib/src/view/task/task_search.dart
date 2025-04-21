import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:smart_farm/src/model/entity/task/tash_type/task_type.dart';
import 'package:smart_farm/src/model/task/cage_filter.dart';
import 'package:smart_farm/src/view/task/task_detail.dart';
import 'package:smart_farm/src/view/widgets/task_list.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';

class TaskSearchScreen extends StatefulWidget {
  final DateTime selectedDate;
  final List<CageFilter> availableCageFilters;
  final List<TaskType> availableTaskTypeFilters;

  const TaskSearchScreen({
    Key? key,
    required this.selectedDate,
    required this.availableCageFilters,
    required this.availableTaskTypeFilters,
  }) : super(key: key);

  @override
  State<TaskSearchScreen> createState() => _TaskSearchScreenState();
}

class _TaskSearchScreenState extends State<TaskSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  Map<String, List<TaskHaveCageName>> taskSorted = {};
  bool _isProcessing = false;
  Timer? _debounce;

  // Filter states
  String _selectedTaskType = 'all';
  String _selectedCage = 'all';
  String _selectedStatus = 'all';
  int? _selectedSession;

  // Sort states
  String _sortBy = 'time';
  bool _sortAscending = true;

  // Status options
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
    {
      'id': StatusDataConstant.cancelled,
      'name': 'Đã hủy',
      'color': Colors.blueGrey,
    }
  ];

  // Session options
  final List<Map<String, dynamic>> _sessions = [
    {'id': 'all', 'name': 'Tất cả'},
    {'id': 1, 'name': 'Buổi sáng'},
    {'id': 2, 'name': 'Buổi trưa'},
    {'id': 3, 'name': 'Buổi chiều'},
    {'id': 4, 'name': 'Buổi tối'},
  ];

  // Sort options
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
    // Fetch tasks initially with empty search
    _searchTasks('');
    // Add listener to search controller
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  // Debounce search to avoid multiple API calls
  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _searchTasks(_searchController.text);
    });
  }

  void _searchTasks(String query) {
    setState(() {
      _isProcessing = true;
    });

    context.read<TaskBloc>().add(TaskEvent.getTasks(
          query,
          _selectedStatus == 'all' ? null : _selectedStatus,
          _selectedTaskType == 'all' ? null : _selectedTaskType,
          _selectedCage == 'all' ? null : _selectedCage,
          widget.selectedDate,
          _selectedSession,
          1,
          20,
        ));
  }

  // Sort tasks
  void _sortTasks() {
    if (taskSorted.isEmpty) return;

    setState(() {
      // Create a new Map to store the sorted result
      Map<String, List<TaskHaveCageName>> newSortedMap = {};

      // Sort each session
      taskSorted.forEach((key, tasks) {
        // Create a completely new copy of the list
        List<TaskHaveCageName> sortedTasks = List<TaskHaveCageName>.from(tasks);

        // Sort by selected criteria
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
              return 0;
          }
          return _sortAscending ? compare : -compare;
        });

        // Add the sorted list to the new Map
        newSortedMap[key] = sortedTasks;
      });

      // Update state with the new Map
      taskSorted = newSortedMap;
    });
  }

  // Get task type label
  String _getTaskTypeLabel() {
    if (_selectedTaskType == 'all') return 'Loại công việc';
    final taskType = widget.availableTaskTypeFilters.firstWhere(
      (t) => t.taskTypeId == _selectedTaskType,
      orElse: () => TaskType(taskTypeId: '', taskTypeName: ''),
    );
    return taskType.taskTypeName.isNotEmpty
        ? taskType.taskTypeName
        : 'Loại công việc';
  }

  // Get cage label
  String _getCageLabel() {
    if (_selectedCage == 'all') return 'Chuồng nuôi';
    final cage = widget.availableCageFilters.firstWhere(
      (c) => c.cageId == _selectedCage,
      orElse: () =>
          CageFilter(cageId: '', cageName: 'Không xác định', cageType: ''),
    );
    return cage.cageName;
  }

  // Get status label
  String _getStatusLabel() {
    if (_selectedStatus == 'all') return 'Trạng thái';
    return _statuses.firstWhere((s) => s['id'] == _selectedStatus)['name'];
  }

  // Get icon for task type
  IconData _getTaskTypeIcon(String taskTypeId) {
    switch (taskTypeId) {
      case 'feeding':
        return Icons.restaurant;
      case 'health':
        return Icons.medical_services;
      case 'vaccin':
        return Icons.vaccines;
      default:
        return Icons.work_outline;
    }
  }

  // Build task type options
  List<Map<String, dynamic>> _buildTaskTypeOptions() {
    return [
      {
        'id': 'all',
        'name': 'Tất cả',
        'icon': Icons.all_inclusive,
      },
      ...widget.availableTaskTypeFilters.map((type) => {
            'id': type.taskTypeId,
            'name': type.taskTypeName,
            'icon': _getTaskTypeIcon(type.taskTypeId),
          }),
    ];
  }

  // Check if any filter is active
  bool _hasActiveFilters() {
    return _selectedTaskType != 'all' ||
        _selectedCage != 'all' ||
        _selectedStatus != 'all' ||
        _selectedSession != null;
  }

  // Count active filters
  int _getActiveFilterCount() {
    int count = 0;
    if (_selectedTaskType != 'all') count++;
    if (_selectedCage != 'all') count++;
    if (_selectedStatus != 'all') count++;
    if (_selectedSession != null) count++;
    return count;
  }

  void _showFilterBottomSheet() {
    String tempTaskType = _selectedTaskType;
    String? tempCage = _selectedCage;
    String tempStatus = _selectedStatus;
    int? tempSession = _selectedSession;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  // Header
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[200]!),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bộ lọc tìm kiếm',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            setModalState(() {
                              tempTaskType = 'all';
                              tempCage = 'all';
                              tempStatus = 'all';
                              tempSession = null;
                            });
                          },
                          child: const Text('Đặt lại'),
                        ),
                      ],
                    ),
                  ),

                  // Filter Content
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Task Type Section
                          Text(
                            'Loại công việc',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: _buildTaskTypeOptions().map((option) {
                              return FilterChip(
                                selected: tempTaskType == option['id'],
                                label: Text(option['name']),
                                onSelected: (selected) {
                                  setModalState(() {
                                    tempTaskType =
                                        selected ? option['id'] : 'all';
                                  });
                                },
                                backgroundColor: Colors.white,
                                selectedColor: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.1),
                                checkmarkColor:
                                    Theme.of(context).colorScheme.primary,
                                side: BorderSide(
                                  color: tempTaskType == option['id']
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.grey[300]!,
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 24),

                          // Cage Section
                          Text(
                            'Chuồng nuôi',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              FilterChip(
                                selected: tempCage == 'all',
                                label: Text('Tất cả'),
                                onSelected: (selected) {
                                  setModalState(() {
                                    tempCage = 'all';
                                  });
                                },
                                backgroundColor: Colors.white,
                                selectedColor: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.1),
                                checkmarkColor:
                                    Theme.of(context).colorScheme.primary,
                                side: BorderSide(
                                  color: tempCage == 'all'
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.grey[300]!,
                                ),
                              ),
                              ...widget.availableCageFilters.map((cage) {
                                return FilterChip(
                                  selected: tempCage == cage.cageId,
                                  label: Text(cage.cageName),
                                  onSelected: (selected) {
                                    setModalState(() {
                                      tempCage = selected ? cage.cageId : 'all';
                                    });
                                  },
                                  backgroundColor: Colors.white,
                                  selectedColor: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.1),
                                  checkmarkColor:
                                      Theme.of(context).colorScheme.primary,
                                  side: BorderSide(
                                    color: tempCage == cage.cageId
                                        ? Theme.of(context).colorScheme.primary
                                        : Colors.grey[300]!,
                                  ),
                                );
                              }),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Session Section
                          Text(
                            'Buổi',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: _sessions.map((session) {
                              final String sessionId = session['id'].toString();
                              return FilterChip(
                                selected: sessionId == 'all'
                                    ? tempSession == null
                                    : tempSession?.toString() == sessionId,
                                label: Text(session['name']),
                                onSelected: (selected) {
                                  setModalState(() {
                                    if (sessionId == 'all') {
                                      tempSession = null;
                                    } else {
                                      tempSession = selected
                                          ? int.parse(sessionId)
                                          : null;
                                    }
                                  });
                                },
                                backgroundColor: Colors.white,
                                selectedColor: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.1),
                                checkmarkColor:
                                    Theme.of(context).colorScheme.primary,
                                side: BorderSide(
                                  color: sessionId == 'all'
                                      ? tempSession == null
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Colors.grey[300]!
                                      : tempSession?.toString() == sessionId
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Colors.grey[300]!,
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 24),

                          // Status Section
                          Text(
                            'Trạng thái',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: _statuses.map((status) {
                              final Color statusColor = status['color'];
                              return FilterChip(
                                selected: tempStatus == status['id'],
                                label: Text(status['name']),
                                onSelected: (selected) {
                                  setModalState(() {
                                    tempStatus =
                                        selected ? status['id'] : 'all';
                                  });
                                },
                                backgroundColor: Colors.white,
                                selectedColor: statusColor.withOpacity(0.1),
                                checkmarkColor: statusColor,
                                side: BorderSide(
                                  color: tempStatus == status['id']
                                      ? statusColor
                                      : Colors.grey[300]!,
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Apply Button
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, -1),
                        ),
                      ],
                    ),
                    child: FilledButton(
                      onPressed: () {
                        setState(() {
                          _selectedTaskType = tempTaskType;
                          _selectedCage = tempCage!;
                          _selectedStatus = tempStatus;
                          _selectedSession = tempSession;
                        });
                        Navigator.pop(context);
                        _searchTasks(_searchController.text);
                      },
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(double.infinity, 52),
                      ),
                      child: const Text('Áp dụng'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool hasActiveFilters = _hasActiveFilters();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 40,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () => context.pop(),
          ),
        ),
        titleSpacing: 0,
        title: Container(
          height: kToolbarHeight,
          padding: const EdgeInsets.only(right: 8),
          child: TextField(
            controller: _searchController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Ví dụ: cho ăn, kiểm tra sức khỏe...',
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
              ),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              labelText: 'Tìm kiếm công việc',
              labelStyle: TextStyle(
                color: Colors.grey[700],
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            style: const TextStyle(fontSize: 16),
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
        actions: [
          // Enhanced Filter Button
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: _showFilterBottomSheet,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: hasActiveFilters
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                      : Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: hasActiveFilters
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[300]!,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.tune,
                      size: 20,
                      color: hasActiveFilters
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Bộ lọc',
                      style: TextStyle(
                        color: hasActiveFilters
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    if (hasActiveFilters) ...[
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          _getActiveFilterCount().toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          // Sort Button
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () {
                _showSortBottomSheet();
              },
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Icon(
                  _sortAscending ? Icons.arrow_upward : Icons.arrow_downward,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          if (_searchController.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                setState(() {
                  _searchController.clear();
                });
                _searchTasks('');
              },
            ),
        ],
      ),
      body: Column(
        children: [
          // Active Filters Display
          if (hasActiveFilters)
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    if (_selectedTaskType != 'all')
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Chip(
                          label: Text(_getTaskTypeLabel()),
                          onDeleted: () {
                            setState(() {
                              _selectedTaskType = 'all';
                            });
                            _searchTasks(_searchController.text);
                          },
                        ),
                      ),
                    if (_selectedCage != 'all')
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Chip(
                          label: Text(_getCageLabel()),
                          onDeleted: () {
                            setState(() {
                              _selectedCage = 'all';
                            });
                            _searchTasks(_searchController.text);
                          },
                        ),
                      ),
                    if (_selectedSession != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Chip(
                          label: Text(_sessions.firstWhere(
                              (s) => s['id'] == _selectedSession)['name']),
                          onDeleted: () {
                            setState(() {
                              _selectedSession = null;
                            });
                            _searchTasks(_searchController.text);
                          },
                        ),
                      ),
                    if (_selectedStatus != 'all')
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Chip(
                          label: Text(_getStatusLabel()),
                          onDeleted: () {
                            setState(() {
                              _selectedStatus = 'all';
                            });
                            _searchTasks(_searchController.text);
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),

          // Add results count when searching or filtering
          if (_searchController.text.isNotEmpty || hasActiveFilters) ...[
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kết quả tìm kiếm',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  BlocBuilder<TaskBloc, TaskState>(
                    builder: (context, state) {
                      final resultCount = state.maybeWhen(
                        getTasksSuccess: (tasks, _, __) {
                          int count = 0;
                          tasks.forEach((_, taskList) {
                            count += taskList.length;
                          });
                          return count;
                        },
                        orElse: () => 0,
                      );

                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '$resultCount công việc',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
          ],

          // Updated Search Results
          Expanded(
            child: BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return state.maybeWhen(
                  getTasksInProgress: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  getTasksSuccess: (tasks, _, __) {
                    if (_searchController.text.isEmpty && !hasActiveFilters) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search,
                                size: 64, color: Colors.grey[400]),
                            const SizedBox(height: 16),
                            Text(
                              'Nhập từ khóa để tìm kiếm\nhoặc sử dụng bộ lọc',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      );
                    }

                    if (tasks.isEmpty ||
                        tasks.values.every((list) => list.isEmpty)) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search_off,
                                size: 64, color: Colors.grey[400]),
                            const SizedBox(height: 16),
                            Text(
                              'Không tìm thấy kết quả phù hợp',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      );
                    }

                    return SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: _buildSessionSections(tasks),
                      ),
                    );
                  },
                  getTasksFailure: (e) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Lỗi khi tìm kiếm: ${e.toString()}'),
                        ElevatedButton(
                          onPressed: () {
                            _searchTasks(_searchController.text);
                          },
                          child: const Text('Thử lại'),
                        ),
                      ],
                    ),
                  ),
                  orElse: () => const SizedBox(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Build session sections
  List<Widget> _buildSessionSections(
      Map<String, List<TaskHaveCageName>> taskSorted) {
    return taskSorted.entries.map((entry) {
      final session = entry.key;
      final sessionTasks = entry.value;
      final totalTasks = sessionTasks.length;

      if (totalTasks == 0) return Container();

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

      return Container(
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
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
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
            ...sessionTasks.map((task) => GestureDetector(
                  onTap: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TaskDetailWidget(
                          taskId: task.id,
                          source: 'search',
                        ),
                      ),
                    );

                    if (result != null && result is Map<String, dynamic>) {
                      if (result['reload'] == true) {
                        _searchTasks(_searchController.text);
                      }
                    }
                  },
                  child: TaskListWidget(
                    tasks: [task],
                    highlightWarning: true,
                  ),
                )),
          ],
        ),
      );
    }).toList();
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
                // Continue from the onTap handler in the sort options list tile
                onTap: () {
                  setState(() {
                    // If selecting the same option, toggle sort direction
                    if (_sortBy == option['id']) {
                      _sortAscending = !_sortAscending;
                    } else {
                      // Otherwise, change sort criteria and reset to ascending
                      _sortBy = option['id'];
                      _sortAscending = true;
                    }
                  });

                  // Apply sorting and close sheet
                  _sortTasks();
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  // Build filter section widget
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
            Icon(icon, size: 18),
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
            final bool isSelected = selectedValue == option['id'].toString();
            final Color? optionColor = isColoredOption ? option['color'] : null;

            return FilterChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (option['image'] != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child:
                          Image.asset(option['image'], width: 16, height: 16),
                    ),
                  if (option['icon'] != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Icon(option['icon'], size: 16),
                    ),
                  Text(
                    option['name'],
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : isColoredOption && optionColor != null
                              ? optionColor
                              : null,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              selected: isSelected,
              checkmarkColor: Colors.white,
              selectedColor: isColoredOption && optionColor != null
                  ? optionColor
                  : Theme.of(context).colorScheme.primary,
              backgroundColor:
                  isColoredOption && optionColor != null && !isSelected
                      ? optionColor.withOpacity(0.1)
                      : null,
              onSelected: (bool selected) {
                if (selected) {
                  onSelected(option['id'].toString());
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
