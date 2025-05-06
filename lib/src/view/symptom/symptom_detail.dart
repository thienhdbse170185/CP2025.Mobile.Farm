import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/model/dto/farming_batch/farming_batch_dto.dart';
import 'package:smart_farm/src/model/request/symptom/create_symptom/create_symptom_request.dart';
import 'package:smart_farm/src/model/response/medical_symptom/medical_symptom_response.dart';
import 'package:smart_farm/src/viewmodel/farming_batch/farming_batch_cubit.dart';

class SymptomDetailWidget extends StatefulWidget {
  final MedicalSymptomResponse symptom;

  const SymptomDetailWidget({
    super.key,
    required this.symptom,
  });

  @override
  State<SymptomDetailWidget> createState() => _SymptomDetailWidgetState();
}

class _SymptomDetailWidgetState extends State<SymptomDetailWidget> {
  FarmingBatchDto? farmingBatchDto;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    context.read<FarmingBatchCubit>().getFarmingBatchById(
          widget.symptom.farmingBatchId,
        );
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy HH:mm').format(date);
  }

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

  Color _getPrescriptionStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green;
      case 'completed':
        return Colors.blue;
      case 'cancelled':
        return Colors.red;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  Widget _buildInfoRow(String label, String value, Widget icon) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 8),
        Text(
          '$label:',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return BlocListener<FarmingBatchCubit, FarmingBatchState>(
      listener: (context, state) {
        state.maybeWhen(
          getFarmingBatchByIdInProgress: () {
            setState(() {
              _isLoading = true;
            });
          },
          getFarmingBatchByIdSuccess: (farmingBatch) {
            setState(() {
              _isLoading = false;
              farmingBatchDto = farmingBatch;
            });
          },
          getFarmingBatchByIdFailure: (message) {
            setState(() {
              _isLoading = false;
            });
            log('Lỗi khi lấy thông tin chi tiết báo cáo: $message');
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          title: const Text(
            'Chi tiết báo cáo',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop(),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: _getStatusColor(widget.symptom.status),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _getStatusText(widget.symptom.status),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            _formatDate(widget.symptom.createAt),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Species information
                  if (widget.symptom.nameAnimal != null &&
                      widget.symptom.nameAnimal!.isNotEmpty)
                    Text(
                      'Loài: ${widget.symptom.nameAnimal}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),

                    // Farm batch information card (New)
                    if (farmingBatchDto != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.teal.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Image.asset(
                                        'assets/images/farm.png',
                                        width: 24,
                                        height: 24,
                                        color: Colors.teal,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Icon(Icons.agriculture,
                                                    color: Colors.teal),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Thông tin vụ nuôi',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                // Batch information
                                _buildInfoRow(
                                  'Tên vụ nuôi',
                                  farmingBatchDto!.name,
                                  Icon(Icons.description,
                                      size: 16, color: Colors.grey),
                                ),
                                const SizedBox(height: 8),
                                _buildInfoRow(
                                  'Chuồng',
                                  farmingBatchDto!.cageName ?? 'N/A',
                                  Icon(Icons.warehouse,
                                      size: 16, color: Colors.grey),
                                ),
                                const SizedBox(height: 8),
                                // Cage information
                                if (farmingBatchDto!.cage != null) ...[
                                  const Divider(height: 24),
                                  _buildInfoRow(
                                    'Chuồng',
                                    farmingBatchDto!.cageName!,
                                    Image.asset(
                                      'assets/images/cage.png',
                                      width: 16,
                                      height: 16,
                                      color: Colors.grey.shade700,
                                      errorBuilder:
                                          (context, error, stackTrace) => Icon(
                                              Icons.home,
                                              size: 16,
                                              color: Colors.grey),
                                    ),
                                  ),
                                ],
                                // Growth stage information if available
                                if (farmingBatchDto!.growthStageDetails !=
                                    null) ...[
                                  const Divider(height: 24),
                                  _buildInfoRow(
                                    'Giai đoạn phát triển',
                                    farmingBatchDto!.growthStageDetails!.name,
                                    Icon(Icons.trending_up,
                                        size: 16, color: Colors.grey),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),

                    const SizedBox(height: 16),

                    // Stats Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Expanded(
                                child: _buildStatItem(
                                  context,
                                  'Số lượng bị bệnh',
                                  '${widget.symptom.affectedQuantity}',
                                  Icons.warning_amber_outlined,
                                  Colors.red,
                                ),
                              ),
                              Container(
                                height: 60,
                                width: 1,
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              Expanded(
                                child: _buildStatItem(
                                  context,
                                  'Tổng số',
                                  '${farmingBatchDto?.currentQuantity}',
                                  Icons.pets,
                                  primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Main content with tabs
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Section Title
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: primaryColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(
                                      'assets/images/corona-virus.png',
                                      width: 20,
                                      height: 20,
                                      color: primaryColor,
                                      errorBuilder:
                                          (context, error, stackTrace) => Icon(
                                              Icons.coronavirus,
                                              color: primaryColor,
                                              size: 20),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Triệu chứng',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),

                              // Symptom description
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade50,
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: Colors.grey.shade200),
                                ),
                                child: Text(
                                  widget.symptom.symtom ?? 'Không có thông tin',
                                  style: TextStyle(
                                    fontSize: 15,
                                    height: 1.5,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 24),

                              // Notes section if available
                              if (widget.symptom.notes.isNotEmpty) ...[
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.amber.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Image.asset(
                                        'assets/images/notes.png',
                                        width: 20,
                                        height: 20,
                                        color: Colors.amber.shade700,
                                        errorBuilder: (context, error,
                                                stackTrace) =>
                                            Icon(Icons.note,
                                                color: Colors.amber.shade700,
                                                size: 20),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Ghi chú',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.amber.shade50,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.amber.shade100),
                                  ),
                                  child: Text(
                                    widget.symptom.notes,
                                    style: TextStyle(
                                      fontSize: 15,
                                      height: 1.5,
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                              ],

                              // Diagnosis section if available
                              if (widget.symptom.diagnosis != null &&
                                  widget.symptom.diagnosis!.isNotEmpty) ...[
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.green.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Image.asset(
                                        'assets/images/stethoscope.png',
                                        width: 20,
                                        height: 20,
                                        color: Colors.green.shade700,
                                        errorBuilder: (context, error,
                                                stackTrace) =>
                                            Icon(Icons.medical_services,
                                                color: Colors.green.shade700,
                                                size: 20),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Kết luận chẩn đoán',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade50,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.green.shade100),
                                  ),
                                  child: Text(
                                    widget.symptom.diagnosis!,
                                    style: TextStyle(
                                      fontSize: 15,
                                      height: 1.5,
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Images section if available
                    if (widget.symptom.pictures != null &&
                        widget.symptom.pictures!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Icons.image,
                                        color: Colors.blue,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    const Text(
                                      'Hình ảnh',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                    childAspectRatio: 1,
                                  ),
                                  itemCount: widget.symptom.pictures!.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        _showFullScreenImage(
                                          context,
                                          widget.symptom.pictures!,
                                          index,
                                        );
                                      },
                                      child: Hero(
                                        tag:
                                            'image_${widget.symptom.pictures![index].image}',
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                blurRadius: 8,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.network(
                                              widget.symptom.pictures![index]
                                                  .image,
                                              fit: BoxFit.cover,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Container(
                                                  color: Colors.grey.shade200,
                                                  child: const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                );
                                              },
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Container(
                                                  color: Colors.grey.shade200,
                                                  child: const Center(
                                                    child: Icon(Icons.error),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    // Prescription info if available
                    if (widget.symptom.prescriptions != null &&
                        widget.symptom.prescriptions!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.purple.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Icons.medication,
                                        color: Colors.purple,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    const Text(
                                      'Đơn thuốc',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      widget.symptom.prescriptions!.length,
                                  separatorBuilder: (context, index) =>
                                      const Divider(height: 32),
                                  itemBuilder: (context, index) {
                                    final prescription =
                                        widget.symptom.prescriptions![index];
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Prescription header
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Đơn thuốc #${index + 1}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.purple.shade700,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: 4,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    _getPrescriptionStatusColor(
                                                            prescription.status)
                                                        .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color:
                                                      _getPrescriptionStatusColor(
                                                          prescription.status),
                                                ),
                                              ),
                                              child: Text(
                                                prescription.status,
                                                style: TextStyle(
                                                  color:
                                                      _getPrescriptionStatusColor(
                                                          prescription.status),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),

                                        // Prescription details
                                        _buildInfoRow(
                                          'Ngày kê đơn',
                                          DateFormat('dd/MM/yyyy').format(
                                              prescription.prescribedDate),
                                          const Icon(Icons.calendar_today,
                                              size: 16, color: Colors.grey),
                                        ),
                                        const SizedBox(height: 8),
                                        _buildInfoRow(
                                          'Số ngày uống thuốc',
                                          '${prescription.daysToTake} ngày',
                                          const Icon(Icons.access_time,
                                              size: 16, color: Colors.grey),
                                        ),
                                        if (prescription.endDate != null) ...[
                                          const SizedBox(height: 8),
                                          _buildInfoRow(
                                            'Ngày kết thúc',
                                            DateFormat('dd/MM/yyyy')
                                                .format(prescription.endDate!),
                                            const Icon(Icons.event_available,
                                                size: 16, color: Colors.grey),
                                          ),
                                        ],
                                        const SizedBox(height: 8),
                                        _buildInfoRow(
                                          'Số lượng vật nuôi',
                                          '${prescription.quantityAnimal}',
                                          const Icon(Icons.pets,
                                              size: 16, color: Colors.grey),
                                        ),
                                        if (prescription.price != null) ...[
                                          const SizedBox(height: 8),
                                          _buildInfoRow(
                                            'Giá tiền',
                                            '${prescription.price!.toStringAsFixed(0)} VND',
                                            const Icon(Icons.attach_money,
                                                size: 16, color: Colors.grey),
                                          ),
                                        ],
                                        const SizedBox(height: 12),

                                        // Medications list
                                        if (prescription.medications != null &&
                                            prescription
                                                .medications!.isNotEmpty) ...[
                                          Text(
                                            'Danh sách thuốc',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey.shade800,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: Colors.grey.shade200),
                                            ),
                                            child: ListView.separated(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: prescription
                                                  .medications!.length,
                                              separatorBuilder:
                                                  (context, index) => Divider(
                                                height: 1,
                                                color: Colors.grey.shade300,
                                              ),
                                              itemBuilder: (context, medIndex) {
                                                final medication = prescription
                                                    .medications![medIndex];
                                                return ListTile(
                                                  title: Text(
                                                    medication.medicationName,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  subtitle: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(height: 4),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Liều lượng: ',
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              color: Colors.grey
                                                                  .shade600,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Sáng: ${medication.morning} (liều). Trưa: ${medication.noon}. Chiều: ${medication.afternoon}. Tối: ${medication.evening}',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  leading: Container(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      color: Colors.purple
                                                          .withOpacity(0.1),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/medicine.png',
                                                      width: 24,
                                                      height: 24,
                                                      color: Colors.purple,
                                                      errorBuilder: (context,
                                                              error,
                                                              stackTrace) =>
                                                          const Icon(
                                                        Icons.medication,
                                                        color: Colors.purple,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],

                                        // Notes if available
                                        if (prescription.notes != null &&
                                            prescription.notes!.isNotEmpty) ...[
                                          const SizedBox(height: 16),
                                          Text(
                                            'Ghi chú',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey.shade800,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: Colors.purple.shade50,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color:
                                                      Colors.purple.shade100),
                                            ),
                                            child: Text(
                                              prescription.notes!,
                                              style: TextStyle(
                                                fontSize: 14,
                                                height: 1.5,
                                                color: Colors.grey.shade800,
                                              ),
                                            ),
                                          ),
                                        ],

                                        // View full details button
                                        const SizedBox(height: 16),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              context.push(
                                                '/prescription-details/${prescription.id}',
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.purple.shade100,
                                              foregroundColor:
                                                  Colors.purple.shade700,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12),
                                            ),
                                            child: const Text(
                                              'Xem chi tiết đơn thuốc',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    // Add spacing at the bottom of the page
                    const SizedBox(height: 32),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
          size: 24,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  void _showFullScreenImage(
    BuildContext context,
    List<PictureSymptom> images,
    int initialIndex,
  ) {
    showDialog(
      context: context,
      builder: (context) => Dialog.fullscreen(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Image viewer with pageview
            PageView.builder(
              controller: PageController(initialPage: initialIndex),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: InteractiveViewer(
                    minScale: 0.5,
                    maxScale: 4.0,
                    child: Hero(
                      tag: 'image_${images[index].image}',
                      child: Image.network(
                        images[index].image,
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 48,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            // Close button
            Positioned(
              top: 16,
              right: 16,
              child: Material(
                color: Colors.black.withOpacity(0.5),
                shape: const CircleBorder(),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(24),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
