import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_flutter/core/error/failure.dart';
import 'package:travel_flutter/core/network/api_constants.dart';
import 'package:travel_flutter/core/network/api_service.dart';
import 'package:travel_flutter/data/models/user_model.dart';

abstract class UserDataSource {
  Future<Either<Failure, UserModel>> login(String email, String password);
}

@Singleton(as: UserDataSource)
class UserDataSourceImpl extends UserDataSource {
  final ApiService apiService;
  UserDataSourceImpl(this.apiService);

  @override
  Future<Either<Failure, UserModel>> login(
    String email,
    String password,
  ) async {
    final result = await apiService.post(
      ApiConstants.login,
      data: {'email': email, 'password': password},
    );
    return result.fold((failure) => Left(failure), (json) {
      if (json['success'] != true) {
        return Left(ServerFailure(json['message']));
      }
      return Right(UserModel.fromJson(json));
    });
  }
}
