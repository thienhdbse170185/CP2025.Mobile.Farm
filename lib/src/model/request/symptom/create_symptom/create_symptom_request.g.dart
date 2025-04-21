// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_symptom_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateSymptomRequestImpl _$$CreateSymptomRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateSymptomRequestImpl(
      farmingBatchId: json['farmingBatchId'] as String,
      symptoms: json['symptoms'] as String,
      status: json['status'] as String,
      affectedQuantity: (json['affectedQuantity'] as num).toInt(),
      isEmergency: json['isEmergency'] as bool,
      quantityInCage: (json['quantityInCage'] as num).toInt(),
      notes: json['notes'] as String,
      pictures: (json['pictures'] as List<dynamic>)
          .map((e) => PictureSymptom.fromJson(e as Map<String, dynamic>))
          .toList(),
      medicalSymptomDetails: (json['medicalSymptomDetails'] as List<dynamic>)
          .map((e) => GetSymptomRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CreateSymptomRequestImplToJson(
        _$CreateSymptomRequestImpl instance) =>
    <String, dynamic>{
      'farmingBatchId': instance.farmingBatchId,
      'symptoms': instance.symptoms,
      'status': instance.status,
      'affectedQuantity': instance.affectedQuantity,
      'isEmergency': instance.isEmergency,
      'quantityInCage': instance.quantityInCage,
      'notes': instance.notes,
      'pictures': instance.pictures,
      'medicalSymptomDetails': instance.medicalSymptomDetails,
    };

_$PictureSymptomImpl _$$PictureSymptomImplFromJson(Map<String, dynamic> json) =>
    _$PictureSymptomImpl(
      image: json['image'] as String,
      dateCaptured: DateTime.parse(json['dateCaptured'] as String),
    );

Map<String, dynamic> _$$PictureSymptomImplToJson(
        _$PictureSymptomImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'dateCaptured': instance.dateCaptured.toIso8601String(),
    };
