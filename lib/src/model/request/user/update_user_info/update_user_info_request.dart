import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_info_request.freezed.dart';
part 'update_user_info_request.g.dart';

@freezed
class UpdateUserInfoRequest with _$UpdateUserInfoRequest {
  factory UpdateUserInfoRequest({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String address,
    required String imageUrl,
  }) = _UpdateUserInfoRequest;

  factory UpdateUserInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserInfoRequestFromJson(json);
}
