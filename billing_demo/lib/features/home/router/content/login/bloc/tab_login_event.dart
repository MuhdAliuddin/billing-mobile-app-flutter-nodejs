part of 'tab_login_bloc.dart';

abstract class TabLoginEvent extends Equatable {
  const TabLoginEvent();

  @override
  List<Object> get props => [];
}

class ToLogin extends TabLoginEvent {
  @override
  List<Object> get props => [];
}

class ToForgotPassword extends TabLoginEvent {
  @override
  List<Object> get props => [];
}
