import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_flutter/core/error/failure.dart';
import 'package:travel_flutter/domain/entities/user_entity.dart';
import 'package:travel_flutter/domain/repositories/user_repository.dart';

@injectable
class LoginUsecase {
  final UserRepository _userRepository;
  LoginUsecase(this._userRepository);

  Future<Either<Failure, User>> call(String email, String password) {
    return _userRepository.login(email, password);
  }
}
