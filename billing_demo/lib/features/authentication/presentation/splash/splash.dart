import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widget/show_snackbar.dart';
import '../../../../core/authorization/bloc/authorization_bloc.dart';
import '../../../../routes_path.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthorizationBloc, AuthorizationState>(
        listener: (context, state) {
          if (state is Authorized) {
            Navigator.of(context).pushReplacementNamed(NavRoute.Home);
            return;
          }
          if (state is Unauthorized) {
            Navigator.of(context).pushReplacementNamed(NavRoute.Login);
            return;
          }
          if (state is AuthorizationError) {
            showErrorSnackbar(context, state.failure.message);
            return;
          }
        },
        builder: (context, state) {
          if (state is Authorizing) {
            context.read<AuthorizationBloc>().add(CheckAppAuthorizationStatus());
          }
          if (state is AuthorizationError) {
            return const Center(
              child: Text("Fatal Error!"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
