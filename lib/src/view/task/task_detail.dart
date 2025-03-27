import 'dart:developer';
import 'dart:io';

import 'package:data_layer/data_layer.dart';
import 'package:data_layer/model/dto/egg_harvest/egg_harvest_dto.dart';
import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:data_layer/model/request/prescription/update_status_prescription_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/common/widgets/warning_confirm_dialog.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/constants/task_type_data_constant.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/core/utils/date_util.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/view/task/widgets/task_info_grid_item.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';
import 'package:smart_farm/src/view/widgets/processing_button_widget.dart';
import 'package:smart_farm/src/viewmodel/index.dart';
import 'package:smart_farm/src/viewmodel/prescription/prescription_cubit.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';

class TaskDetailWidget extends StatefulWidget {
  final String taskId;
  final String? source; // Add a source parameter to track where user came from

  const TaskDetailWidget({super.key, required this.taskId, this.source});

  @override
  State<TaskDetailWidget> createState() => _TaskDetailWidgetState();
}

class _TaskDetailWidgetState extends State<TaskDetailWidget>
    with SingleTickerProviderStateMixin {
  bool _isProcessing = false;
  bool _isLoading = false;
  bool _isHealthyAfterTreatment = false;
  String? _sourceScreen; // Track the source screen

  // --- Task related variables ---
  TaskHaveCageName? task;
  String taskStatus = 'Loading...'; // Start directly at 'in progress'
  GrowthStageDto? growthStage;
  String? userName = '';
  bool get isPending => taskStatus == StatusDataConstant.pendingVn;

  // --- Prescription related variables ---
  PrescriptionDto? prescription;
  String? prescriptionId;

  // --- Weight related variables ---
  DateTime? logTime;
  double? recommendedWeight;
  double actualWeight = 0;
  List<double> weightList = [];

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
  VaccineScheduleDto? vaccineSchedule;
  VaccineScheduleLogDto? vaccineScheduleLog;

  // --- Animal sale related variables ---
  DateTime? saleDate;
  SaleTypeDto? saleType;

  // --- Egg harvest related variables ---
  EggHarvestDto? eggHarvest;

  // --- Upload image related variables ---
  UploadImageDto? uploadImage;

  // --- After treatment variables ---
  int _lastSessionQuantity = 0;
  final TextEditingController _lastSessionQuantityController =
      TextEditingController();

  // --- Image upload ---
  final List<File> _images = [];

  // --- Medication check state ---
  final Map<String, bool> _medicationChecked = {};

  // Function to navigate to symptom reporting screen

  String formatDate(String? date) {
    if (date == null || date.isEmpty) {
      return "N/A"; // Return a default value if the date is null or empty
    }
    try {
      final DateTime parsedDate = DateTime.parse(date);
      final DateFormat formatter = DateFormat('dd/MM/yyyy');
      return formatter.format(parsedDate);
    } catch (e) {
      return "Invalid date"; // Return an error message if parsing fails
    }
  }

  @override
  void initState() {
    super.initState();
    _sourceScreen = widget.source; // Store the source screen
    context.read<TaskBloc>().add(TaskEvent.getTaskById(widget.taskId));
  }

  String getStatusText(String status) {
    switch (status) {
      case StatusDataConstant.inProgress:
        return StatusDataConstant.inProgressVn;
      case StatusDataConstant.done:
        return StatusDataConstant.doneVn;
      case StatusDataConstant.pending:
        return StatusDataConstant.pendingVn;
      case StatusDataConstant.overdue:
        return StatusDataConstant.overdueVn;
      case StatusDataConstant.cancelled:
        return StatusDataConstant.cancelledVn;
      default:
        return status;
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case StatusDataConstant.inProgress:
        return Colors.yellow.shade200;
      case StatusDataConstant.done:
        return Colors.green.shade200;
      case StatusDataConstant.pending:
        return Colors.grey.shade300;
      case StatusDataConstant.overdue:
        return Colors.red.shade200;
      case StatusDataConstant.cancelled:
        return Colors.grey.shade400;
      default:
        return Colors.grey.shade300;
    }
  }

  Color getStatusTextColor(String status) {
    switch (status) {
      case StatusDataConstant.inProgress:
        return Colors.black;
      case StatusDataConstant.done:
        return Colors.white;
      case StatusDataConstant.pending:
        return Colors.black;
      case StatusDataConstant.overdue:
        return Colors.white;
      case StatusDataConstant.cancelled:
        return Colors.black;
      default:
        return Colors.black;
    }
  }

  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red.shade200;
      case 2:
        return Colors.yellow.shade200;
      case 3:
        return Colors.lightBlue.shade300;
      default:
        return Colors
            .lightBlue.shade200; // Treat priorities greater than 3 as "Thấp"
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskBloc, TaskState>(
      listener: (context, state) {
        state.maybeWhen(
          getTaskByIdSuccess: (task, userId) async {
            // Handle task data
            LoadingDialog.hide(context);
            setState(() {
              this.task = task;
              taskStatus = getStatusText(task.status);
              prescriptionId = task.prescriptionId;
            });
            log("Lấy thông tin công việc thành công!");
          },
          getTaskByIdLoading: () {
            LoadingDialog.show(context, "Đang lấy thông tin công việc...");
            log("Đang lấy thông tin công việc...");
          },
          getTaskByIdFailure: (e) async {
            await Future.delayed(const Duration(seconds: 1));
            LoadingDialog.hide(context);
            log("Lấy thông tin công việc thất bại!");
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: CustomAppBar(
          appBarHeight: 70,
          leading: IconButton(
              onPressed: () {
                // Check if we can safely pop or need to redirect
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context)
                      .pop({'reload': false, 'source': _sourceScreen});
                } else {
                  // If we can't pop, navigate to appropriate screen based on source
                  if (_sourceScreen == 'cage') {
                    context.go(RouteName.cage);
                  } else {
                    context.go(RouteName.task);
                  }
                }
              },
              icon: Icon(Icons.arrow_back)),
          title: Column(children: [
            const Text('Chi tiết công việc'),
            Text(
              '${DateFormat('HH:mm').format(TimeUtils.customNow())} - ${CustomDateUtils.formatDate(TimeUtils.customNow())}',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ]),
          actions: [
            if (task?.taskType.taskTypeId == TaskTypeDataConstant.health &&
                task?.status == StatusDataConstant.inProgress) ...[
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.power_settings_new_rounded),
                              title: Text('Kết thúc điều trị'),
                              onTap: () {
                                Navigator.pop(context);
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return WarningConfirmationDialog(
                                      isEmergency: true,
                                      title: 'Kết thúc điều trị',
                                      content: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                              'Bạn đã chắc chắn xác nhận kết thúc điều trị?. Chủ trang trại sẽ nhận được việc kết thúc điều trị với lý do sau: '),
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  top: 12),
                                              padding: const EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primaryContainer,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .outlineVariant,
                                                ),
                                              ),
                                              child: Row(children: [
                                                Text(
                                                  'Lý do: ',
                                                ),
                                                Text('Đàn gà chết hết',
                                                    style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    )),
                                              ])),
                                        ],
                                      ),
                                      secondaryButtonText: 'Hủy',
                                      primaryButtonText: 'Xác nhận',
                                      onPrimaryButtonPressed: () {
                                        if (prescriptionId != null) {
                                          final request =
                                              UpdateStatusPrescriptionRequest(
                                            status: 'Dead',
                                            remainingQuantity: 0,
                                          );
                                          context
                                              .read<PrescriptionCubit>()
                                              .updatePrescriptionStatus(
                                                prescriptionId:
                                                    prescriptionId ?? '',
                                                request: request,
                                              );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showMaterialBanner(
                                                  MaterialBanner(
                                            content: const Text(
                                                'Không nhận được mã đơn thuốc!'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentMaterialBanner();
                                                },
                                                child: const Text('Đóng'),
                                              ),
                                            ],
                                          ));
                                        }
                                      },
                                      onSecondaryButtonPressed: () {
                                        context.pop();
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<UserBloc>().add(const UserEvent.getUserProfile());
            context.read<TaskBloc>().add(TaskEvent.getTaskById(widget.taskId));
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // if (task?.taskType.taskTypeId != TaskTypeDataConstant.health &&
                //     task?.isWarning == false &&
                //     task?.isTreatmentTask == false)
                //   Container(
                //     width: double.infinity,
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 20, vertical: 16),
                //     color:
                //         Theme.of(context).colorScheme.error.withOpacity(0.08),
                //     child: InkWell(
                //       onTap: _navigateToSymptomReport,
                //       child: Row(
                //         children: [
                //           Container(
                //             padding: const EdgeInsets.all(8),
                //             decoration: BoxDecoration(
                //               color: Theme.of(context)
                //                   .colorScheme
                //                   .error
                //                   .withOpacity(0.2),
                //               borderRadius: BorderRadius.circular(8),
                //             ),
                //             child: Icon(
                //               Icons.medical_services_outlined,
                //               color: Theme.of(context).colorScheme.error,
                //             ),
                //           ),
                //           const SizedBox(width: 16),
                //           Expanded(
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text(
                //                   'Phát hiện gia cầm có biểu hiện bệnh?',
                //                   style: TextStyle(
                //                     fontWeight: FontWeight.w600,
                //                     color: Theme.of(context).colorScheme.error,
                //                   ),
                //                 ),
                //                 const SizedBox(height: 4),
                //                 Text(
                //                   'Báo cáo triệu chứng ngay cho bác sĩ thú y',
                //                   style: TextStyle(
                //                     fontSize: 13,
                //                     color: Theme.of(context)
                //                         .colorScheme
                //                         .error
                //                         .withOpacity(0.8),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //           Icon(
                //             Icons.arrow_forward_ios,
                //             size: 16,
                //             color: Theme.of(context).colorScheme.error,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // Add Warning Notification if isWarning is true
                if (task?.isWarning == true)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    color: Theme.of(context).colorScheme.errorContainer,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .error
                                .withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.warning_amber_rounded,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cảnh báo: Công việc có vấn đề',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Đã có báo cáo triệu chứng bệnh cho chuồng này',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onErrorContainer,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      top: 24, left: 20, right: 20, bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Thông tin công việc',
                          style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 16),
                      Row(children: [
                        Icon(
                          Icons.task_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 8),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tên công việc',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                    fontSize: 13,
                                  )),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  const SizedBox(width: 4),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Text(
                                      task?.taskName ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                ],
                              ),
                            ])
                      ]),
                      const SizedBox(height: 16),
                      Text(
                        'Mô tả',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              task?.description ?? "",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.only(left: 20, bottom: 24, right: 20),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant,
                        width: 1,
                      ),
                    ),
                    color: Colors.white,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Số cột
                      mainAxisSpacing: 16, // Khoảng cách giữa các hàng
                      crossAxisSpacing: 16, // Khoảng cách giữa các cột
                      childAspectRatio: 3, // Tỉ lệ chiều rộng / chiều cao
                    ),
                    itemCount: 6,
                    // Tổng số phần tử trong lưới
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return TaskInfoGridItem(
                            icon: LinearIcons.homeHashtagIcon,
                            label: 'Tên chuồng',
                            value: task?.isTreatmentTask == true
                                ? 'Chuồng cách ly'
                                : task?.cageName ?? "",
                          );
                        case 1:
                          return TaskInfoGridItem(
                            icon: LinearIcons.notiStatusIcon,
                            label: 'Trạng thái',
                            value: getStatusText(task?.status ?? ""),
                            color: getStatusColor(task?.status ?? ""),
                          );
                        case 2:
                          return TaskInfoGridItem(
                            icon: LinearIcons.categoryIcon,
                            label: 'Loại công việc',
                            value: task?.taskType.taskTypeName ?? "",
                          );
                        case 3:
                          return TaskInfoGridItem(
                            icon: LinearIcons.calendarRemoveIcon,
                            label: 'Hạn chót',
                            value: formatDate(task?.dueDate ?? ""),
                          );
                        case 4:
                          return TaskInfoGridItem(
                            icon: Icon(Icons.wb_sunny_outlined),
                            label: 'Buổi',
                            value: TimeUtils.getCurrentSessionName(),
                          );
                        default:
                          return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: FilledButton(
            onPressed: (taskStatus == StatusDataConstant.doneVn ||
                    taskStatus == StatusDataConstant.overdueVn ||
                    taskStatus == StatusDataConstant.cancelledVn ||
                    taskStatus == StatusDataConstant.pendingVn
                // taskStatus == StatusDataConstant.inProgressVn &&
                //     !_canCompleteTask()
                )
                ? null
                : ((task?.taskType.taskTypeId == TaskTypeDataConstant.feeding ||
                        task?.taskType.taskTypeId ==
                            TaskTypeDataConstant.health ||
                        task?.taskType.taskTypeId ==
                            TaskTypeDataConstant.vaccin ||
                        task?.taskType.taskTypeId ==
                            TaskTypeDataConstant.sellAnimal ||
                        task?.taskType.taskTypeId ==
                            TaskTypeDataConstant.weighing ||
                        task?.taskType.taskTypeId ==
                            TaskTypeDataConstant.eggHarvest ||
                        task?.taskType.taskTypeId ==
                            TaskTypeDataConstant.sellEgg)
                    ? () {
                        context.push(RouteName.taskReport, extra: {
                          'task': task,
                          'source': widget.source,
                        });
                      }
                    : null),
            child: _isProcessing
                ? ProcessingButtonWidget(loadingMessage: 'Đang xử lý...')
                : _contentButton(),
          ),
        ),
      ),
    );
  }

  // Widget _contentButton() {
  //   if (taskStatus == StatusDataConstant.inProgressVn) {
  //     if (task?.taskType.taskTypeId == TaskTypeDataConstant.health &&
  //         !_areAnyMedicationsChecked()) {
  //       return const Text('Chưa ghi nhận đã cho uống thuốc');
  //     } else if (task?.taskType.taskTypeId == TaskTypeDataConstant.feeding &&
  //         task?.hasAnimalDesease == true &&
  //         !_isIsolationFed) {
  //       return const Text('Vui lòng xác nhận đã cho ăn ở chuồng cách ly');
  //     } else {
  //       return const Text('Xác nhận hoàn thành');
  //     }
  //   } else if (taskStatus == StatusDataConstant.doneVn) {
  //     return const Text('Công việc đã hoàn thành');
  //   } else if (taskStatus == StatusDataConstant.overdueVn) {
  //     return const Text('Công việc đã quá hạn');
  //   } else if (taskStatus == StatusDataConstant.cancelledVn) {
  //     return const Text('Công việc đã bị hủy');
  //   } else {
  //     return Text(_isWithinWorkingHours()
  //         ? 'Xác nhận làm việc'
  //         : 'Chưa đến giờ làm việc');
  //   }
  // }

  Widget _contentButton() {
    if (taskStatus == StatusDataConstant.inProgressVn) {
      if ((task?.taskType.taskTypeId == TaskTypeDataConstant.feeding ||
          task?.taskType.taskTypeId == TaskTypeDataConstant.health ||
          task?.taskType.taskTypeId == TaskTypeDataConstant.vaccin ||
          task?.taskType.taskTypeId == TaskTypeDataConstant.sellAnimal ||
          task?.taskType.taskTypeId == TaskTypeDataConstant.weighing ||
          task?.taskType.taskTypeId == TaskTypeDataConstant.eggHarvest ||
          task?.taskType.taskTypeId == TaskTypeDataConstant.sellEgg)) {
        return const Text('Báo cáo công việc');
      } else {
        return const Text('Xác nhận hoàn thành');
      }
    } else if (taskStatus == StatusDataConstant.doneVn) {
      return const Text('Công việc đã hoàn thành');
    } else if (taskStatus == StatusDataConstant.overdueVn) {
      return const Text('Công việc đã quá hạn');
    } else if (taskStatus == StatusDataConstant.cancelledVn) {
      return const Text('Công việc đã bị hủy');
    } else {
      return const Text('Chưa đến giờ làm việc');
    }
  }
}
