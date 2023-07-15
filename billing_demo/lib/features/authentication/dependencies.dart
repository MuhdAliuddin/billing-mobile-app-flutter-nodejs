import 'package:get_it/get_it.dart';

import 'application/get_authorization_token.dart';
import 'application/get_user_details.dart';
import 'application/login.dart';
import 'application/logout.dart';

import 'datasource/authentication_repository.dart';
import 'datasource/authentication_repository_impl.dart';
import 'datasource/drift/auth_drift_api.dart';
import 'datasource/drift/auth_drift_api_impl.dart';
import 'datasource/rest/auth_rest_api.dart';
import 'datasource/rest/auth_rest_api_impl.dart';

import 'presentation/login/bloc/login_auth_bloc.dart';

Future<void> registerAuthenticationBloc({required GetIt sl}) async {
  sl.registerFactory(
    () => LoginAuthBloc(
      login: sl(),
      inputValidator: sl(),
    ),
  );
}

Future<void> registerAuthenticationUseCase({required GetIt sl}) async {
  sl.registerLazySingleton(() => Login(authenticationRepo: sl()));
  sl.registerLazySingleton(() => Logout(authenticationRepo: sl()));
  sl.registerLazySingleton(() => GetAuthorizationToken(authenticationRepo: sl()));
  sl.registerLazySingleton(() => GetUserDetails(authenticationRepo: sl()));
}

Future<void> registerAuthenticationRepository({required GetIt sl}) async {
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      networkInfo: sl(),
      authenticationRestApi: sl(),
      authenticationDriftApi: sl(),
    ),
  );
}

Future<void> registerAuthenticationDataSource({required GetIt sl}) async {
  sl.registerLazySingleton<AuthenticationRestApi>(
    () => AuthenticationRestApiImpl(
      client: sl(),
    ),
  );
  sl.registerLazySingleton<AuthenticationDriftApi>(
    () => AuthenticationDriftApiImpl(
      db: sl(),
    ),
  );
}
