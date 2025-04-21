// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_status_prescription_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateStatusPrescriptionRequestImpl
    _$$UpdateStatusPrescriptionRequestImplFromJson(Map<String, dynamic> json) =>
        _$UpdateStatusPrescriptionRequestImpl(
          status: json['status'] as String,
          remainingQuantity: (json['remainingQuantity'] as num).toInt(),
        );

Map<String, dynamic> _$$UpdateStatusPrescriptionRequestImplToJson(
        _$UpdateStatusPrescriptionRequestImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'remainingQuantity': instance.remainingQuantity,
    };
