// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_server_time_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetServerTimeResponseImpl _$$GetServerTimeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetServerTimeResponseImpl(
      serverTime: json['serverTime'] as String,
      currentSession: (json['currentSession'] as num).toInt(),
    );

Map<String, dynamic> _$$GetServerTimeResponseImplToJson(
        _$GetServerTimeResponseImpl instance) =>
    <String, dynamic>{
      'serverTime': instance.serverTime,
      'currentSession': instance.currentSession,
    };
