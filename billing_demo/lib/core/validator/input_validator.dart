import 'package:dartz/dartz.dart';

import 'model/credential_model.dart';
import 'validator_failure.dart';

class InputValidator {
  Either<ValidatorFailure, CredentialModel> validateCredential(CredentialModel credential) {
    try {
      if (credential.username.isEmpty && credential.password.isEmpty) {
        throw const FormatException();
      }
      return Right(credential);
    } on FormatException {
      return const Left(
        ValidatorFailure(
          message: "Sila isikan Katanama/Katalaluan anda!",
        ),
      );
    }
  }
}
