import 'package:data_layer/model/response/medical_symptom/medical_symptom_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';

class SymptomSuccessWidget extends StatefulWidget {
  final MedicalSymptomResponse symptom;
  final String cageName;
  final bool fromTask;
  final String? taskId;

  const SymptomSuccessWidget({
    super.key,
    required this.symptom,
    required this.cageName,
    this.fromTask = false,
    this.taskId,
  });

  @override
  State<SymptomSuccessWidget> createState() => _SymptomSuccessWidgetState();
}

class _SymptomSuccessWidgetState extends State<SymptomSuccessWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.fromTask && widget.taskId != null) {
          context.go(RouteName.task); // Go back to task list
          return false;
        }
        context.go(RouteName.symptom);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => context.go(RouteName.symptom),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Success Animation
              _buildSuccessAnimation(),

              // Report Details Card
              _buildReportDetailsCard(),

              // Show additional task-related success info if from task
              if (widget.fromTask) _buildTaskSuccessCard(),

              // Additional info section
              _buildSuccessStepsSection(),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomActions(),
      ),
    );
  }

  Widget _buildSuccessAnimation() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Lottie.asset(
            'assets/animations/success.json',
            controller: _controller,
            width: 160,
            height: 160,
            fit: BoxFit.contain,
            onLoaded: (composition) {
              _controller
                ..duration = composition.duration
                ..forward();
            },
          ),
          const SizedBox(height: 16),
          Text(
            widget.fromTask ? 'Xử lý thành công!' : 'Tạo báo cáo thành công!',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.fromTask
                ? 'Báo cáo triệu chứng và log công việc đã được ghi nhận'
                : 'Báo cáo của bạn đã được ghi nhận',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildReportDetailsCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              border: Border(
                bottom: BorderSide(color: Colors.grey[200]!),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset('assets/images/medical-report.png',
                      width: 28),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Chi tiết báo cáo triệu chứng',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      Text(
                        DateFormat('dd/MM/yyyy HH:mm')
                            .format(widget.symptom.createAt),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.orange),
                  ),
                  child: const Text(
                    'Chờ xem xét',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow(
                  'Chuồng nuôi',
                  widget.cageName,
                  LinearIcons.chickenIconMedium,
                ),
                const SizedBox(height: 16),
                _buildDetailRow(
                  'Số lượng bị bệnh',
                  '${widget.symptom.affectedQuantity}/${widget.symptom.quantity} con',
                  LinearIcons.warningAboutIcon,
                  valueColor: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(height: 16),
                _buildDetailRow(
                  'Triệu chứng',
                  widget.symptom.symtom ?? "",
                  Image.asset('assets/images/corona-virus.png', width: 24),
                ),
                if (widget.symptom.notes.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  _buildDetailRow('Ghi chú', widget.symptom.notes,
                      Image.asset('assets/images/notes.png', width: 24)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskSuccessCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green[100]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              border: Border(
                bottom: BorderSide(color: Colors.green[100]!),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child:
                      Icon(Icons.task_alt, color: Colors.green[700], size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Thông tin công việc liên quan',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      Text(
                        'Đã xử lý và cập nhật',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green),
                  ),
                  child: Text(
                    'Hoàn thành',
                    style: TextStyle(
                      color: Colors.green[700],
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Task info content
          FutureBuilder(
            future: Future(() {
              final taskBloc = context.read<TaskBloc>();
              taskBloc.add(TaskEvent.getTaskById(widget.taskId!));
            }),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<TaskBloc, TaskState>(
                      builder: (context, state) {
                        state.maybeWhen(
                          getTaskByIdLoading: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          getTaskByIdSuccess: (task, userId) {
                            return _buildDetailRow(
                              'Công việc',
                              task.taskName,
                              Icon(Icons.assignment_outlined,
                                  color: Colors.green[700], size: 24),
                              valueColor: Colors.green[700],
                            );
                          },
                          getTaskByIdFailure: (error) {
                            return const Center(
                              child: Text('Không thể tải thông tin công việc'),
                            );
                          },
                          orElse: () {},
                        );
                        return const SizedBox.shrink();
                      },
                    ),
                    _buildDetailRow(
                      'Trạng thái cập nhật',
                      'Đã đánh dấu là công việc cách ly',
                      Icon(Icons.medical_services_outlined,
                          color: Colors.amber[700], size: 24),
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow(
                      'Công việc đã hoàn thành',
                      'Đã tạo log và cập nhật trạng thái',
                      Icon(Icons.check_circle_outline,
                          color: Colors.green[700], size: 24),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildSuccessStepsSection() {
    if (!widget.fromTask) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: Colors.blue[700]),
              const SizedBox(width: 8),
              Text(
                'Các bước đã thực hiện',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildStepItem(
            index: 1,
            title: 'Tạo báo cáo triệu chứng',
            description: 'Báo cáo đã được lưu và gửi đến bác sĩ thú y',
            isCompleted: true,
          ),
          _buildStepItem(
            index: 2,
            title: 'Đánh dấu công việc cần cách ly',
            description: 'Công việc đã được đánh dấu cần điều trị',
            isCompleted: true,
          ),
          _buildStepItem(
            index: 3,
            title: 'Tạo log tự động',
            description: 'Log đã được tạo tự động cho công việc này',
            isCompleted: true,
          ),
          _buildStepItem(
            index: 4,
            title: 'Cập nhật trạng thái công việc',
            description: 'Công việc đã được đánh dấu hoàn thành',
            isCompleted: true,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem({
    required int index,
    required String title,
    required String description,
    required bool isCompleted,
    bool isLast = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: isCompleted ? Colors.green : Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: isCompleted
                    ? const Icon(Icons.check, color: Colors.white, size: 16)
                    : Text(
                        index.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: isCompleted ? Colors.green : Colors.grey[300],
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isCompleted ? Colors.black87 : Colors.grey[600],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13,
                ),
              ),
              SizedBox(height: isLast ? 0 : 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomActions() {
    return Container(
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
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {
                if (widget.fromTask && widget.taskId != null) {
                  // Return to specific task detail page
                  context.go(
                    '${RouteName.taskDetail}?taskId=${widget.taskId}',
                    extra: widget.taskId,
                  );
                } else {
                  context.go(RouteName.home);
                }
              },
              icon: Icon(
                widget.fromTask ? Icons.assignment : Icons.home,
                size: 18,
              ),
              label: Text(widget.fromTask ? 'Quay lại c.việc' : 'Về trang chủ'),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: FilledButton.icon(
              onPressed: () {
                if (widget.fromTask && widget.taskId != null) {
                  // Create another symptom for the same cage
                  context.push(RouteName.createSymptom, extra: {
                    'cageName': widget.cageName,
                    'taskId': widget.taskId,
                    'fromTask': true
                  });
                } else {
                  context.push(RouteName.createSymptom, extra: {
                    'cageName': widget.symptom.id,
                  });
                }
              },
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Tạo báo cáo mới'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, Widget icon,
      {Color? valueColor}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: icon,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 15,
                  color: valueColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
