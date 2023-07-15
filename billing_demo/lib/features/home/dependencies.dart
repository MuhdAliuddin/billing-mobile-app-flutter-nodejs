import 'package:get_it/get_it.dart';

import 'application/get_home_model.dart';
import 'application/get_monthly_invoice.dart';
import 'datasource/home_repository.dart';
import 'datasource/home_repository_impl.dart';
import 'datasource/rest/home_rest_api.dart';
import 'datasource/rest/home_rest_api_impl.dart';
import 'presentation/home_dashboard/bloc/home_dashboard_bloc.dart';
import 'router/content/profile/bloc/tab_profile_bloc.dart';
import 'router/index.dart';

Future<void> registerHomeBloc({required GetIt sl}) async {
  sl.registerFactory(() => TabHomeBloc());
  sl.registerFactory(() => TabProfileBloc());
  sl.registerFactory(() => HomeTabBloc());

  sl.registerFactory(
    () => HomeDashboardBloc(
      getHomeDashboard: sl(),
      getMonthlyInvoice: sl(),
      getUserDetails: sl(),
    ),
  );
}

Future<void> registerHomeUseCase({required GetIt sl}) async {
  sl.registerLazySingleton(
    () => GetHomeDashboard(),
  );
  sl.registerLazySingleton(
    () => GetMonthlyInvoice(
      homeRepository: sl(),
    ),
  );
}

Future<void> registerHomeRepository({required GetIt sl}) async {
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      networkInfo: sl(),
      homeRestApi: sl(),
    ),
  );
}

Future<void> registerHomeDataSource({required GetIt sl}) async {
  sl.registerLazySingleton<HomeRestApi>(
    () => HomeRestApiImpl(
      client: sl(),
    ),
  );
}
