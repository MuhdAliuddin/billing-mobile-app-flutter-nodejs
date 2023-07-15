import '../error/failure.dart';

class ValidatorFailure extends Failure {
  final String message;
  const ValidatorFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
