import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_farm/src/core/network/interceptor.dart';

final dio = Dio(BaseOptions(baseUrl: '${dotenv.env['BASE_PROD_API_URL']}'))
  ..interceptors.add(DioInterceptor());
