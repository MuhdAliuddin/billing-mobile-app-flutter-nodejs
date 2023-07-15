import 'package:dartz/dartz.dart';

import '../../../core/error/resource_failure.dart';
import '../../../core/usecase/usecase.dart';
import '../../../core/validator/model/credential_model.dart';
import '../datasource/authentication_repository.dart';
import '../domain/access_token_model.dart';

class Login implements UseCase<AccessTokenModel, CredentialModel> {
  final AuthenticationRepository authenticationRepo;
  Login({required this.authenticationRepo});

  @override
  Future<Either<ResourceFailure, AccessTokenModel>> call(CredentialModel credentials) async {
    var result = await authenticationRepo.login(credentials);
    return result;
  }
}
