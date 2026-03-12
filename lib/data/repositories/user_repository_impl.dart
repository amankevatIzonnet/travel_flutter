import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_flutter/core/error/failure.dart';
import 'package:travel_flutter/core/storage/secure_storage_service.dart';
import 'package:travel_flutter/data/datasources/user_data_source.dart';
import 'package:travel_flutter/domain/entities/user_entity.dart';
import 'package:travel_flutter/domain/repositories/user_repository.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final UserDataSource _userDataSource;
  final SecureStorageService storage;
  UserRepositoryImpl(this._userDataSource, this.storage);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    final result = await _userDataSource.login(email, password);

    return result.fold((failure) => Left(failure), (userModel) async {
      await storage.saveToken(userModel.token);

      return Right(userModel);
    });
  }
}
