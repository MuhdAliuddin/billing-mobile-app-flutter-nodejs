import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/home_dashboard/home_dashboard.dart';
import 'bloc/tab_home_bloc.dart';

class TabHomeHeader extends StatelessWidget {
  const TabHomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabHomeBloc, TabHomeState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        return const HomeDashboardHeader();
      },
    );
  }
}

class TabHomeContent extends StatelessWidget {
  const TabHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabHomeBloc, TabHomeState>(
      builder: (context, state) {
        if (state is TabHomeDashboard) {
          return const HomeDashboardContent();
        }

        return const Center(
          child: Text(
            "Error: Unknown Route",
          ),
        );
      },
    );
  }
}
