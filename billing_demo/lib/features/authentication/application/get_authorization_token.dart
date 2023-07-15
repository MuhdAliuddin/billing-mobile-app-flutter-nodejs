import 'package:dartz/dartz.dart';

import '../../../core/error/resource_failure.dart';
import '../../../core/usecase/usecase.dart';
import '../datasource/authentication_repository.dart';
import '../domain/access_token_model.dart';

class GetAuthorizationToken implements UseCase<AccessTokenModel?, None> {
  final AuthenticationRepository authenticationRepo;
  GetAuthorizationToken({required this.authenticationRepo});

  @override
  Future<Either<ResourceFailure, AccessTokenModel?>> call(None _) async {
    return await authenticationRepo.getAuthorizationToken();
  }
}
