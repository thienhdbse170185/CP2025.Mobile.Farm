import 'package:data_layer/model/dto/prescription/prescription.dart';
import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/constants/task_type_data_constant.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';

/// Checks if any medication is checked
bool areAnyMedicationsChecked({
  TaskHaveCageName? task,
  PrescriptionDto? prescription,
  Map<String, bool> medicationChecked = const {},
}) {
  if (task?.taskType.taskTypeId == TaskTypeDataConstant.health) {
    return prescription?.medications?.any((medication) =>
            medicationChecked[medication.medicationId] ?? false) ??
        false;
  }
  return true;
}

/// Checks if all medications are checked
bool areAllMedicationsChecked({
  TaskHaveCageName? task,
  PrescriptionDto? prescription,
  Map<String, bool> medicationChecked = const {},
}) {
  if (task?.taskType.taskTypeId == TaskTypeDataConstant.health) {
    return prescription?.medications?.every((medication) =>
            medicationChecked[medication.medicationId] ?? false) ??
        false;
  }
  return true;
}

/// Checks if current time is within the working hours for a task
bool isWithinWorkingHours(TaskHaveCageName? task) {
  if (task == null) return false;
  final now = TimeUtils.customNow();
  final startHour = task.session == 1
      ? 6
      : task.session == 2
          ? 12
          : task.session == 3
              ? 14
              : 18;
  final endHour = task.session == 1
      ? 12
      : task.session == 2
          ? 14
          : task.session == 3
              ? 18
              : 23;
  return now.hour >= startHour && now.hour < endHour;
}

/// Checks if a task can be completed based on various conditions
bool canCompleteTask({
  required String taskStatus,
  required TaskHaveCageName? task,
  required bool areAnyMedicationsChecked,
  required bool isIsolationFed,
  required String countAnimalVaccine,
  required String weightAnimal,
  required String weightMeatSell,
  required String priceMeatSell,
  required String countEggSell,
  required String priceEggSell,
  required String countEggCollected,
}) {
  if (!TimeUtils.isTimeInSession(TimeUtils.customNow(), task?.session ?? 0)) {
    return false;
  }

  if (taskStatus != StatusDataConstant.inProgress) return false;

  if (task?.taskType.taskTypeId == TaskTypeDataConstant.health &&
      !areAnyMedicationsChecked) {
    return false;
  }

  if (task?.taskType.taskTypeId == TaskTypeDataConstant.feeding &&
      task?.hasAnimalDesease == true &&
      !isIsolationFed) {
    return false;
  }

  if (task?.taskType.taskTypeId == TaskTypeDataConstant.vaccin &&
      countAnimalVaccine == '0') {
    return false;
  }

  if (task?.taskType.taskTypeId == TaskTypeDataConstant.weighing &&
      weightAnimal == '0.0') {
    return false;
  }

  if (task?.taskType.taskTypeId == TaskTypeDataConstant.sellAnimal &&
      (weightMeatSell == '0' ||
          priceMeatSell.isEmpty ||
          priceMeatSell == '0')) {
    return false;
  }

  if (task?.taskType.taskTypeId == TaskTypeDataConstant.sellEgg &&
      (countEggSell == '0' || priceEggSell.isEmpty || priceEggSell == '0')) {
    return false;
  }

  if (task?.taskType.taskTypeId == TaskTypeDataConstant.eggHarvest &&
      countEggCollected == '0') {
    return false;
  }

  return true;
}
