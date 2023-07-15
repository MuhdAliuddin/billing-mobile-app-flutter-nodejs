import 'package:equatable/equatable.dart';

class CredentialModel extends Equatable {
  final String username;
  final String password;
  const CredentialModel({
    required this.username,
    required this.password,
  });
  @override
  List<Object?> get props => [
        username,
        password,
      ];
}
