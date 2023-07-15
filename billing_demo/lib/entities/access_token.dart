import 'package:equatable/equatable.dart';

import 'user.dart';

class AccessToken extends Equatable {
  final String? id;
  final String? token;
  final String? userId;
  final int ttl;
  final String? createdAt;
  //relations
  final User? user;

  const AccessToken({
    this.id,
    this.token,
    this.userId,
    this.ttl = 0,
    this.createdAt,
    //relations
    this.user,
  });
  @override
  List<Object?> get props => [
        id,
        token,
        userId,
        ttl,
        createdAt,
        //relations
        user,
      ];
}
