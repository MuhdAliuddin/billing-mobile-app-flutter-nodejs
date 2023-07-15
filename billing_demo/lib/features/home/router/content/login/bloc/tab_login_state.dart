part of 'tab_login_bloc.dart';

abstract class TabLoginState extends Equatable {
  const TabLoginState();

  @override
  List<Object> get props => [];
}

class TabLogin extends TabLoginState {}

class TabLoginForgotPassword extends TabLoginState {}
