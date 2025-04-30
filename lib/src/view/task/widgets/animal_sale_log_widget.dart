import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/model/dto/index.dart';
import 'package:smart_farm/src/model/dto/sale_log_detail/sale_log_detail_dto.dart';
import 'package:smart_farm/src/model/dto/task/sale_detail_log/sale_detail_log_dto.dart';
import 'package:smart_farm/src/model/dto/task/sale_log/sale_log_dto.dart';
import 'package:smart_farm/src/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:smart_farm/src/view/task/widgets/quantity_button_widget.dart';
import 'package:smart_farm/src/viewmodel/farming_batch/farming_batch_cubit.dart';

class AnimalSaleLogWidget extends StatefulWidget {
  final String? userName;
  final GrowthStageDto? growthStage;
  final FarmingBatchDto? farmingBatch;
  final TextEditingController weightMeatSellController;
  final TextEditingController priceMeatSellController;
  final TextEditingController dateAnimalSellController;
  final TextEditingController
      animalCountSellController; // New controller for animal count
  final TextEditingController logController;
  final DateTime saleDate;
  final ValueChanged<DateTime>? onDateChanged;
  final ValueChanged<double>? onWeightChanged;
  final ValueChanged<String>? onPriceChanged;
  final ValueChanged<int>?
      onAnimalCountChanged; // New callback for animal count
  final TaskHaveCageName task;
  final bool readOnly;
  final SaleLogDto? salelog;
  final SaleDetailLogDto? saleDetailLog;
  final SaleLogDetailDto? saleLogDetail;
  final DateTime? logTime;
  final bool isDisabled;

  const AnimalSaleLogWidget({
    super.key,
    this.userName,
    this.growthStage,
    this.farmingBatch,
    required this.logController,
    required this.weightMeatSellController,
    required this.priceMeatSellController,
    required this.dateAnimalSellController,
    required this.animalCountSellController, // Added required parameter
    required this.saleDate,
    this.onDateChanged,
    this.onWeightChanged,
    this.onPriceChanged,
    this.onAnimalCountChanged, // Added parameter
    required this.task,
    this.readOnly = false,
    this.salelog,
    this.saleDetailLog,
    this.saleLogDetail,
    this.logTime,
    this.isDisabled = false,
  });

  @override
  State<AnimalSaleLogWidget> createState() => _AnimalSaleLogWidgetState();
}

class _AnimalSaleLogWidgetState extends State<AnimalSaleLogWidget> {
  int _availableQuantity = 0;

  @override
  void initState() {
    super.initState();
    _availableQuantity = (widget.growthStage?.quantity ?? 0) -
        (widget.growthStage?.affectQuantity ?? 0) -
        (widget.growthStage?.deadQuantity ?? 0);

    if (widget.saleLogDetail != null) {
      widget.weightMeatSellController.text =
          widget.saleLogDetail?.weight.toString() ?? '0.0';
      widget.animalCountSellController.text =
          widget.saleLogDetail?.quantity.toString() ?? '0';
      widget.logController.text =
          widget.saleLogDetail?.note ?? 'Không có ghi chú nào được thêm vào.';

      // Format the value with commas
      final formatter = NumberFormat('#,###');
      final newValue = formatter.format(widget.saleLogDetail?.unitPrice);

      // Update the controller with the formatted value
      widget.priceMeatSellController.value = TextEditingValue(
        text: newValue,
        selection: TextSelection.collapsed(offset: newValue.length),
      );
      widget.dateAnimalSellController.text = DateFormat('dd/MM/yyyy')
          .format(DateTime.parse(widget.saleLogDetail?.saleDate ?? ''));
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isNoteEmpty = widget.logController.text.trim().isEmpty;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 8),
          _buildReporterInfo(context),
          const SizedBox(height: 20),
          _buildGrowthStageInfo(context),
          const SizedBox(height: 30),
          _buildSaleFormSection(context),
          const SizedBox(height: 20),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.note_alt_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Ghi chú bổ sung',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  if (widget.isDisabled && isNoteEmpty)
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: const Text(
                        'Không có ghi chú nào được thêm vào.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    )
                  else
                    TextFormField(
                      controller: widget.logController,
                      maxLines: 3,
                      enabled: !widget.isDisabled,
                      decoration: InputDecoration(
                        hintText: 'Nhập ghi chú tại đây...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor:
                            widget.isDisabled ? Colors.grey[100] : Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.sell_rounded,
          color: Theme.of(context).colorScheme.primary,
          size: 32,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tên báo cáo công việc',
              style: TextStyle(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            Text(
              'Đơn báo cáo bán gia cầm',
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
      ],
    );
  }

  Widget _buildReporterInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildInfoItem(
                context: context,
                label: 'Tên người báo cáo',
                value: widget.userName ?? 'Đang tải...',
                icon: Icons.person,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.15),
              _buildInfoItem(
                context: context,
                label: 'Tên chuồng',
                value: widget.task.cageName,
                icon: Icons.home_work_outlined,
              ),
            ],
          ),
          if (widget.logTime != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                _buildInfoItem(
                  context: context,
                  label: 'Thời gian báo cáo',
                  value: DateFormat('dd/MM/yyyy').format(widget.logTime!),
                  icon: Icons.access_time,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSaleFormSection(BuildContext context) {
    final isEditable =
        !widget.readOnly && widget.task.status == StatusDataConstant.inProgress;

    return Card(
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
                Icon(
                  Icons.receipt_long,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Thông tin bán thịt',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const Divider(height: 24),
            _buildAnimalCountInputSection(context, isEditable),
            const SizedBox(height: 24),
            _buildWeightInputSection(context, isEditable),
            const SizedBox(height: 24),
            _buildPriceInputSection(context, isEditable),
            const SizedBox(height: 24),
            _buildDateInputSection(context, isEditable),
          ],
        ),
      ),
    );
  }

  // New method for the animal count input section
  // In the _buildAnimalCountInputSection method, update it to add validation
  Widget _buildAnimalCountInputSection(BuildContext context, bool isEditable) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.pets,
                color: Theme.of(context).colorScheme.primary, size: 20),
            const SizedBox(width: 8),
            Text(
              'Số con gia cầm đã bán',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border:
                Border.all(color: Theme.of(context).colorScheme.outlineVariant),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QuantityButtonWidget(
                    icon: Icons.remove,
                    onPressed: () {
                      final currentValue = int.tryParse(
                            widget.animalCountSellController.text,
                          ) ??
                          0;
                      if (currentValue > 0) {
                        widget.onAnimalCountChanged?.call(currentValue - 1);
                        widget.animalCountSellController.text =
                            (currentValue - 1).toString();
                      }
                    },
                    isDisable: !isEditable,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: widget.animalCountSellController,
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.number,
                      enabled: isEditable,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        suffixText: '(con)',
                        suffixStyle:
                            TextStyle(color: Colors.grey[600], fontSize: 18),
                      ),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w600),
                      onChanged: (value) async {
                        if (value.isEmpty) {
                          widget.animalCountSellController.text = '0';
                          widget.animalCountSellController.selection =
                              TextSelection.fromPosition(
                                  const TextPosition(offset: 1));
                          widget.onAnimalCountChanged?.call(0);
                          return;
                        }

                        // Validate against available quantity
                        final currentValue = int.tryParse(value) ?? 0;
                        if (currentValue > _availableQuantity) {
                          // Reset to available quantity if input exceeds it
                          widget.animalCountSellController.text =
                              _availableQuantity.toString();
                          widget.animalCountSellController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset:
                                      _availableQuantity.toString().length));
                          widget.onAnimalCountChanged?.call(_availableQuantity);

                          // Show snackbar to notify user
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Số lượng không thể vượt quá số con hiện có ($_availableQuantity con)'),
                              backgroundColor:
                                  Theme.of(context).colorScheme.error,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        } else {
                          widget.onAnimalCountChanged?.call(currentValue);
                        }
                      },
                      onTap: () {
                        if (widget.animalCountSellController.text == '0') {
                          widget.animalCountSellController.clear();
                        }
                      },
                    ),
                  ),
                  QuantityButtonWidget(
                    icon: Icons.add,
                    onPressed: () {
                      final currentValue = int.tryParse(
                            widget.animalCountSellController.text,
                          ) ??
                          0;

                      // Check if adding one more would exceed available quantity
                      if (currentValue < _availableQuantity) {
                        widget.onAnimalCountChanged?.call(currentValue + 1);
                        widget.animalCountSellController.text =
                            (currentValue + 1).toString();
                      } else {
                        // Show snackbar to notify user
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Số lượng không thể vượt quá số con hiện có ($_availableQuantity con)'),
                            backgroundColor:
                                Theme.of(context).colorScheme.error,
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    isAdd: true,
                    isDisable: !isEditable,
                  )
                ],
              ),
              // Add helper text to show available quantity
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Số lượng có sẵn: $_availableQuantity con',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWeightInputSection(BuildContext context, bool isEditable) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.scale,
                color: Theme.of(context).colorScheme.primary, size: 20),
            const SizedBox(width: 8),
            Text(
              'Khối lượng đã bán',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border:
                Border.all(color: Theme.of(context).colorScheme.outlineVariant),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QuantityButtonWidget(
                icon: Icons.remove,
                onPressed: () {
                  final currentValue = double.tryParse(
                        widget.weightMeatSellController.text,
                      ) ??
                      0.0;
                  if (currentValue > 1) {
                    if (widget.onWeightChanged != null) {
                      widget.onWeightChanged!(currentValue - 1.0);
                      widget.weightMeatSellController.text =
                          (currentValue - 1.0).toStringAsFixed(1);
                    }
                  } else if (currentValue <= 1 && currentValue > 0.1) {
                    if (widget.onWeightChanged != null) {
                      widget.onWeightChanged!(0.1);
                    }
                  }
                },
                isDisable: !isEditable,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: widget.weightMeatSellController,
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.number,
                  enabled: isEditable,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,1}')),
                  ],
                  decoration: InputDecoration(
                    suffixText: '(kg)',
                    suffixStyle:
                        TextStyle(color: Colors.grey[600], fontSize: 18),
                  ),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                  onChanged: (value) async {
                    final currentValue = double.tryParse(
                          widget.weightMeatSellController.text,
                        ) ??
                        0.1;
                    if (widget.onWeightChanged != null) {
                      widget.onWeightChanged!(currentValue);
                    }
                  },
                  onTap: () {
                    if (widget.weightMeatSellController.text == '0' ||
                        widget.weightMeatSellController.text == '0.0') {
                      setState(() {
                        widget.weightMeatSellController.text = '';
                      });
                    }
                  },
                ),
              ),
              QuantityButtonWidget(
                icon: Icons.add,
                onPressed: () {
                  final currentValue = double.tryParse(
                        widget.weightMeatSellController.text,
                      ) ??
                      0.0;
                  if (widget.onWeightChanged != null) {
                    widget.onWeightChanged!(currentValue + 1.0);
                    widget.weightMeatSellController.text =
                        (currentValue + 1.0).toStringAsFixed(1);
                  }
                },
                isAdd: true,
                isDisable: !isEditable,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceInputSection(BuildContext context, bool isEditable) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.attach_money,
                color: Theme.of(context).colorScheme.primary, size: 20),
            const SizedBox(width: 8),
            Text(
              'Giá tiền thịt bán ra',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: widget.priceMeatSellController,
          keyboardType: TextInputType.number,
          enabled: isEditable,
          decoration: InputDecoration(
            hintText: 'Nhập giá tiền',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: Icon(Icons.currency_exchange,
                color: Theme.of(context).colorScheme.primary),
            suffixText: 'VND/kg',
            helperText: 'Giá tiền trên 1 kg thịt, giá phải hơn 1,000VND',
            filled: true,
            fillColor: isEditable ? Colors.white : Colors.grey[100],
            errorText: _validatePrice(widget.priceMeatSellController.text),
          ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              try {
                // Clean the string of commas for parsing
                final cleanValue = value.replaceAll(',', '');
                final parsedValue = int.parse(cleanValue);

                // Format the value with commas
                final formatter = NumberFormat('#,###');
                final newValue = formatter.format(parsedValue);

                // Update the controller with the formatted value
                widget.priceMeatSellController.value = TextEditingValue(
                  text: newValue,
                  selection: TextSelection.collapsed(offset: newValue.length),
                );

                // Trigger the callback with the clean value (for validation)
                if (widget.onPriceChanged != null) {
                  widget.onPriceChanged!(newValue);
                }

                // Force rebuild to update validation
                setState(() {});
              } catch (e) {
                // Keep the current input if parsing fails
              }
            } else {
              // Force rebuild to update validation when field is cleared
              setState(() {});
            }
          },
          validator: (value) => _validatePrice(value),
        ),
      ],
    );
  }

  String? _validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    try {
      final cleanValue = value.replaceAll(',', '');
      final parsedValue = int.parse(cleanValue);

      if (parsedValue < 1000) {
        return 'Giá tiền phải lớn hơn 1,000 VNĐ';
      }
    } catch (e) {
      return 'Vui lòng nhập giá tiền hợp lệ';
    }

    return null;
  }

  Widget _buildDateInputSection(BuildContext context, bool isEditable) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.event,
                color: Theme.of(context).colorScheme.primary, size: 20),
            const SizedBox(width: 8),
            Text(
              'Ngày bán',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: isEditable
              ? () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: widget.saleDate,
                    firstDate: DateTime(2024),
                    lastDate: TimeUtils.customNow(),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedDate != null) {
                    widget.dateAnimalSellController.text =
                        DateFormat('dd/MM/yyyy').format(pickedDate);
                    widget.onDateChanged?.call(pickedDate);
                  }
                }
              : null,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context).colorScheme.outlineVariant),
              borderRadius: BorderRadius.circular(12),
              color: isEditable ? Colors.white : Colors.grey[100],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.dateAnimalSellController.text,
                  style: const TextStyle(fontSize: 16),
                ),
                if (isEditable) const Icon(Icons.calendar_today),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGrowthStageInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
              const SizedBox(width: 8),
              Text(
                'Thông tin về giai đoạn phát triển',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Builder(
              builder: (context) {
                // Sau khi đợi 2 giây, kiểm tra dữ liệu
                if (widget.growthStage == null || widget.farmingBatch == null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 48,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Không có dữ liệu',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Có thể vụ nuôi đã hoàn thành hoặc gặp sự cố trong lúc lấy thông tin.',
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        OutlinedButton.icon(
                          onPressed: () {
                            context
                                .read<FarmingBatchCubit>()
                                .getFarmingBatchByCageDuedate(
                                    widget.task.cageId, widget.task.dueDate);
                          },
                          icon: Icon(Icons.refresh),
                          label: Text('Thử lại'),
                        ),
                      ],
                    ),
                  );
                }

                // Hiển thị nội dung nếu có dữ liệu
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outlineVariant,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thông tin vụ nuôi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.assignment,
                                size: 20,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tên vụ nuôi',
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    widget.farmingBatch?.name ?? 'N/A',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.38,
                          child: _buildInfoItem(
                            context: context,
                            label: 'Tên giai đoạn',
                            value: widget.growthStage?.name ?? '',
                            icon: Icons.label,
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        if (widget.growthStage?.quantity != null) ...[
                          _buildInfoItem(
                            context: context,
                            label: 'Số lượng',
                            value:
                                '${widget.growthStage?.quantity.toString()} (con)',
                            icon: Icons.warehouse,
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _buildInfoItem(
                          context: context,
                          label: 'Số con bình thường',
                          value: '$_availableQuantity (con)',
                          icon: Icons.pets,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.084),
                        _buildInfoItem(
                          context: context,
                          label: 'Số con bị bệnh',
                          value:
                              '${widget.growthStage?.affectQuantity ?? 0} (con)',
                          icon: Icons.medical_services_rounded,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _buildInfoItem(
                          context: context,
                          label: 'Ngày bắt đầu',
                          value: widget.growthStage != null &&
                                  widget.growthStage!.ageStartDate.isNotEmpty
                              ? DateFormat('dd/MM/yyyy').format(
                                  DateTime.tryParse(
                                          widget.growthStage!.ageStartDate) ??
                                      DateTime.now())
                              : 'N/A',
                          icon: Icons.calendar_month,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.13),
                        _buildInfoItem(
                          context: context,
                          label: 'Ngày kết thúc',
                          value: widget.growthStage != null &&
                                  widget.growthStage!.ageEndDate.isNotEmpty
                              ? DateFormat('dd/MM/yyyy').format(
                                  DateTime.tryParse(
                                          widget.growthStage!.ageEndDate) ??
                                      DateTime.now())
                              : 'N/A',
                          icon: Icons.calendar_month,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _buildInfoItem(
                          context: context,
                          label: 'Độ tuổi bắt đầu',
                          value: '${widget.growthStage?.ageStart} ngày tuổi',
                          icon: Icons.health_and_safety_rounded,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.13),
                        _buildInfoItem(
                          context: context,
                          label: 'Độ tuổi kết thúc',
                          value: '${widget.growthStage?.ageEnd} ngày tuổi',
                          icon: Icons.health_and_safety_rounded,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required BuildContext context,
    required String label,
    required String value,
    IconData? icon,
    int warningLevel = 0,
  }) {
    return Row(
      children: [
        if (icon != null)
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.23,
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                if (warningLevel != 0) ...[
                  const SizedBox(width: 4),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ],
            )
          ],
        ),
      ],
    );
  }
}
