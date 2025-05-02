import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaxValueTextInputFormatter extends TextInputFormatter {
  final int maxValue;
  MaxValueTextInputFormatter(this.maxValue);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;
    final int? parsed = int.tryParse(newValue.text);
    if (parsed == null) return oldValue;
    if (parsed > maxValue) {
      // Quay về giá trị cũ nếu vượt max
      return oldValue;
    }
    return newValue;
  }
}
