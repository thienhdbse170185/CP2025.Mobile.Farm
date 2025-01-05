import 'dart:developer';

import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:data_layer/model/entity/cage/cage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/view/export.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';
import 'package:smart_farm/src/view/widgets/custom_divider.dart';
import 'package:smart_farm/src/view/widgets/task_list.dart';
import 'package:smart_farm/src/viewmodel/cage/cage_cubit.dart'; // Import the TaskCard widget
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';

class CageWidget extends StatefulWidget {
  final String cageId;
  final Color color;
  const CageWidget({super.key, required this.cageId, required this.color});

  @override
  State<CageWidget> createState() => _CageWidgetState();
}

class _CageWidgetState extends State<CageWidget> {
  DateTime selectedDate = DateTime.now(); // Store the selected date

  Map<String, List<TaskHaveCageName>> tasks = {};
  Cage? cage;

  List<String> cageNames = [
    "-- Chọn chuồng --",
    "Cage 1",
    "Cage 2",
    "Cage 3"
  ]; // Add this line
  String selectedCageName = "-- Chọn chuồng --"; // Add this line

  String get formattedDate {
    return DateFormat('EEEE, dd/MM/yyyy', 'vi').format(selectedDate);
  }

  final List<HomeFeatures> features = [
    HomeFeatures(
      icon: LinearIcons.aboutIcon,
      title: 'Báo cáo vấn đề',
      routeName: RouteName.createTicket,
    ),
    HomeFeatures(
      icon: LinearIcons.healthIconGreen,
      title: 'Vật nuôi bị bệnh',
      routeName: RouteName.createSymptom,
    ),
    HomeFeatures(
      title: 'Gọi khẩn cấp',
      icon: LinearIcons.phoneCallingIconGreen,
      routeName: RouteName.support,
    )
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2024),
          lastDate: DateTime(2028),
        )) ??
        selectedDate;

    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      // Call the API to fetch tasks for the selected date
      context
          .read<TaskBloc>()
          .add(TaskEvent.getTasksByCageId(picked, widget.cageId));
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().add(TaskEvent.getTasksByCageId(
          selectedDate,
          widget.cageId,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final doneTasks = tasks.values.expand((element) => element).where((task) {
      return task.status.toLowerCase() == 'done';
    }).toList();
    final inProgressTasks =
        tasks.values.expand((element) => element).where((task) {
      return task.status.toLowerCase() == 'inprogress';
    }).toList();
    final pendingTasks =
        tasks.values.expand((element) => element).where((task) {
      return task.status.toLowerCase() == 'pending';
    }).toList();

    return MultiBlocListener(
      listeners: [
        BlocListener<TaskBloc, TaskState>(
          listener: (context, state) {
            state.maybeWhen(
              loading: () {
                LoadingDialog.show(context, 'Đang tải công việc...');
              },
              getTasksByCageIdSuccess: (tasksResponse) async {
                await Future.delayed(const Duration(seconds: 1));
                LoadingDialog.hide(context);
                setState(() {
                  tasks = tasksResponse;
                });
                log('Lấy công việc theo chuồng thành công!');
                context.read<CageCubit>().getCageById(widget.cageId);
              },
              getTasksFailure: (e) {
                LoadingDialog.hide(context);
                SnackBar(content: Text(e.toString()));
                log('Lấy công việc theo chuồng thất bại!');
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<CageCubit, CageState>(listener: (context, state) {
          state.maybeWhen(
            loadByIdSuccess: (cage) async {
              await Future.delayed(const Duration(seconds: 2));
              log('Lấy thông tin chuồng thành công!');
              LoadingDialog.hide(context);
              setState(() {
                this.cage = cage;
              });
            },
            loadByIdInProgress: () {
              log('Đang lấy thông tin chuồng...');
              LoadingDialog.show(context, 'Đang lấy thông tin chuồng...');
            },
            loadByIdFailure: (e) {
              log('Lấy thông tin chuồng thất bại!');
              LoadingDialog.hide(context);
            },
            orElse: () {},
          );
        }),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          leading: IconButton(
            icon: LinearIcons.arrowBackIcon,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          appBarHeight: MediaQuery.of(context).size.height * 0.08,
          title: Column(
            children: [
              Text(
                cage?.name ?? 'Đang tải...',
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    formattedDate,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () => _selectDate(context),
                    child: Text('Thay đổi',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              decoration: TextDecoration.underline,
                            )),
                  )
                ],
              )
            ],
          ),
          // centerTitle: false,
          // actions: [
          //   InkWell(
          //     onTap: () => _selectDate(context),
          //     child: Chip(
          //       shape: const StadiumBorder(
          //           side: BorderSide(width: 0, color: Colors.transparent)),
          //       label: Text(
          //         formattedDate,
          //         style: TextStyle(
          //           color: Theme.of(context).colorScheme.primary,
          //         ),
          //       ),
          //       avatar: LinearIcons.calendarIcon,
          //       backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          //     ),
          //   ),
          // ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<TaskBloc>().add(TaskEvent.getTasksByCageId(
                  selectedDate,
                  widget.cageId,
                ));
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16),
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    color: Theme.of(context).colorScheme.primary,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/line_background.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (inProgressTasks.isEmpty &&
                                      doneTasks.isEmpty &&
                                      pendingTasks.isEmpty) ...[
                                    const SizedBox(height: 8),
                                    Text('Không có Task',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(color: Colors.white)),
                                    const SizedBox(height: 8)
                                  ] else ...[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Tiến độ công việc',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                      color: Colors.white),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        color: Colors.white),
                                                children: [
                                                  const TextSpan(
                                                      text: 'Đã làm: '),
                                                  TextSpan(
                                                    text:
                                                        '${doneTasks.length}', // Số task đã làm
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        '/${doneTasks.length + inProgressTasks.length + pendingTasks.length} task.',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 16),
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 5,
                                                value: doneTasks.isNotEmpty
                                                    ? doneTasks.length /
                                                        (doneTasks.length +
                                                            inProgressTasks
                                                                .length +
                                                            pendingTasks.length)
                                                    : 0.0,
                                                backgroundColor: Colors.white30,
                                                valueColor:
                                                    const AlwaysStoppedAnimation<
                                                        Color>(Colors.white),
                                              ),
                                            ),
                                            Text(
                                              '${((doneTasks.length / (doneTasks.length + inProgressTasks.length + pendingTasks.length).clamp(1, double.infinity)) * 100).round()}%',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Lottie.asset(
                              'assets/animations/chicken_adult.json',
                              width: 100,
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Container(
                //   color: const Color(0xFFFFFFFF),
                //   width: MediaQuery.of(context).size.width,
                //   child: Padding(
                //     padding:
                //         const EdgeInsets.only(top: 24, left: 16, right: 16),
                //     child: Column(
                //       children: [
                //         SizedBox(
                //           height: MediaQuery.of(context).size.height * 0.12,
                //           child: GridView.builder(
                //               gridDelegate:
                //                   const SliverGridDelegateWithFixedCrossAxisCount(
                //                       crossAxisCount: 3,
                //                       mainAxisSpacing: 32,
                //                       crossAxisSpacing: 12,
                //                       childAspectRatio: 1),
                //               itemBuilder: (context, index) {
                //                 if (index < features.length) {
                //                   final feature = features[index];
                //                   return GestureDetector(
                //                       onTap: () => context
                //                               .push(feature.routeName, extra: {
                //                             'cageName': cage?.name ?? ''
                //                           }), // Update this line
                //                       child: MenuFeatureWidget(
                //                         title: feature.title,
                //                         icon: feature.icon,
                //                       ));
                //                 }
                //                 return null;
                //               }),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                const SizedBox(height: 16),
                CustomDividerWidget(),
                if (tasks.values.every((tasks) => tasks.isEmpty)) ...[
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer
                                    .withOpacity(0.4)),
                            width: 120,
                            height: 120,
                            child: Icon(
                              Icons.task_alt_outlined,
                              size: 64,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.4),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Không có công việc nào\n trong hôm nay',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .outlineVariant,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ] else ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Move the date display to be inline with the "Công việc" text
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Công việc',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        ..._buildSessionSections(tasks),
                      ],
                    ),
                  )
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSessionSections(
      Map<String, List<TaskHaveCageName>> tasks) {
    return tasks.entries.map((entry) {
      final session = entry.key;
      final sessionTasks = entry.value;

      // Tính tổng số lượng tasks trong session
      int totalTasks = sessionTasks.length;

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
          sessionTitle = 'Buổi trưa';
          image = 'assets/images/afternoon.png';
          break;
        case 'Evening':
          sessionTitle = 'Buổi chiều';
          image = 'assets/images/moon.png';
          break;
        default:
          sessionTitle = 'Khác';
      }

      return Container(
        color: Colors.white,
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
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
                  const Spacer(),
                  Text(
                    '$totalTasks công việc',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ...sessionTasks.map((task) => TaskListWidget(tasks: [task])),
          ],
        ),
      );
    }).toList();
  }
}
