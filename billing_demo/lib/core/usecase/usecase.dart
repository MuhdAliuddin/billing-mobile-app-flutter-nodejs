import 'package:dartz/dartz.dart';

import '../error/resource_failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<ResourceFailure, Type>> call(Params params);
}
