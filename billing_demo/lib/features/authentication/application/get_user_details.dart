import 'package:dartz/dartz.dart';

import '../../../core/error/resource_failure.dart';
import '../../../core/usecase/usecase.dart';
import '../../../entities/user.dart';
import '../datasource/authentication_repository.dart';

class GetUserDetails implements UseCase<User?, None> {
  final AuthenticationRepository authenticationRepo;
  GetUserDetails({required this.authenticationRepo});

  @override
  Future<Either<ResourceFailure, User?>> call(None _) async {
    return await authenticationRepo.getUserDetails();
  }
}
