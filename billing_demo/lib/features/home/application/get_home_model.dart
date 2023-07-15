import 'package:dartz/dartz.dart';

import '../../../core/error/resource_failure.dart';
import '../../../core/usecase/usecase.dart';
import '../domain/home_model.dart';

class GetHomeDashboard implements UseCase<HomeModel, None> {
  @override
  Future<Either<ResourceFailure, HomeModel>> call(params) async {
    var eitherUsername = const Right(
      HomeUserModel(
        userName: 'Abdul Rahman',
        profilePic: 'https://i.pravatar.cc/150?img=31',
      ),
    );

    var userName = eitherUsername.getOrElse(
      () => const HomeUserModel(
        userName: '-',
        profilePic: '-',
      ),
    );

    HomeModel homeModel = HomeModel(
      homeUserNameModel: userName,
    );

    return Right(homeModel);
  }
}
