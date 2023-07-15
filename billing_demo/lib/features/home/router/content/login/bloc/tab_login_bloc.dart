import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_login_event.dart';
part 'tab_login_state.dart';

class LoginTabBloc extends Bloc<TabLoginEvent, TabLoginState> {
  LoginTabBloc() : super(TabLogin()) {
    on<ToLogin>((event, emit) async {
      emit(TabLoginForgotPassword());
    });
    on<ToForgotPassword>((event, emit) async {
      emit(TabLoginForgotPassword());
    });
  }
}
