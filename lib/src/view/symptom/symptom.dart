import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/viewmodel/medical_symptom/medical_symptom_cubit.dart';

class SymptomWidget extends StatefulWidget {
  const SymptomWidget({super.key});

  @override
  State<SymptomWidget> createState() => _SymptomWidgetState();
}

class _SymptomWidgetState extends State<SymptomWidget> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedStatus = 'Tất cả';

  final List<String> _statusFilters = [
    'Tất cả',
    'Pending',
    'Normal',
    'Diagnosed',
    'Prescribed'
  ];

  @override
  void initState() {
    super.initState();
    context.read<MedicalSymptomCubit>().getMedicalSymptomsByBatch(null);
  }

  String _formatDate(String dateStr) {
    final date = DateTime.parse(dateStr);
    return DateFormat('dd/MM/yyyy HH:mm').format(date);
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.orange;
      case 'Normal':
        return Colors.green;
      case 'Diagnosed':
        return Colors.blue;
      case 'Prescribed':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicalSymptomCubit, MedicalSymptomState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.5),
                  image: DecorationImage(
                    image: const AssetImage('assets/images/leaf.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.1),
                      BlendMode.dstATop,
                    ),
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // [APPBAR] Time
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 8.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.pop();
                            },
                            child: LinearIcons.arrowBackIcon,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.13),
                          Text(
                            'Báo cáo triệu chứng',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: _searchController,
                        readOnly: true,
                        onTap: () {
                          context.push(RouteName.symptomSearch);
                        },
                        decoration: InputDecoration(
                          hintText: 'Tìm kiếm theo triệu chứng...',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // [APPBAR] Location Filter
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        children: _statusFilters.map((status) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: FilterChip(
                              selected: _selectedStatus == status,
                              label: Text(status),
                              onSelected: (selected) {
                                setState(() {
                                  _selectedStatus =
                                      selected ? status : 'Tất cả';
                                });
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: state.maybeWhen(
                  getMedicalSymptomsByBatchInProress: () =>
                      const Center(child: CircularProgressIndicator()),
                  getMedicalSymptomsByBatchSuccess: (symptoms) {
                    // Filter symptoms based on search and status
                    final filteredSymptoms = symptoms.where((symptom) {
                      final matchesSearch = _searchController.text.isEmpty ||
                          symptom.symptoms
                              .toLowerCase()
                              .contains(_searchController.text.toLowerCase());
                      final matchesStatus = _selectedStatus == 'Tất cả' ||
                          symptom.status == _selectedStatus;
                      return matchesSearch && matchesStatus;
                    }).toList();

                    if (filteredSymptoms.isEmpty) {
                      return const Center(
                        child: Text('Không tìm thấy báo cáo nào'),
                      );
                    }

                    return RefreshIndicator(
                      onRefresh: () async {
                        context
                            .read<MedicalSymptomCubit>()
                            .getMedicalSymptomsByBatch(null);
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Danh sách báo cáo',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                ),
                                Text(
                                  '${filteredSymptoms.length} báo cáo',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Colors.grey,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: ListView.separated(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: filteredSymptoms.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 8),
                              itemBuilder: (context, index) {
                                final symptom = filteredSymptoms[index];
                                return Card(
                                  elevation: 1,
                                  child: InkWell(
                                    onTap: () {
                                      context.push(RouteName.symptomDetail,
                                          extra: {
                                            'symptom': symptom,
                                          });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: _getStatusColor(
                                                          symptom.status)
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: _getStatusColor(
                                                        symptom.status),
                                                  ),
                                                ),
                                                child: Text(
                                                  symptom.status,
                                                  style: TextStyle(
                                                    color: _getStatusColor(
                                                        symptom.status),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Triệu chứng: ${symptom.symptoms}',
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
                                                style: const TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                _formatDate(symptom.createAt
                                                    .toString()),
                                                style: const TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
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
                                .getMedicalSymptomsByBatch(null);
                          },
                          child: const Text('Thử lại'),
                        ),
                      ],
                    ),
                  ),
                  orElse: () => const SizedBox(),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              context.push(RouteName.createSymptom, extra: {
                'cageName': '',
              });
            },
            icon: LinearIcons.addCircleIcon,
            label: const Text('Tạo đơn'),
          ),
        );
      },
    );
  }
}
