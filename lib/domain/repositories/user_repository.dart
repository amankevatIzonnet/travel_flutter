import 'package:dartz/dartz.dart';
import 'package:travel_flutter/core/error/failure.dart';
import 'package:travel_flutter/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> login(String email, String password);
}
