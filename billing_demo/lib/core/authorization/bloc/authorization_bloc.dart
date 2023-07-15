import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../features/authentication/application/get_authorization_token.dart';
import '../../../features/authentication/application/logout.dart';
import '../../error/resource_failure.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  final Logout logout;
  final GetAuthorizationToken getAuthorizationToken;
  AuthorizationBloc({
    required this.getAuthorizationToken,
    required this.logout,
  }) : super(Authorizing()) {
    on<CheckAppAuthorizationStatus>(
      (event, emit) async {
        await Future.delayed(const Duration(milliseconds: 500));
        emit(Unauthorizing());
        var eitherToken = await getAuthorizationToken(const None());

        eitherToken.fold(
          (failure) {
            emit(AuthorizationError(failure: failure));
          },
          (token) {
            if (token != null) {
              return emit(Authorized());
            }
            emit(Unauthorized());
          },
        );
      },
    );
    on<RevokeAccessToken>((event, emit) async {
      var eitherNone = await logout(const None());
      eitherNone.fold(
        (failure) => emit(UnauthorizationError(failure: failure)),
        (none) {
          emit(Unauthorized());
        },
      );
    });
  }
}
