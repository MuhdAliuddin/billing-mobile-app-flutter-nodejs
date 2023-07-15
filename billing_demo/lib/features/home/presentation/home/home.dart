import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/authorization/bloc/authorization_bloc.dart';
import '../../../../routes_path.dart';
import '../../router/tab/bloc/home_tab_bloc.dart';
import '../../router/tab/home_tab.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthorizationBloc, AuthorizationState>(
      listener: (context, state) {
        if (state is Unauthorized) {
          Navigator.pushReplacementNamed(context, NavRoute.Root);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: BlocBuilder<HomeTabBloc, HomeTabState>(
            builder: (context, state) {
              return HomeTabHeader(
                tab: state.tab,
              );
            },
          ),
        ),
        body: BlocBuilder<HomeTabBloc, HomeTabState>(
          builder: (context, state) {
            return HomeTabBody(
              tab: state.tab,
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<HomeTabBloc, HomeTabState>(
          builder: (context, state) {
            return BottomNavigationBar(
              selectedLabelStyle: const TextStyle(
                color: Color.fromARGB(255, 6, 90, 158),
                fontSize: 14,
              ),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt),
                  label: 'History',
                  backgroundColor: Colors.white,
                ),
              ],
              currentIndex: state.toIndex(),
              selectedItemColor: const Color.fromARGB(255, 6, 90, 158), //const Color(0xFFFAFAFA),
              onTap: (index) {
                context.read<HomeTabBloc>().add(ToHomeTabIndex.fromIndex(index));
              },
            );
          },
        ),
      ),
    );
  }
}
