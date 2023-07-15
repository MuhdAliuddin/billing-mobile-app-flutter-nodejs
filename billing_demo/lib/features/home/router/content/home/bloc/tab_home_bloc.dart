import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_home_event.dart';
part 'tab_home_state.dart';

class TabHomeBloc extends Bloc<TabHomeEvent, TabHomeState> {
  TabHomeBloc() : super(TabHomeDashboard()) {
    on<ToTabHomeDashboard>((event, emit) async {
      emit(TabHomeDashboard());
    });
  }
}
