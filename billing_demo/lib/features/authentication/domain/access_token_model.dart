import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../entities/access_token.dart';
import 'user_model.dart';

class AccessTokenModel extends Equatable {
  final String? id;
  final int ttl;
  final String? token;
  final UserModel? user;
  const AccessTokenModel({
    this.id,
    this.token,
    this.ttl = 0,
    this.user,
  });
  @override
  List<Object?> get props => [
        token,
        ttl,
        user,
      ];

  Map toJson() => {
        'id': id,
        'token': token,
        'ttl': ttl,
        'user': user?.toJson() ?? '',
      };

  @override
  String toString() {
    return const JsonEncoder.withIndent('   ').convert(toJson());
  }
}

extension AccessTokenModelAccessToken on AccessToken {
  AccessTokenModel toAccessTokenModel() {
    return AccessTokenModel(
      id: id,
      token: token,
      ttl: ttl,
      user: user?.toUserModel(),
    );
  }
}
