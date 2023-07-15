import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
}

class UnhandledFailure extends Failure {
  final String prefix;
  final String message;
  final StackTrace? stackTrace;
  const UnhandledFailure({
    required this.prefix,
    required this.message,
    this.stackTrace,
  });

  @override
  List<Object?> get props => [prefix, message, stackTrace];

  @override
  String toString() {
    return '$prefix $message';
  }
}
