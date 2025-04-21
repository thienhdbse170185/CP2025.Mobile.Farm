import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_data.freezed.dart';
part 'custom_data.g.dart';

@freezed
class CustomData with _$CustomData {
  factory CustomData({
    required String Id,
    String? NotiTypeId,
    required String UserId,
    required String Content,
    required String Title,
    required String CreatedAt,
    required bool IsRead,
    required String? TaskId,
    required String? MedicalSymptomId,
    required String? CageId,
  }) = _CustomData;

  factory CustomData.fromJson(Map<String, dynamic> json) =>
      _$CustomDataFromJson(json);
}
