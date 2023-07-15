import 'package:get_it/get_it.dart';

import 'authorization/dependencies.dart';
import 'datasource/drift/app_db.dart';
import 'datasource/rest/rest_constant.dart';
import 'datasource/rest/rest_helper.dart';
import 'network/network_info.dart';
import 'validator/input_validator.dart';

Future<void> registerCore({required GetIt sl}) async {
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InputValidator());
  sl.registerLazySingleton(
    () => RestHelper(
      baseUrl: BASE_URL,
      debug: API_DEBUG,
      ssl: SSL_ENABLE,
    ),
  );
  sl.registerLazySingleton(() => AppDb());
  registerAuthorizationServiceBloc(sl: sl);
}
