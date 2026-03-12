import 'package:dio/dio.dart';
import 'package:travel_flutter/core/network/api_constants.dart';
import 'package:travel_flutter/core/storage/secure_storage_service.dart';
import 'package:travel_flutter/di/service_locator.dart';

class DioClient {
  final Dio dio;
  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      ) {
    // logging
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    //token interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final storage = sl<SecureStorageService>();
          final token = await storage.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = "Bearer $token";
          }
          return handler.next(options);
        },
      ),
    );
  }
}
