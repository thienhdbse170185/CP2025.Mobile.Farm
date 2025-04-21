// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_symptom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MedicalSymptomDtoImpl _$$MedicalSymptomDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MedicalSymptomDtoImpl(
      id: json['id'] as String,
      farmingBatchId: json['farmingBatchId'] as String,
      symtoms: json['symtoms'] as String?,
      diagnosis: json['diagnosis'] as String?,
      createAt: DateTime.parse(json['createAt'] as String),
      status: json['status'] as String,
      affectedQuantity: (json['affectedQuantity'] as num).toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      nameAnimal: json['nameAnimal'] as String?,
      notes: json['notes'] as String,
      pictures: (json['pictures'] as List<dynamic>?)
          ?.map((e) => PictureSymptom.fromJson(e as Map<String, dynamic>))
          .toList(),
      medicalSymptomDetails: (json['medicalSymptomDetails'] as List<dynamic>?)
          ?.map((e) => SymptomDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      prescriptions: (json['prescriptions'] as List<dynamic>?)
          ?.map((e) => PrescriptionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MedicalSymptomDtoImplToJson(
        _$MedicalSymptomDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'farmingBatchId': instance.farmingBatchId,
      'symtoms': instance.symtoms,
      'diagnosis': instance.diagnosis,
      'createAt': instance.createAt.toIso8601String(),
      'status': instance.status,
      'affectedQuantity': instance.affectedQuantity,
      'quantity': instance.quantity,
      'nameAnimal': instance.nameAnimal,
      'notes': instance.notes,
      'pictures': instance.pictures,
      'medicalSymptomDetails': instance.medicalSymptomDetails,
      'prescriptions': instance.prescriptions,
    };
