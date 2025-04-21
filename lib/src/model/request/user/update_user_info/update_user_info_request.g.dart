// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateUserInfoRequestImpl _$$UpdateUserInfoRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateUserInfoRequestImpl(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$UpdateUserInfoRequestImplToJson(
        _$UpdateUserInfoRequestImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'imageUrl': instance.imageUrl,
    };
