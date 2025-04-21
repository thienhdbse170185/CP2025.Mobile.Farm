// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrescriptionDtoImpl _$$PrescriptionDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PrescriptionDtoImpl(
      id: json['id'] as String,
      prescribedDate: DateTime.parse(json['prescribedDate'] as String),
      notes: json['notes'] as String,
      quantityAnimal: (json['quantityAnimal'] as num).toInt(),
      status: json['status'] as String,
      price: (json['price'] as num?)?.toDouble(),
      cageId: json['cageId'] as String,
      daysToTake: (json['daysToTake'] as num).toInt(),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      medications: (json['medications'] as List<dynamic>?)
          ?.map((e) => MedicationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PrescriptionDtoImplToJson(
        _$PrescriptionDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prescribedDate': instance.prescribedDate.toIso8601String(),
      'notes': instance.notes,
      'quantityAnimal': instance.quantityAnimal,
      'status': instance.status,
      'price': instance.price,
      'cageId': instance.cageId,
      'daysToTake': instance.daysToTake,
      'endDate': instance.endDate?.toIso8601String(),
      'medications': instance.medications,
    };
