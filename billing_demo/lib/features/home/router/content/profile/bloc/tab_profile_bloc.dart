import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_profile_event.dart';
part 'tab_profile_state.dart';

class TabProfileBloc extends Bloc<TabProfileEvent, TabProfileState> {
  TabProfileBloc() : super(TabProfile()) {
    on<ToTabProfileDashboard>((event, emit) async {
      emit(TabProfile());
    });
  }
}
