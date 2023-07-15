import 'dart:convert';

import '../../../entities/user.dart';

class UserModel extends User {
  final String id;
  final String name;
  final String phoneNum;
  final String email;
  final String icNum;
  final String expiredDate;
  final String planType;

  const UserModel({
    required this.id,
    required this.name,
    required this.phoneNum,
    required this.email,
    required this.icNum,
    required this.expiredDate,
    required this.planType,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        icNum,
        phoneNum,
        email,
        expiredDate,
        planType,
      ];

  Map toJson() => {
        'id': id,
        'name': name,
        'phoneNum': phoneNum,
        'email': email,
        'icNum': icNum,
        'expiredDate': expiredDate,
        'planType': planType,
      };

  @override
  String toString() {
    return const JsonEncoder.withIndent('   ').convert(toJson());
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? phoneNum,
    String? email,
    String? icNum,
    String? expiredDate,
    String? planType,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNum: phoneNum ?? this.phoneNum,
      email: email ?? this.email,
      icNum: icNum ?? this.icNum,
      expiredDate: expiredDate ?? this.expiredDate,
      planType: planType ?? this.planType,
    );
  }
}

extension UserModelInspector on User {
  UserModel toUserModel() {
    return UserModel(
      id: id ?? '',
      name: name ?? '',
      email: email ?? '',
      phoneNum: phoneNum ?? '',
      icNum: icNum ?? '',
      expiredDate: expiredDate ?? '',
      planType: planType ?? '',
    );
  }
}
