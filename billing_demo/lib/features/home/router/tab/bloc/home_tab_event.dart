part of 'home_tab_bloc.dart';

abstract class HomeTabEvent extends Equatable {
  const HomeTabEvent();
  @override
  List<Object> get props => [];
}

class ToHomeTabIndex extends HomeTabEvent {
  final HomeTabType tab;
  const ToHomeTabIndex({required this.tab});
  @override
  List<Object> get props => [tab];

  factory ToHomeTabIndex.fromIndex(int index) {
    switch (index) {
      case 0:
        return const ToHomeTabIndex(tab: HomeTabType.Home);
      case 1:
        return const ToHomeTabIndex(tab: HomeTabType.Profile);
      default:
        return const ToHomeTabIndex(tab: HomeTabType.Home);
    }
  }
}
