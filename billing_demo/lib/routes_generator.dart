import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/authorization/bloc/authorization_bloc.dart';
import 'dependencies_injection.dart';
import 'features/authentication/presentation/login/bloc/login_auth_bloc.dart';
import 'features/authentication/presentation/login/login_auth.dart';
import 'features/authentication/presentation/splash/splash.dart';

import 'features/history/presentation/bloc/history_dashboard_bloc.dart';
import 'features/home/presentation/home/home.dart';
import 'features/home/presentation/home_dashboard/bloc/home_dashboard_bloc.dart';
import 'features/home/router/content/profile/bloc/tab_profile_bloc.dart';
import 'features/home/router/index.dart';
import 'routes_path.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavRoute.Root:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<AuthorizationBloc>.value(value: sl()),
            ],
            child: const Splash(),
          ),
        );

      case NavRoute.Login:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<AuthorizationBloc>.value(value: sl()),
              BlocProvider<LoginAuthBloc>.value(value: sl()),
            ],
            child: const LoginAuth(),
          ),
        );

      case NavRoute.Home:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<AuthorizationBloc>.value(value: sl()),
              // Enforcement
              BlocProvider<HomeTabBloc>.value(value: sl()),
              BlocProvider<TabHomeBloc>.value(value: sl()),
              BlocProvider<TabProfileBloc>.value(value: sl()),
              // Home /Dashboard
              BlocProvider<HomeDashboardBloc>.value(value: sl()),
              BlocProvider<HistoryDashboardBloc>.value(value: sl()),
            ],
            child: const Home(),
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR IN NAVIGATION'),
        ),
      );
    });
  }
}
