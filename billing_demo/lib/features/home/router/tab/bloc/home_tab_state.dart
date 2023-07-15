part of 'home_tab_bloc.dart';

abstract class HomeTabState extends Equatable {
  const HomeTabState({
    required this.tab,
  });
  final HomeTabType tab;
  @override
  List<Object> get props => [tab];

  int toIndex() {
    switch (tab) {
      case HomeTabType.Home:
        return 0;
      case HomeTabType.Profile:
        return 1;
      default:
        return 0;
    }
  }
}

class HomeTabHome extends HomeTabState {
  const HomeTabHome()
      : super(
          tab: HomeTabType.Home,
        );
}

class HomeTabProfile extends HomeTabState {
  const HomeTabProfile()
      : super(
          tab: HomeTabType.Profile,
        );
}
