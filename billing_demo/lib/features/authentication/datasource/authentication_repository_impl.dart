import 'package:billing_demo_app/features/authentication/domain/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../../core/datasource/repo_try_catch.dart';
import '../../../core/error/resource_failure.dart';
import '../../../core/network/network_info.dart';
import '../../../core/validator/model/credential_model.dart';
import '../../../entities/access_token.dart';
import '../../../entities/user.dart';
import '../domain/access_token_model.dart';

import 'authentication_repository.dart';
import 'drift/auth_drift_api.dart';
import 'rest/auth_rest_api.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final NetworkInfo networkInfo;
  final AuthenticationRestApi authenticationRestApi;
  final AuthenticationDriftApi authenticationDriftApi;

  AuthenticationRepositoryImpl({
    required this.networkInfo,
    required this.authenticationRestApi,
    required this.authenticationDriftApi,
  });

  @override
  Future<Either<ResourceFailure, AccessTokenModel>> login(CredentialModel credential) async {
    return await repoTryCatch<AccessTokenModel>(() async {
      AccessToken? authDrift = await authenticationDriftApi.findOne();
      if (authDrift != null) {
        return Right(authDrift.toAccessTokenModel());
      }

      var authRest = await authenticationRestApi.login(
        credential.username,
        credential.password,
      );
      if (authRest == null) {
        return const Left(
          ResourceFailure(
            prefix: "RestLogin",
            message: "Gagal mendapatkan token akses (NULL)",
          ),
        );
      }
      await authenticationDriftApi.create(accessToken: authRest);
      return Right(authRest.toAccessTokenModel());
    });
  }

  @override
  Future<Either<ResourceFailure, None>> logout() async {
    return await repoTryCatch<None>(() async {
      await authenticationDriftApi.destroy();
      return const Right(None());
    });
  }

  @override
  Future<Either<ResourceFailure, AccessTokenModel?>> getAuthorizationToken() async {
    return await repoTryCatch<AccessTokenModel?>(() async {
      AccessToken? authDrift = await authenticationDriftApi.findOne();
      if (authDrift != null) {
        return Right(authDrift.toAccessTokenModel());
      }
      return const Right(null);
    });
  }

  @override
  Future<Either<ResourceFailure, User?>> getUserDetails() async {
    return await repoTryCatch<User?>(() async {
      User? authDrift = await authenticationDriftApi.findInspector();

      if (authDrift != null) {
        return Right(authDrift.toUserModel());
      }
      return const Right(null);
    });
  }
}
