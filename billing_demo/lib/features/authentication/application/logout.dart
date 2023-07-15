import 'package:dartz/dartz.dart';

import '../../../core/error/resource_failure.dart';
import '../../../core/usecase/usecase.dart';
import '../datasource/authentication_repository.dart';

class Logout implements UseCase<None, None> {
  final AuthenticationRepository authenticationRepo;
  Logout({required this.authenticationRepo});

  @override
  Future<Either<ResourceFailure, None>> call(None _) async {
    return await authenticationRepo.logout();
  }
}
