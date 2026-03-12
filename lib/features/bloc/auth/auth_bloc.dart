import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_flutter/core/network/api_constants.dart';
import 'package:travel_flutter/core/network/api_service.dart';
import 'package:travel_flutter/core/storage/secure_storage_service.dart';
import 'package:travel_flutter/di/service_locator.dart';
import '../../../data/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiService apiService = sl<ApiService>();

  AuthBloc() : super(AuthInitial()) {
    on<LoginRequestEvent>(loginRequest);
  }

  Future<void> loginRequest(
    LoginRequestEvent event,
    Emitter<AuthState> emit,
  ) async {
    final storage = sl<SecureStorageService>();
    if (event.email.isEmpty || event.password.isEmpty) {
      return emit(AuthFailure("Email and Password required"));
    }
    emit(AuthLoading());
    try {
      final result = await apiService.post(
        ApiConstants.login,
        data: {'email': event.email, 'password': event.password},
      );

      await result.fold((failure) async => emit(AuthFailure(failure.message)), (
        json,
      ) async {
        if (json['success'] == true) {
          final userModel = UserModel.fromJson(json);
          await storage.saveToken(userModel.token);
          emit(AuthSuccess(userModel));
        } else {
          emit(AuthFailure(json['message'] ?? "Login failed"));
        }
      });
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
