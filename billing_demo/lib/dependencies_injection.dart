import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/dependencies.dart';
import 'features/authentication/dependencies.dart';
import 'features/history/dependencies.dart';
import 'features/home/dependencies.dart';

final sl = GetIt.instance;

Future<void> init() async {
  registerAuthentication();
  registerEnforcement();
  registerHistory();
  registerCore(sl: sl);
  registerPlatformServices();
}

Future<void> registerAuthentication() async {
  registerAuthenticationBloc(sl: sl);
  registerAuthenticationUseCase(sl: sl);
  registerAuthenticationRepository(sl: sl);
  registerAuthenticationDataSource(sl: sl);
}

Future<void> registerEnforcement() async {
  registerHomeBloc(sl: sl);
  registerHomeUseCase(sl: sl);
  registerHomeRepository(sl: sl);
  registerHomeDataSource(sl: sl);
}

Future<void> registerHistory() async {
  registerHistoryBloc(sl: sl);
}

Future<void> registerPlatformServices() async {
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
