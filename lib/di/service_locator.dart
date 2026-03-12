import 'package:get_it/get_it.dart';
import 'package:travel_flutter/core/network/api_service.dart';
import 'package:travel_flutter/core/network/dio_client.dart';
import 'package:travel_flutter/core/storage/secure_storage_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<ApiService>(() => ApiService(sl<DioClient>().dio));
  sl.registerLazySingleton<SecureStorageService>(() => SecureStorageService());
}
