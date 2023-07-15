import 'package:get_it/get_it.dart';

import 'presentation/bloc/history_dashboard_bloc.dart';

Future<void> registerHistoryBloc({required GetIt sl}) async {
  sl.registerFactory(
    () => HistoryDashboardBloc(
      getMonthlyInvoice: sl(),
    ),
  );
}

// Future<void> registerAuthenticationUseCase({required GetIt sl}) async {
//   sl.registerLazySingleton(() => Login(authenticationRepo: sl()));
//   sl.registerLazySingleton(() => Logout(authenticationRepo: sl()));
//   sl.registerLazySingleton(() => GetAuthorizationToken(authenticationRepo: sl()));
// }

// Future<void> registerAuthenticationRepository({required GetIt sl}) async {
//   sl.registerLazySingleton<AuthenticationRepository>(
//     () => AuthenticationRepositoryImpl(
//       networkInfo: sl(),
//       authenticationRestApi: sl(),
//       authenticationDriftApi: sl(),
//     ),
//   );
// }

// Future<void> registerAuthenticationDataSource({required GetIt sl}) async {
//   sl.registerLazySingleton<AuthenticationRestApi>(
//     () => AuthenticationRestApiImpl(
//       client: sl(),
//     ),
//   );
//   sl.registerLazySingleton<AuthenticationDriftApi>(
//     () => AuthenticationDriftApiImpl(
//       db: sl(),
//     ),
//   );
// }
