import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_farm/src/core/router.dart';

class CreateDeathReportSuccessScreen extends StatefulWidget {
  final String cageName;
  final int deathCount;
  final int totalCount;
  final DateTime createAt;

  const CreateDeathReportSuccessScreen({
    super.key,
    required this.cageName,
    required this.deathCount,
    required this.totalCount,
    required this.createAt,
  });

  @override
  State<CreateDeathReportSuccessScreen> createState() =>
      _CreateDeathReportSuccessScreenState();
}

class _CreateDeathReportSuccessScreenState
    extends State<CreateDeathReportSuccessScreen>
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
        context.go(RouteName.profile);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => context.go(RouteName.profile),
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

              // Additional info section
              _buildSuccessInfoSection(),
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
            'Tạo báo cáo thành công!',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Báo cáo thất thoát đã được ghi nhận',
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
                  child: Icon(Icons.report_problem_outlined,
                      color: Theme.of(context).colorScheme.error, size: 28),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Chi tiết báo cáo thất thoát',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      Text(
                        DateFormat('dd/MM/yyyy HH:mm').format(widget.createAt),
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
                  Icon(Icons.home_outlined,
                      color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(height: 16),
                _buildDetailRow(
                  'Số lượng thất thoát',
                  '${widget.deathCount}/${widget.totalCount} con',
                  Icon(Icons.warning_amber_outlined,
                      color: Theme.of(context).colorScheme.error),
                  valueColor: Theme.of(context).colorScheme.error,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessInfoSection() {
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
                'Thông tin thêm',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Báo cáo thất thoát sẽ được gửi đến bác sĩ thú y và cập nhật vào hệ thống trong vòng 24 giờ. Số lượng gia cầm trong chuồng sẽ được cập nhật sau khi báo cáo được xác nhận.',
            style: TextStyle(
              color: Colors.blue[800],
              height: 1.5,
            ),
          ),
        ],
      ),
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
              onPressed: () => context.go(RouteName.profile),
              icon: const Icon(Icons.person, size: 18),
              label: const Text('Về trang cá nhân'),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: FilledButton.icon(
              onPressed: () {
                // Navigate to create new death report
                context.push(RouteName.createDeathReport);
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
