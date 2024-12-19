import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:smart_farm/src/core/constants/auth_data_constant.dart';

class DioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final box = await Hive.openBox(AuthDataConstant.authBoxName);
    final token = box
        .get(AuthDataConstant.accessTokenKey); // Retrieve the token from Hive

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final box = await Hive.openBox(AuthDataConstant.authBoxName);
      final refreshToken = box.get(AuthDataConstant.refreshTokenKey);
      if (refreshToken != null && refreshToken.isNotEmpty) {
        try {
          final response = await Dio().post(
            '${dotenv.env['BASE_API_URL']}/auth/refresh',
            data: {'refreshToken': refreshToken},
          );
          final newAccessToken = response.data['result']['accessToken'];
          await box.put(AuthDataConstant.accessTokenKey, newAccessToken);
          err.requestOptions.headers['Authorization'] =
              'Bearer $newAccessToken';
          final cloneReq = await Dio().fetch(err.requestOptions);
          return handler.resolve(cloneReq);
        } catch (e) {
          // Handle token refresh error
        }
      }
    }
    return super.onError(err, handler);
  }
}
