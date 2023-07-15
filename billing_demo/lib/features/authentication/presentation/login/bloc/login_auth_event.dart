part of 'login_auth_bloc.dart';

abstract class LoginAuthEvent extends Equatable {
  const LoginAuthEvent();

  @override
  List<Object> get props => [];
}

class AuthenticateAuthorize extends LoginAuthEvent {
  final String username;
  final String password;
  const AuthenticateAuthorize({
    required this.username,
    required this.password,
  });
  @override
  List<Object> get props => [
        username,
        password,
      ];
}

class AuthenticateCredential extends LoginAuthEvent {
  final CredentialModel credential;

  const AuthenticateCredential({
    required this.credential,
  });
  @override
  List<Object> get props => [
        credential,
      ];
}
