import 'package:flutter/material.dart';
import 'package:smart_farm/src/core/utils/task_util.dart';

class TaskValidation {
  static bool validateFoodLog({
    required TextEditingController actualWeightController,
    required bool hasAnimalDesease,
    required bool isIsolationFed,
  }) {
    if (actualWeightController.text.isEmpty ||
        (hasAnimalDesease == true && !isIsolationFed)) {
      return false;
    }
    return true;
  }

  static bool validateHealthLog() {
    if (areAnyMedicationsChecked()) {
      return true;
    } else {
      return false;
    }
  }

  static bool validateVaccineLog(
      {required TextEditingController countAnimalVaccineController}) {
    if (countAnimalVaccineController.text.isEmpty) {
      return false;
    }
    return true;
  }

  static bool validateEggHarvestLog({
    required TextEditingController countEggCollectedController,
  }) {
    if (countEggCollectedController.text.isEmpty) {
      return false;
    }
    return true;
  }

  static bool validateAnimalSaleLog({
    required TextEditingController weightAnimalController,
    required TextEditingController priceAnimalController,
  }) {
    if (weightAnimalController.text.isEmpty) {
      return false;
    }
    if (priceAnimalController.text.isEmpty) {
      return false;
    }
    return true;
  }

  static bool validateEggSaleLog({
    required TextEditingController countEggSellController,
    required TextEditingController priceEggSellController,
  }) {
    if (countEggSellController.text.isEmpty) {
      return false;
    }
    if (priceEggSellController.text.isEmpty) {
      return false;
    }
    return true;
  }

  static bool validateWeighingLog({
    required TextEditingController weightAnimalController,
  }) {
    if (weightAnimalController.text.isEmpty) {
      return false;
    }
    return true;
  }
}
