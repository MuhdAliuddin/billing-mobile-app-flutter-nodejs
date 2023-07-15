import 'package:dartz/dartz.dart';

import '../../../core/error/resource_failure.dart';
import '../../../core/validator/model/credential_model.dart';
import '../../../entities/user.dart';
import '../domain/access_token_model.dart';

abstract class AuthenticationRepository {
  Future<Either<ResourceFailure, User?>> getUserDetails();
  Future<Either<ResourceFailure, AccessTokenModel?>> getAuthorizationToken();
  Future<Either<ResourceFailure, AccessTokenModel>> login(CredentialModel credentials);
  Future<Either<ResourceFailure, None>> logout();
}
