import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:data_layer/model/dto/medication/medication.dart';
import 'package:data_layer/model/dto/prescription/prescription.dart';
import 'package:data_layer/model/dto/task/daily_food_usage_log/daily_food_usage_log_dto.dart';
import 'package:data_layer/model/dto/task/health_log/health_log_dto.dart';
import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:data_layer/model/entity/task/tash_type/task_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/common/widgets/warning_confirm_dialog.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/constants/task_type_data_constant.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/view/symptom/cage_option.dart';
import 'package:smart_farm/src/view/widgets/text_field_required.dart';
import 'package:smart_farm/src/viewmodel/growth_stage/growth_stage_cubit.dart';
import 'package:smart_farm/src/viewmodel/index.dart';
import 'package:smart_farm/src/viewmodel/prescription/prescription_cubit.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';

class TaskQRCodeWidget extends StatefulWidget {
  const TaskQRCodeWidget({super.key, required this.cage});
  final CageOption cage;

  @override
  State<TaskQRCodeWidget> createState() => _TaskQRCodeWidgetState();
}

class _TaskQRCodeWidgetState extends State<TaskQRCodeWidget> {
  List<TaskHaveCageName>? _tasks;
  List<TaskHaveCageName>? _filteredTasks;
  // final TextEditingController _searchController = TextEditingController();
  final Set<String> _selectedTaskIds = {};
  final TextEditingController _logController = TextEditingController();
  double? recommendedWeight;
  int actualWeight = 0;
  PrescriptionDto? _prescription;
  final Map<String, bool> _medicationChecked = {};
  List<int> weightList = [];
  DateTime? logTime;
  // Controller for log input
  TextEditingController logController = TextEditingController();
  final List<File> _images = [];
  // Thêm biến để track loading state
  bool _isLoadingRecommendedWeight = false;
  // Thêm biến để lưu task đang được xử lý
  TaskHaveCageName? _processingTask;
  final bool _showSearchAndFilter = true;
  final TextEditingController _searchController = TextEditingController();
  String _selectedTaskType = 'all';
  Timer? _debounce;
  final String _selectedCage = 'all';
  String? _username;

  // Thêm biến cho status filter
  String _selectedStatus = 'all';
  String _sortBy = 'status'; // 'time', 'name', 'status'
  bool _sortAscending = true;
  int? _selectedSession;

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
              children: _buildTaskTypeOptions()
                  .map((type) => RadioListTile(
                        title: Row(
                          children: [
                            Icon(type['icon'] as IconData),
                            const SizedBox(width: 8),
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

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const UserEvent.getUserProfile());
    context
        .read<TaskBloc>()
        .add(TaskEvent.getTasksByScanQRCode('', '', '', widget.cage.id, 1, 20));
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

  // Function to pick an image from the camera
  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  // Function to pick an image from the gallery
  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  void _showLogForm(TaskHaveCageName task) {
    if (task.taskType.taskTypeId == TaskTypeDataConstant.feeding) {
      // Show loading dialog
      setState(() {
        _isLoadingRecommendedWeight = true;
        _processingTask = task; // Lưu task đang xử lý
      });

      // Lấy cân nặng khuyến nghị trước
      context
          .read<GrowthStageCubit>()
          .getRecommendedWeightByCageId(task.cageId)
          .then((_) {
        setState(() {
          _isLoadingRecommendedWeight = false;
        });
        // Hiển thị form sau khi lấy cân nặng khuyến nghị
        _showLogFormBottomSheet(task);
      }).catchError((error) {
        setState(() {
          _isLoadingRecommendedWeight = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Lỗi: Không thể lấy cân nặng khuyến nghị - $error')),
        );
      });

      return;
    } else if (task.taskType.taskTypeId == TaskTypeDataConstant.health) {
      setState(() {
        _processingTask = task;
      });

      context
          .read<PrescriptionCubit>()
          .getPrescription(task.prescriptionId ?? '');

      return;
    }

    // Các loại task khác hiển thị form ngay
    _showLogFormBottomSheet(task);
  }

  // Tách riêng phần hiển thị bottom sheet
  void _showLogFormBottomSheet(TaskHaveCageName task) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (_, controller) => Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    Text(
                      'Tạo đơn báo cáo',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(height: 16.0),
                // Dynamic form based on task type
                Expanded(
                  child: SingleChildScrollView(
                    controller: controller,
                    child: _buildLogForm(task, setState),
                  ),
                ),

                // Submit button
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      _submitLog(task);
                      this.setState(() => _selectedTaskIds.add(task.id));
                    },
                    child: const Text('Xác nhận'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogForm(TaskHaveCageName task, StateSetter setState) {
    switch (task.taskType.taskTypeId) {
      case TaskTypeDataConstant.feeding:
        return _buildFeedingLogForm(task, setState);
      case TaskTypeDataConstant.health:
        return _buildHealthLogForm(task, setState);
      case TaskTypeDataConstant.vaccin:
        return _buildVaccinLogForm(task);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildImagePickerButton({
    required BuildContext context,
    required Widget icon,
    required String label,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Card.outlined(
        child: SizedBox(
          width: 110,
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  color: onTap == null
                      ? Theme.of(context).colorScheme.outline
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeedingLogForm(TaskHaveCageName task, StateSetter setState) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.restaurant_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Đơn log công việc cho ăn',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Ngày tạo log: ${DateFormat('EEEE, dd/MM/yyyy', 'vi').format(logTime ?? DateTime.now())}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          const SizedBox(height: 24),
          Card.outlined(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Theme.of(context).colorScheme.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Khuyến cáo cho ăn:',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${recommendedWeight != null ? recommendedWeight?.toInt() : 0}g',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Chọn lượng thức ăn:',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: (task.status == StatusDataConstant.done ||
                                  DateTime.parse(task.dueDate ?? "")
                                      .isBefore(DateTime.now()))
                              ? Theme.of(context).colorScheme.outline
                              : null,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: weightList.map((weight) {
                      bool isSelected = actualWeight == weight;
                      bool isDisabled =
                          task.status == StatusDataConstant.done ||
                              task.status == StatusDataConstant.overdue;
                      return FilterChip(
                        selected: isSelected,
                        showCheckmark: false,
                        label: Text('${weight}g'),
                        labelStyle: TextStyle(
                            color: isDisabled
                                ? (isSelected
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Theme.of(context).colorScheme.outline)
                                : (isSelected
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Theme.of(context).colorScheme.onSurface)),
                        selectedColor: Theme.of(context).colorScheme.primary,
                        onSelected: isDisabled
                            ? null
                            : (bool selected) {
                                if (selected) {
                                  setState(() {
                                    actualWeight = weight;
                                  });
                                }
                              },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(
                              task.status == StatusDataConstant.done ? 0.5 : 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(
                                  task.status == StatusDataConstant.done
                                      ? 0.5
                                      : 1),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Đã cho ăn: ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color: task.status == StatusDataConstant.done
                                    ? Theme.of(context).colorScheme.outline
                                    : null,
                              ),
                        ),
                        Text(
                          '${actualWeight}g',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: task.status == StatusDataConstant.done
                                    ? Theme.of(context).colorScheme.outline
                                    : null,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFieldRequired(
                    isRequired: false,
                    controller: logController,
                    maxLines: 3,
                    isDisabled: task.status == StatusDataConstant.done ||
                        task.status == StatusDataConstant.overdue,
                    label: 'Ghi chú (nếu có)',
                    hintText: 'Nhập ghi chú',
                  ),
                  const SizedBox(height: 32),
                  if (task.status != StatusDataConstant.overdue)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tập tin đính kèm',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 10),
                        if (_images.isEmpty)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildImagePickerButton(
                                context: context,
                                icon: LinearIcons.cameraIcon,
                                label: 'Chụp ảnh',
                                // onTap: isEditable ? _pickImageFromCamera : null,
                                onTap: _pickImageFromCamera,
                              ),
                              _buildImagePickerButton(
                                context: context,
                                icon: LinearIcons.folderAddIcon,
                                label: 'Chọn tập tin',
                                // onTap:
                                //     isEditable ? _pickImageFromGallery : null,
                                onTap: _pickImageFromGallery,
                              ),
                            ],
                          ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: _images.map((image) {
                            return Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    image,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.remove_circle,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _images.remove(image);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthLogForm(TaskHaveCageName task, StateSetter setState) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.medical_services_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Đơn log công việc uống thuốc',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Ngày tạo log: ${DateFormat('EEEE, dd/MM/yyyy', 'vi').format(DateTime.now())}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          if (_prescription != null) ...[
            const SizedBox(height: 16),
            // Prescription Info
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      LinearIcons.healthIconGreen,
                      const SizedBox(width: 8),
                      Text(
                        'Thông tin đơn thuốc',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildInfoItem(
                        context,
                        'Số ngày uống',
                        '${_prescription?.daysToTake} ngày',
                        Icons.calendar_today,
                      ),
                      const SizedBox(width: 16),
                      _buildInfoItem(
                        context,
                        'Số lượng',
                        '${_prescription?.quantityAnimal} con',
                        Icons.pets,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            // Medications List
            Text(
              'Danh sách thuốc',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ..._prescription?.medications?.where((medication) {
                  int dose = task.session == 1
                      ? medication.morning
                      : task.session == 2
                          ? medication.noon
                          : task.session == 3
                              ? medication.afternoon
                              : medication.evening;
                  return dose > 0;
                }).map((medication) =>
                    _buildMedicationItem(medication, task, setState)) ??
                [],
          ] else
            Column(
              children: [
                const SizedBox(height: 8),
                const Center(
                  child: Text('Không có thông tin đơn thuốc'),
                ),
              ],
            ),
          const SizedBox(height: 16),
          TextField(
            controller: _logController,
            maxLines: 3,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ghi chú (nếu có)',
              hintText: 'Nhập ghi chú',
            ),
          ),
          if (task.status != StatusDataConstant.overdue)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Text(
                  'Tập tin đính kèm',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                if (_images.isEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildImagePickerButton(
                        context: context,
                        icon: LinearIcons.cameraIcon,
                        label: 'Chụp ảnh',
                        // onTap: isEditable ? _pickImageFromCamera : null,
                        onTap: _pickImageFromCamera,
                      ),
                      _buildImagePickerButton(
                        context: context,
                        icon: LinearIcons.folderAddIcon,
                        label: 'Chọn tập tin',
                        // onTap:
                        //     isEditable ? _pickImageFromGallery : null,
                        onTap: _pickImageFromGallery,
                      ),
                    ],
                  ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _images.map((image) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: IconButton(
                            icon: Icon(
                              Icons.remove_circle,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            onPressed: () {
                              setState(() {
                                _images.remove(image);
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            )
        ],
      ),
    );
  }

  Widget _buildInfoItem(
      BuildContext context, String label, String value, IconData icon) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.outline,
                  fontSize: 12,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVaccinLogForm(TaskHaveCageName task) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.vaccines_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Đơn log công việc tiêm vắc xin',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Ngày tạo log: ${DateFormat('EEEE, dd/MM/yyyy', 'vi').format(DateTime.now())}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _logController,
            maxLines: 3,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ghi chú (nếu có)',
              hintText: 'Nhập ghi chú',
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for health log
  Widget _buildMedicationItem(
      MedicationDto medication, TaskHaveCageName task, StateSetter setState) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                value: _medicationChecked[medication.medicationId],
                onChanged: (bool? value) {
                  setState(() {
                    _medicationChecked[medication.medicationId] =
                        value ?? false;
                  });
                },
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  'assets/images/medicine.png',
                  width: 24,
                  height: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medication.medicationName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                'Liều uống:',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.outline,
                  fontSize: 13,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${task.session == 1 ? medication.morning : task.session == 2 ? medication.noon : task.session == 3 ? medication.afternoon : medication.evening} liều',
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _submitLog(TaskHaveCageName task) {
    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xác nhận'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bạn có chắc chắn muốn tạo đơn log cho công việc này?'),
            const SizedBox(height: 8),
            Text(
              task.taskName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (task.taskType.taskTypeId == TaskTypeDataConstant.feeding) ...[
              const SizedBox(height: 8),
              Text('Khối lượng thức ăn: ${actualWeight}g'),
            ],
            if (task.taskType.taskTypeId == TaskTypeDataConstant.health &&
                _medicationChecked.values
                    .where((checked) => checked)
                    .isEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Chưa có thuốc nào được đánh dấu là đã cho uống',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog

              // Create log based on task type
              switch (task.taskType.taskTypeId) {
                case TaskTypeDataConstant.feeding:
                  final log = DailyFoodUsageLogDto(
                    recommendedWeight: recommendedWeight?.toInt() ?? 0,
                    actualWeight: actualWeight,
                    notes: _logController.text,
                    logTime: DateTime.now(),
                    photo: '',
                    taskId: task.id,
                  );
                  context.read<TaskBloc>().add(
                        TaskEvent.createDailyFoodUsageLog(
                          cageId: task.cageId,
                          log: log,
                        ),
                      );
                  break;

                case TaskTypeDataConstant.health:
                  final log = HealthLogDto(
                    prescriptionId: task.prescriptionId ?? '',
                    date: DateTime.now(),
                    notes: _logController.text,
                    photo: '',
                    taskId: task.id,
                  );
                  context.read<TaskBloc>().add(
                        TaskEvent.createHealthLog(
                          prescriptionId: task.prescriptionId ?? '',
                          log: log,
                        ),
                      );
                  break;

                  // case TaskTypeDataConstant.vaccin:
                  //   final log = VaccineScheduleLogDto(
                  //     date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                  //     notes: _logController.text,
                  //     photo: "",
                  //     taskId: task.id,
                  //   );
                  //   context.read<TaskBloc>().add(
                  //         TaskEvent.createVaccinScheduleLog(
                  //           cageId: task.cageId,
                  //           log: log,
                  //         ),
                  //       );
                  break;
              }
            },
            child: const Text('Xác nhận'),
          ),
        ],
      ),
    );
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

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _filterTasks(searchQuery: query);
    });
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
            20,
          ));
    } else {
      context.read<TaskBloc>().add(TaskEvent.getTasksByScanQRCode(
            '',
            _selectedStatus == 'all' ? null : _selectedStatus,
            _selectedTaskType == 'all' ? null : _selectedTaskType,
            widget.cage.id,
            1,
            20,
          ));
    }
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
              },
              getTasksByScanQRCodeSuccess: (tasks, taskTypeList) {
                setState(() {
                  _tasks = tasks;
                  _filteredTasks = tasks;
                  availableTaskTypeFilters = taskTypeList;
                });
                _sortTasks(); // Sort tasks after fetching
              },
              getTasksByScanQRCodeFailure: (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Không thể tải danh sách công việc')),
                );
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
              createDailyFoodUsageLogLoading: () {
                log("Đang tạo log cho ăn...");
              },
              createDailyFoodUsageLogSuccess: () {
                Navigator.pop(context); // Close log form
                log("Tạo log cho ăn thành công!");
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tạo log cho ăn thành công!')),
                );
                // Check vào checkbox sau khi tạo log thành công
                if (_processingTask != null) {
                  setState(() => _selectedTaskIds.add(_processingTask!.id));
                }
              },
              createDailyFoodUsageLogFailure: (e) async {
                Navigator.pop(context); // Close log form
                log("Tạo log cho ăn thất bại!");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(e.toString())),
                );
              },
              createHealthLogLoading: () {
                log("Đang tạo log uống thuốc...");
              },
              createHealthLogSuccess: () {
                Navigator.pop(context); // Close log form
                log("Tạo log uống thuốc thành công!");
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Tạo log uống thuốc thành công!')),
                );
                // Check vào checkbox sau khi tạo log thành công
                if (_processingTask != null) {
                  setState(() => _selectedTaskIds.add(_processingTask!.id));
                }
              },
              createHealthLogFailure: (e) async {
                Navigator.pop(context); // Close log form
                log("Tạo log uống thuốc thất bại!");
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tạo log uống thuốc thất bại!')),
                );
              },
              createVaccinScheduleLogLoading: () {
                log("Đang tạo log lịch tiêm chủng...");
              },
              createVaccinScheduleLogSuccess: () {
                Navigator.pop(context); // Close log form
                log("Tạo log lịch tiêm chủng thành công!");
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Tạo log lịch tiêm chủng thành công!')),
                );
                // Check vào checkbox sau khi tạo log thành công
                if (_processingTask != null) {
                  setState(() => _selectedTaskIds.add(_processingTask!.id));
                }
              },
              createVaccinScheduleLogFailure: (e) async {
                Navigator.pop(context); // Close log form
                if (e.toString().contains('vaccinschedule-not-found')) {
                  log("Vaccine schedule không tồn tại!");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Vaccine schedule không tồn tại!')),
                  );
                } else {
                  log("Tạo log lịch tiêm chủng thất bại!");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Tạo log lịch tiêm chủng thất bại!')),
                  );
                }
              },
              getDailyFoodUsageLogLoading: () {
                log("Đang lấy log cho ăn...");
              },
              getDailyFoodUsageLogSuccess: (log) async {
                setState(() {
                  actualWeight = log.actualWeight;
                  logController.text = log.notes;
                  logTime = log.logTime;
                });
              },
              getDailyFoodUsageLogFailure: (e) async {
                log("Lấy log cho ăn thất bại!");
              },
              getHealthLogLoading: () {
                log("Đang lấy log sức khỏe...");
              },
              getHealthLogSuccess: (log) async {
                setState(() {
                  logController.text = log.notes;
                });
              },
              getHealthLogFailure: (e) async {
                log("Lấy log sức khỏe thất bại!");
              },
              getVaccinScheduleLogLoading: () {
                log("Đang lấy log lịch tiêm chủng...");
              },
              getVaccinScheduleLogSuccess: (log) async {
                setState(() {
                  logController.text = log.notes;
                });
              },
              getVaccinScheduleLogFailure: (e) async {
                log("Lấy log lịch tiêm chủng thất bại!");
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<GrowthStageCubit, GrowthStageState>(
          listener: (context, state) {
            state.maybeWhen(
              getRecommendedWeightByCageIdInProgress: () {
                log('Đang lấy cân nặng khuyến nghị...');
              },
              getRecommendedWeightByCageIdSuccess:
                  (recommendedWeight, weightList) {
                log('Lấy cân nặng khuyến nghị thành công!');
                setState(() {
                  this.recommendedWeight = recommendedWeight;
                  actualWeight = recommendedWeight.toInt();
                  this.weightList = weightList;
                  _isLoadingRecommendedWeight = false;
                });

                // Sử dụng _processingTask thay vì tìm trong _selectedTaskIds
                if (_processingTask != null) {
                  _showLogFormBottomSheet(_processingTask!);
                  _processingTask = null; // Reset sau khi xử lý xong
                }
              },
              getRecommendedWeightByCageIdFailure: (e) {
                log('Lấy cân nặng khuyến nghị thất bại!');
                setState(() {
                  _isLoadingRecommendedWeight = false;
                  _processingTask = null; // Reset khi có lỗi
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(e)),
                );
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<PrescriptionCubit, PrescriptionState>(
          listener: (context, state) {
            state.maybeWhen(
              getPrescriptionSuccess: (prescription) {
                log('Lấy thuốc thành công!');
                setState(() {
                  _prescription = prescription;
                  // Khởi tạo map check thuốc
                  _medicationChecked.clear();
                  for (var med in prescription.medications ?? []) {
                    _medicationChecked[med.medicationId] = false;
                  }
                });

                if (_processingTask != null) {
                  _showLogFormBottomSheet(_processingTask!);
                  _processingTask = null;
                }
              },
              getPrescriptionFailure: (e) {
                log('Lấy thuốc thất bại!');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content:
                          Text('Lỗi: Không thể lấy thông tin đơn thuốc - $e')),
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
            getUserProfileSuccess: (username, email) {
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
        })
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
                      .withOpacity(0.3),
                  image: DecorationImage(
                    image: const AssetImage('assets/images/leaf.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.08),
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
                              padding: const EdgeInsets.only(
                                left: 24.0,
                                right: 24.0,
                                top: 16.0,
                                bottom: 8.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Chip(
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    shape: StadiumBorder(
                                      side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                    label: Text(
                                      widget.cage.name,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Chào buổi sáng',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium
                                                  ?.copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .outline)),
                                          Text(_username ?? '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall),
                                          // Display the formatted date here
                                          Text(
                                            DateFormat('EEEE, dd/MM/yyyy', 'vi')
                                                .format(DateTime.now()),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            width: 2,
                                          ),
                                        ),
                                        child: const CircleAvatar(
                                          radius: 20,
                                          backgroundImage: AssetImage(
                                              'assets/images/avatar.png'),
                                        ),
                                      ),
                                    ],
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                FilterChip(
                                  showCheckmark: false,
                                  label: Text(_getTaskTypeLabel()),
                                  selected: _selectedTaskType != 'all',
                                  onSelected: (_) => _showTaskTypeBottomSheet(),
                                  avatar: const Icon(Icons.work_outline),
                                  deleteIcon: const Icon(Icons.arrow_drop_down),
                                  onDeleted: _showTaskTypeBottomSheet,
                                  labelStyle: TextStyle(
                                    color: _selectedTaskType != 'all'
                                        ? Theme.of(context).colorScheme.primary
                                        : null,
                                  ),
                                ),
                                // const SizedBox(width: 8),
                                // FilterChip(
                                //   showCheckmark: false,
                                //   label: Text(_getCageLabel()),
                                //   selected: _selectedCage != 'all',
                                //   onSelected: (_) =>
                                //       _showCageBottomSheet(),
                                //   avatar: LinearIcons.chickenIcon,
                                //   labelStyle: TextStyle(
                                //     color: _selectedCage != 'all'
                                //         ? Theme.of(context)
                                //             .colorScheme
                                //             .primary
                                //         : null,
                                //   ),
                                // ),
                                // const SizedBox(width: 8),
                                // FilterChip(
                                //   showCheckmark: false,
                                //   label: Text(_getSessionLabel()),
                                //   selected: _selectedSession != null,
                                //   onSelected: (_) =>
                                //       _showSessionBottomSheet(),
                                //   avatar: const Icon(Icons.access_time),
                                //   labelStyle: TextStyle(
                                //     color: _selectedSession != null
                                //         ? Theme.of(context)
                                //             .colorScheme
                                //             .primary
                                //         : null,
                                //   ),
                                // ),
                                const SizedBox(width: 8),
                                FilterChip(
                                  showCheckmark: false,
                                  label: Text(_getStatusLabel()),
                                  selected: _selectedStatus != 'all',
                                  onSelected: (_) => _showStatusBottomSheet(),
                                  avatar: const Icon(Icons.flag_outlined),
                                  deleteIcon: const Icon(Icons.arrow_drop_down),
                                  onDeleted: _showStatusBottomSheet,
                                  labelStyle: TextStyle(
                                    color: _selectedStatus != 'all'
                                        ? _statuses.firstWhere((s) =>
                                            s['id'] == _selectedStatus)['color']
                                        : null,
                                  ),
                                ),
                              ],
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

              Padding(
                  padding: const EdgeInsets.only(
                      left: 16, top: 16, right: 16, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Công việc hôm nay',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('${_tasks?.length} công việc')
                    ],
                  )),
              // Tasks List
              Expanded(
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
                                recommendedWeight: recommendedWeight?.toInt(),
                                onStatusChanged: (newStatus) {
                                  // Handle status change
                                  context.read<TaskBloc>().add(
                                        TaskEvent.updateTask(
                                          task.id,
                                          newStatus,
                                        ),
                                      );
                                },
                                isSelected: _selectedTaskIds.contains(task.id),
                                onSelected: (bool? value) {
                                  if (value == true) {
                                    if ([
                                      TaskTypeDataConstant.feeding,
                                      TaskTypeDataConstant.health,
                                      TaskTypeDataConstant.vaccin
                                    ].contains(task.taskType.taskTypeId)) {
                                      if (task.taskType.taskTypeId ==
                                          TaskTypeDataConstant.feeding) {
                                        context
                                            .read<GrowthStageCubit>()
                                            .getRecommendedWeightByCageId(
                                                task.cageId);
                                        _showLogForm(task);
                                      } else if (task.taskType.taskTypeId ==
                                          TaskTypeDataConstant.health) {
                                        context
                                            .read<PrescriptionCubit>()
                                            .getPrescription(
                                                task.prescriptionId ?? '');
                                        _showLogForm(task);
                                      }
                                    } else {
                                      setState(
                                          () => _selectedTaskIds.add(task.id));
                                    }
                                  } else {
                                    setState(
                                        () => _selectedTaskIds.remove(task.id));
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
                      child: const Text('Cập nhật trạng thái'),
                    ),
                  ],
                ),
              )
            : null,
      ),
    );
  }

  // Helper methods to get labels
  String _getTaskTypeLabel() {
    if (_selectedTaskType == 'all') return 'Loại công việc';
    final taskType = availableTaskTypeFilters.firstWhere(
        (t) => t.taskTypeId == _selectedTaskType,
        orElse: () => TaskType(taskTypeId: '', taskTypeName: ''));
    return taskType.taskTypeName.isNotEmpty
        ? taskType.taskTypeName
        : 'Loại công việc';
  }

  // Thêm helper method để lấy label cho status chip
  String _getStatusLabel() {
    if (_selectedStatus == 'all') return 'Trạng thái';
    return _statuses.firstWhere((s) => s['id'] == _selectedStatus)['name'];
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

    switch (task.taskType.taskTypeId) {
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
        border: Border.all(color: color ?? Colors.grey),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon ?? const SizedBox.shrink(),
          const SizedBox(width: 4),
          Text(
            logInfo,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (task.taskType.taskTypeId == TaskTypeDataConstant.feeding) ...[
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
    ].contains(task.taskType.taskTypeId);

    return Card.outlined(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          context.push(RouteName.taskDetail, extra: task.id);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
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
              const SizedBox(height: 8),
              Text(
                task.description,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 12),
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
