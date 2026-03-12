// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:travel_flutter/core/network/api_service.dart' as _i431;
import 'package:travel_flutter/core/storage/secure_storage_service.dart'
    as _i737;
import 'package:travel_flutter/data/datasources/user_data_source.dart' as _i959;
import 'package:travel_flutter/data/repositories/user_repository_impl.dart'
    as _i729;
import 'package:travel_flutter/domain/repositories/user_repository.dart'
    as _i112;
import 'package:travel_flutter/domain/usecases/login_usecase.dart' as _i693;
import 'package:travel_flutter/features/bloc/auth/auth_bloc.dart' as _i812;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i812.AuthBloc>(() => _i812.AuthBloc());
    gh.singleton<_i959.UserDataSource>(
      () => _i959.UserDataSourceImpl(gh<_i431.ApiService>()),
    );
    gh.singleton<_i112.UserRepository>(
      () => _i729.UserRepositoryImpl(
        gh<_i959.UserDataSource>(),
        gh<_i737.SecureStorageService>(),
      ),
    );
    gh.factory<_i693.LoginUsecase>(
      () => _i693.LoginUsecase(gh<_i112.UserRepository>()),
    );
    return this;
  }
}
