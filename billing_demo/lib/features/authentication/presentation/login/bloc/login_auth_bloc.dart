// ignore_for_file: constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/resource_failure.dart';
import '../../../../../core/validator/input_validator.dart';
import '../../../../../core/validator/model/credential_model.dart';
import '../../../../../core/validator/validator_failure.dart';
import '../../../application/login.dart';
import '../../../domain/access_token_model.dart';

part 'login_auth_event.dart';
part 'login_auth_state.dart';

class LoginAuthBloc extends Bloc<LoginAuthEvent, LoginAuthState> {
  final Login login;
  final InputValidator inputValidator;

  LoginAuthBloc({
    required this.login,
    required this.inputValidator,
  }) : super(AuthenticationInitial()) {
    on<AuthenticateAuthorize>((event, emit) async {
      emit(UseLoginLoading());
      final credentialModel = CredentialModel(
        username: event.username,
        password: event.password,
      );
      final validatedEither = inputValidator.validateCredential(credentialModel);
      validatedEither.fold(
        (failure) {
          emit(UseLoginCredentialError(failure: failure));
        },
        (validated) {
          add(
            AuthenticateCredential(
              credential: validated,
            ),
          );
        },
      );
    });

    on<AuthenticateCredential>((event, emit) async {
      var eitherToken = await login(event.credential);
      eitherToken.fold(
        (failure) {
          emit(UseLoginError(failure: failure));
        },
        (token) => emit(UseLoginSuccess(accessToken: token)),
      );
    });
  }
}
