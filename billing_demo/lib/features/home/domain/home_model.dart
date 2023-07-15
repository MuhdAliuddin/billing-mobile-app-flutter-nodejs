import 'package:equatable/equatable.dart';

class HomeModel extends Equatable {
  final HomeUserModel homeUserNameModel;

  const HomeModel({
    required this.homeUserNameModel,
  });

  @override
  List<Object?> get props => [homeUserNameModel];
}

class HomeUserModel extends Equatable {
  final String userName;
  final String profilePic;

  const HomeUserModel({
    required this.userName,
    required this.profilePic,
  });

  @override
  List<Object?> get props => [userName, profilePic];
}
