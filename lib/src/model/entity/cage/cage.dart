import 'package:freezed_annotation/freezed_annotation.dart';

part 'cage.freezed.dart';
part 'cage.g.dart';

@freezed
class Cage with _$Cage {
  const factory Cage({
    required String id,
    required String penCode,
    required String farmId,
    required String name,
    required int? area,
    required String? location,
    required int? capacity,
    required String boardCode,
    required bool? boardStatus,
    required String createdDate,
    String? modifiedDate,
    required String cameraUrl,
  }) = _Cage;

  factory Cage.fromJson(Map<String, dynamic> json) => _$CageFromJson(json);
}
