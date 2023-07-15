import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../history/presentation/history_dashboard.dart';
import 'bloc/tab_profile_bloc.dart';

class TabProfileHeader extends StatelessWidget {
  const TabProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabProfileBloc, TabProfileState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        return const ProfileDashboardHeader();
      },
    );
  }
}

class TabProfileContent extends StatelessWidget {
  const TabProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabProfileBloc, TabProfileState>(
      builder: (context, state) {
        if (state is TabProfile) {
          return const ProfileDashboardContent();
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
