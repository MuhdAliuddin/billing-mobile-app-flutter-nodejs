import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    this.id,
    this.name,
    this.phoneNum,
    this.staffId,
    this.email,
    this.icNum,
    this.expiredDate,
    this.planType,
  });
  final String? id;
  final String? name;
  final String? phoneNum;
  final String? staffId;
  final String? email;
  final String? icNum;
  final String? expiredDate;
  final String? planType;
  @override
  List<Object?> get props => [
        id,
        name,
        phoneNum,
        staffId,
        email,
        icNum,
        expiredDate,
        planType,
      ];
}
