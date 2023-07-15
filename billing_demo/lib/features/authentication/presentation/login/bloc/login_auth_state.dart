part of 'login_auth_bloc.dart';

abstract class LoginAuthState extends Equatable {
  const LoginAuthState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends LoginAuthState {}

class UseLoginLoading extends LoginAuthState {}

class UseLoginSuccess extends LoginAuthState {
  final AccessTokenModel accessToken;
  const UseLoginSuccess({required this.accessToken});
  @override
  List<Object> get props => [accessToken];
}

class UseLoginCredentialError extends LoginAuthState {
  final ValidatorFailure failure;
  const UseLoginCredentialError({
    required this.failure,
  });
  @override
  List<Object> get props => [failure];
}

class UseLoginError extends LoginAuthState {
  final ResourceFailure failure;
  const UseLoginError({
    required this.failure,
  });
  @override
  List<Object> get props => [failure];
}
