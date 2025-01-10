import 'package:data_layer/model/dto/medical_symptom/medical_symptom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/viewmodel/medical_symptom/medical_symptom_cubit.dart';

class SymptomSearchWidget extends StatefulWidget {
  const SymptomSearchWidget({super.key});

  @override
  State<SymptomSearchWidget> createState() => _SymptomSearchWidgetState();
}

class _SymptomSearchWidgetState extends State<SymptomSearchWidget> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _selectedFilters = [];
  DateTime? _startDate;
  DateTime? _endDate;
  String _selectedStatus = 'Tất cả';

  final List<String> _statusFilters = [
    'Tất cả',
    'Chờ xem xét',
    'Đã kê đơn thuốc',
    'Từ chối'
  ];

  final List<String> _commonSymptoms = [
    'Chán ăn',
    'Ho',
    'Sốt cao',
    'Khó thở',
    'Tiêu chảy',
    'Mắt chảy nước',
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.orange;
      case 'Prescribed':
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'Pending':
        return 'Chờ xem xét';
      case 'Prescribed':
        return 'Đã kê đơn thuốc';
      case 'Rejected':
        return 'Từ chối';
      default:
        return status;
    }
  }

  String _getStatusValue(String displayText) {
    switch (displayText) {
      case 'Chờ xem xét':
        return 'Pending';
      case 'Đã kê đơn thuốc':
        return 'Prescribed';
      case 'Từ chối':
        return 'Rejected';
      default:
        return displayText;
    }
  }

  void _showFilterBottomSheet() {
    String tempStatus = _selectedStatus;
    List<String> tempFilters = List.from(_selectedFilters);
    DateTime? tempStartDate = _startDate;
    DateTime? tempEndDate = _endDate;

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
                              tempStatus = 'Tất cả';
                              tempFilters.clear();
                              tempStartDate = null;
                              tempEndDate = null;
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
                          // Date Range Filter
                          Text(
                            'Khoảng thời gian',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 8),
                          InkWell(
                            onTap: () async {
                              final picked = await showDateRangePicker(
                                context: context,
                                firstDate: DateTime(2020),
                                lastDate: DateTime.now(),
                              );
                              if (picked != null) {
                                setModalState(() {
                                  tempStartDate = picked.start;
                                  tempEndDate = picked.end;
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]!),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  LinearIcons.calendarIcon,
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      tempStartDate != null &&
                                              tempEndDate != null
                                          ? '${DateFormat('dd/MM/yyyy').format(tempStartDate!)} - ${DateFormat('dd/MM/yyyy').format(tempEndDate!)}'
                                          : 'Chọn khoảng thời gian',
                                    ),
                                  ),
                                  if (tempStartDate != null)
                                    IconButton(
                                      icon: const Icon(Icons.close, size: 18),
                                      onPressed: () {
                                        setModalState(() {
                                          tempStartDate = null;
                                          tempEndDate = null;
                                        });
                                      },
                                    ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Status Filter
                          Text(
                            'Trạng thái',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: _statusFilters.map((status) {
                              return FilterChip(
                                selected: tempStatus == status,
                                label: Text(status),
                                onSelected: (selected) {
                                  setModalState(() {
                                    tempStatus = selected ? status : 'Tất cả';
                                  });
                                },
                                backgroundColor: Colors.white,
                                selectedColor:
                                    _getStatusColor(status).withOpacity(0.1),
                                checkmarkColor: _getStatusColor(status),
                                side: BorderSide(
                                  color: tempStatus == status
                                      ? _getStatusColor(status)
                                      : Colors.grey[300]!,
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 24),

                          // Common Symptoms
                          Row(
                            children: [
                              Icon(
                                Icons.trending_up_rounded,
                                size: 20,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Triệu chứng phổ biến',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: _commonSymptoms.map((symptom) {
                              return FilterChip(
                                selected: tempFilters.contains(symptom),
                                label: Text(symptom),
                                onSelected: (selected) {
                                  setModalState(() {
                                    if (selected) {
                                      tempFilters.add(symptom);
                                    } else {
                                      tempFilters.remove(symptom);
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
                                  color: tempFilters.contains(symptom)
                                      ? Theme.of(context).colorScheme.primary
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
                          _selectedStatus = tempStatus;
                          _selectedFilters.clear();
                          _selectedFilters.addAll(tempFilters);
                          _startDate = tempStartDate;
                          _endDate = tempEndDate;
                        });
                        Navigator.pop(context);
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
  void initState() {
    super.initState();
    // Fetch initial data
    context.read<MedicalSymptomCubit>().getMedicalSymptomsByBatch();
  }

  // Add filter logic
  List<MedicalSymptomDto> _filterSymptoms(List<MedicalSymptomDto> symptoms) {
    return symptoms.where((symptom) {
      // Text search filter
      final matchesSearch = _searchController.text.isEmpty ||
          symptom.symtom
              .toLowerCase()
              .contains(_searchController.text.toLowerCase());

      // Status filter
      final matchesStatus = _selectedStatus == 'Tất cả' ||
          symptom.status == _getStatusValue(_selectedStatus);

      // Date range filter
      final matchesDate = _startDate == null ||
          (symptom.createAt.isAfter(_startDate!) &&
              symptom.createAt
                  .isBefore(_endDate!.add(const Duration(days: 1))));

      // Symptoms filter
      final matchesSymptoms = _selectedFilters.isEmpty ||
          _selectedFilters.any((filter) =>
              symptom.symtom.toLowerCase().contains(filter.toLowerCase()));

      return matchesSearch && matchesStatus && matchesDate && matchesSymptoms;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasActiveFilters = _selectedFilters.isNotEmpty ||
        _startDate != null ||
        _selectedStatus != 'Tất cả';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 40,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: LinearIcons.arrowBackIcon,
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
              hintText: 'Ví dụ: ho, sốt cao, khó thở...',
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
              ),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              labelText: 'Tìm kiếm theo triệu chứng',
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
                          _getActiveFiltersCount().toString(),
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
          if (_searchController.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                setState(() {
                  _searchController.clear();
                });
              },
            ),
        ],
      ),
      body: Column(
        children: [
          // Active Filters Display (optional)
          if (_selectedFilters.isNotEmpty ||
              _startDate != null ||
              _selectedStatus != 'Tất cả')
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    if (_startDate != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Chip(
                          label: Text(
                            '${DateFormat('dd/MM').format(_startDate!)} - ${DateFormat('dd/MM').format(_endDate!)}',
                          ),
                          onDeleted: () {
                            setState(() {
                              _startDate = null;
                              _endDate = null;
                            });
                          },
                        ),
                      ),
                    if (_selectedStatus != 'Tất cả')
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Chip(
                          label: Text(_selectedStatus),
                          onDeleted: () {
                            setState(() {
                              _selectedStatus = 'Tất cả';
                            });
                          },
                        ),
                      ),
                    ..._selectedFilters.map(
                      (filter) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Chip(
                          label: Text(filter),
                          onDeleted: () {
                            setState(() {
                              _selectedFilters.remove(filter);
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Add results count only when searching or filtering
          if (_searchController.text.isNotEmpty ||
              _selectedFilters.isNotEmpty ||
              _startDate != null ||
              _selectedStatus != 'Tất cả') ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kết quả tìm kiếm',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  BlocBuilder<MedicalSymptomCubit, MedicalSymptomState>(
                    builder: (context, state) {
                      final resultCount = state.maybeWhen(
                        getMedicalSymptomsByBatchSuccess: (symptoms) =>
                            _filterSymptoms(symptoms).length,
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
                          '$resultCount báo cáo',
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
            child: BlocBuilder<MedicalSymptomCubit, MedicalSymptomState>(
              builder: (context, state) {
                return state.maybeWhen(
                  getMedicalSymptomsByBatchInProress: () =>
                      const Center(child: CircularProgressIndicator()),
                  getMedicalSymptomsByBatchSuccess: (symptoms) {
                    final filteredSymptoms = _filterSymptoms(symptoms);

                    if (_searchController.text.isEmpty &&
                        _selectedFilters.isEmpty &&
                        _startDate == null &&
                        _selectedStatus == 'Tất cả') {
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

                    if (filteredSymptoms.isEmpty) {
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

                    return ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: filteredSymptoms.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final symptom = filteredSymptoms[index];
                        return Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: Colors.grey[200]!),
                          ),
                          child: InkWell(
                            onTap: () {
                              context.push(RouteName.symptomDetail,
                                  extra: {'symptom': symptom});
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Báo cáo #${index + 1}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: _getStatusColor(symptom.status)
                                              .withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: _getStatusColor(
                                                  symptom.status)),
                                        ),
                                        child: Text(
                                          _getStatusText(symptom.status),
                                          style: TextStyle(
                                            color:
                                                _getStatusColor(symptom.status),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Triệu chứng: ${symptom.symtom}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Số lượng: ${symptom.affectedQuantity}/${symptom.quantity}',
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        DateFormat('dd/MM/yyyy HH:mm')
                                            .format(symptom.createAt),
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  getMedicalSymptomsByBatchFailure: (message) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(message),
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<MedicalSymptomCubit>()
                                .getMedicalSymptomsByBatch();
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

  int _getActiveFiltersCount() {
    int count = 0;
    if (_selectedFilters.isNotEmpty) count += _selectedFilters.length;
    if (_startDate != null) count++;
    if (_selectedStatus != 'Tất cả') count++;
    return count;
  }
}
