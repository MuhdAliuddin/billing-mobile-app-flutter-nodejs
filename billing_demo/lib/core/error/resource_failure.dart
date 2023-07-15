import 'failure.dart';

class ResourceFailure extends Failure {
  final String prefix;
  final String message;
  final int? statusCode;
  final StackTrace? stackTrace;
  final bool unauthorized;
  const ResourceFailure({
    this.prefix = "RepoFailure",
    required this.message,
    this.statusCode,
    this.stackTrace,
    this.unauthorized = false,
  });

  @override
  String toString() {
    return '$prefix: $message';
  }

  @override
  List<Object?> get props => [
        prefix,
        message,
        statusCode,
        stackTrace,
        unauthorized,
      ];
}
