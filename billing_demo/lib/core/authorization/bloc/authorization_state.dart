part of 'authorization_bloc.dart';

abstract class AuthorizationState extends Equatable {
  const AuthorizationState();

  @override
  List<Object> get props => [];
}

class Authorizing extends AuthorizationState {}

class Authorized extends AuthorizationState {}

class AuthorizationError extends AuthorizationState {
  final ResourceFailure failure;
  const AuthorizationError({required this.failure});
  @override
  List<Object> get props => [failure];
}

class Unauthorizing extends AuthorizationState {}

class Unauthorized extends AuthorizationState {}

class UnauthorizationError extends AuthorizationState {
  final ResourceFailure failure;
  const UnauthorizationError({required this.failure});
  @override
  List<Object> get props => [failure];
}
