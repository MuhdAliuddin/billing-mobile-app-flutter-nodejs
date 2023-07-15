import 'package:get_it/get_it.dart';

import 'bloc/authorization_bloc.dart';

Future<void> registerAuthorizationServiceBloc({required GetIt sl}) async {
  sl.registerFactory(
    () => AuthorizationBloc(
      getAuthorizationToken: sl(),
      logout: sl(),
    ),
  );
}
