// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_symptom_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetSymptomRequestImpl _$$GetSymptomRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$GetSymptomRequestImpl(
      symptomId: json['symptomId'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$$GetSymptomRequestImplToJson(
        _$GetSymptomRequestImpl instance) =>
    <String, dynamic>{
      'symptomId': instance.symptomId,
      'notes': instance.notes,
    };
