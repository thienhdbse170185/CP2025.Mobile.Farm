import 'package:data_layer/model/dto/prescription/prescription.dart';
import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:flutter/material.dart';
import 'package:smart_farm/src/core/constants/task_type_data_constant.dart';

class TaskValidation {
  static bool validateFoodLog({
    required TextEditingController actualWeightController,
    required bool hasAnimalDesease,
    required bool isIsolationFed,
  }) {
    final actualWeight = double.tryParse(actualWeightController.text) ?? 0.0;

    if (actualWeight <= 0) {
      return false;
    }

    if (hasAnimalDesease && !isIsolationFed) {
      return false;
    }

    return true;
  }

  static bool validateHealthLog(
    TaskHaveCageName task,
    PrescriptionDto? prescription,
    bool hasTakenAllMedications,
  ) {
    // If the task is for health and there is a prescription,
    // check if confirmation for taking all medications is done
    if (task.taskType.taskTypeId == TaskTypeDataConstant.health &&
        prescription != null) {
      return hasTakenAllMedications;
    }

    // If there's no prescription or it's not a health task,
    // there's nothing to validate specifically for health
    return true;
  }

  static bool validateVaccineLog({
    required TextEditingController countAnimalVaccineController,
  }) {
    final count = int.tryParse(countAnimalVaccineController.text) ?? 0;
    return count > 0;
  }

  static bool validateWeighingLog({
    required TextEditingController weightAnimalController,
  }) {
    final weight = double.tryParse(weightAnimalController.text) ?? 0.0;
    return weight > 0;
  }

  static bool validateEggHarvestLog({
    required TextEditingController countEggCollectedController,
  }) {
    final count = int.tryParse(countEggCollectedController.text) ?? 0;
    return count > 0;
  }

  static bool validateAnimalSaleLog({
    required TextEditingController weightAnimalController,
    required TextEditingController priceAnimalController,
  }) {
    final weight = int.tryParse(weightAnimalController.text) ?? 0;

    // Check for empty or whitespace-only price strings
    final priceText = priceAnimalController.text.trim();

    // Return false if weight is 0 or price is empty
    if (weight <= 0 || priceText.isEmpty) {
      return false;
    }

    return true;
  }

  static bool validateEggSaleLog({
    required TextEditingController countEggSellController,
    required TextEditingController priceEggSellController,
  }) {
    final count = int.tryParse(countEggSellController.text) ?? 0;
    // Check for empty or whitespace-only price strings
    final priceText = priceEggSellController.text.trim();

    // Return false if count is 0 or price is empty
    if (count <= 0 || priceText.isEmpty) {
      return false;
    }

    return true;
  }
}

// bool canCompleteTask({
//   required String taskStatus,
//   required dynamic task,
//   required bool areAnyMedicationsChecked,
//   required bool isIsolationFed,
//   required String countAnimalVaccine,
//   required String weightAnimal,
//   required String weightMeatSell,
//   required String priceMeatSell,
//   required String countEggSell,
//   required String priceEggSell,
//   required String countEggCollected,
// }) {
//   if (taskStatus != 'Đang thực hiện') {
//     return false;
//   }

//   final taskTypeId = task.taskType.taskTypeId;
  
//   // Health task - check if medications are checked
//   if (taskTypeId == 'HEALTH' && !areAnyMedicationsChecked) {
//     return false;
//   }
  
//   // Feeding task with diseased animals - check isolation feeding
//   if (taskTypeId == 'FEEDING' && task.hasAnimalDesease == true && !isIsolationFed) {
//     return false;
//   }
  
//   // Vaccine task - check animal count
//   if (taskTypeId == 'VACCINE') {
//     final count = int.tryParse(countAnimalVaccine) ?? 0;
//     if (count <= 0) {
//       return false;
//     }
//   }
  
//   // Weighing task - check weight
//   if (taskTypeId == 'WEIGHING') {
//     final weight = double.tryParse(weightAnimal) ?? 0.0;
//     if (weight <= 0) {
//       return false;
//     }
//   }
  
//   // Animal sale task - check meat weight and price
//   if (taskTypeId == 'SELL_ANIMAL') {
//     final weight = int.tryParse(weightMeatSell) ?? 0;
//     if (weight <= 0 || priceMeatSell.trim().isEmpty) {
//       return false;
//     }
//   }
  
//   // Egg sale task - check egg count and price
//   if (taskTypeId == 'SELL_EGG') {
//     final count = int.tryParse(countEggSell) ?? 0;
//     if (count <= 0 || priceEggSell.trim().isEmpty) {
//       return false;
//     }
//   }
  
//   // Egg harvest task - check egg count
//   if (taskTypeId == 'EGG_HARVEST') {
//     final count = int.tryParse(countEggCollected) ?? 0;
//     if (count <= 0) {
//       return false;
//     }
//   }
  
//   return true;
// }
