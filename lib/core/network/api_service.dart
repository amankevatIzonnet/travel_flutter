import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travel_flutter/core/error/failure.dart';

class ApiService {
  final Dio dio;
  ApiService(this.dio);

  Future<Either<Failure, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(_handleError(e));
    }
  }

  Future<Either<Failure, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await dio.post(endpoint, data: data);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(_handleError(e));
    }
  }

  Future<Either<Failure, dynamic>> put(String endpoint, {dynamic data}) async {
    try {
      final response = await dio.put(endpoint, data: data);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(_handleError(e));
    }
  }

  Future<Either<Failure, dynamic>> delete(String endpoint) async {
    try {
      final response = await dio.delete(endpoint);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(_handleError(e));
    }
  }

  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure("Connection timeout");

      case DioExceptionType.sendTimeout:
        return NetworkFailure("Send timeout");

      case DioExceptionType.receiveTimeout:
        return NetworkFailure("Receive timeout");

      case DioExceptionType.badResponse:
        final data = error.response?.data;

        if (data is Map<String, dynamic> && data.containsKey('message')) {
          return ServerFailure(data['message']);
        }

        return ServerFailure("Server error occurred");

      case DioExceptionType.connectionError:
        return NetworkFailure("No internet connection");

      case DioExceptionType.cancel:
        return NetworkFailure("Request cancelled");

      default:
        return NetworkFailure("Something went wrong");
    }
  }
}
