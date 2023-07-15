import 'package:flutter/material.dart';

import '../content/home/tab_home.dart';
import '../content/profile/tab_profile.dart';
import 'bloc/home_tab_bloc.dart';

class HomeTabHeader extends StatelessWidget {
  final HomeTabType tab;

  const HomeTabHeader({
    super.key,
    required this.tab,
  });

  @override
  Widget build(BuildContext context) {
    switch (tab) {
      case HomeTabType.Home:
        return const TabHomeHeader();
      case HomeTabType.Profile:
        return const TabProfileHeader();
      default:
        return const TabHomeHeader();
    }
  }
}

class HomeTabBody extends StatelessWidget {
  final HomeTabType tab;
  const HomeTabBody({
    super.key,
    required this.tab,
  });
  @override
  Widget build(BuildContext context) {
    switch (tab) {
      case HomeTabType.Home:
        return const TabHomeContent();
      case HomeTabType.Profile:
        return const TabProfileContent();
      default:
        return const TabHomeContent();
    }
  }
}
