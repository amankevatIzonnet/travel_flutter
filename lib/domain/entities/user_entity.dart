import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String firstName;
  final String email;
  final String role;
  final String token;

  const User({
    required this.id,
    required this.firstName,
    required this.email,
    required this.role,
    required this.token,
  });

  @override
  List<Object?> get props => [id, firstName, email, role, token];
}
