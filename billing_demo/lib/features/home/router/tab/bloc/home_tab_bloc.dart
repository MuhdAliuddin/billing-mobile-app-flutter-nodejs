// ignore_for_file: constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_tab_event.dart';
part 'home_tab_state.dart';

enum HomeTabType {
  Home,
  Profile,
}

class HomeTabBloc extends Bloc<HomeTabEvent, HomeTabState> {
  HomeTabBloc() : super(const HomeTabHome()) {
    on<ToHomeTabIndex>((event, emit) {
      switch (event.tab) {
        case HomeTabType.Home:
          return emit(const HomeTabHome());

        case HomeTabType.Profile:
          return emit(const HomeTabProfile());
      }
    });
  }
}
