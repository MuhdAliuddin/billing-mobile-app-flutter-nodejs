class RestException implements Exception {
  final String message;
  final String prefix;
  final StackTrace? stackTrace;
  final int? statusCode;
  final bool unauthorized;

  const RestException({
    required this.message,
    required this.prefix,
    this.stackTrace,
    this.statusCode,
    this.unauthorized = false,
  });

  @override
  String toString() {
    return "$prefix: $message";
  }

  void printStackTrace() {
    // ignore: avoid_print
    if (stackTrace != null) print(stackTrace);
  }
}

class FetchDataException extends RestException {
  const FetchDataException({
    super.prefix = "FetchDataException",
    required super.message,
    super.stackTrace,
    super.statusCode,
  });
}

class NoNetworkException extends RestException {
  const NoNetworkException({
    super.prefix = "NoNetworkException",
    required super.message,
    required super.stackTrace,
    super.statusCode,
  });
}

class BadRequestException extends RestException {
  BadRequestException({
    super.prefix = "BadRequestException",
    required super.message,
    required super.stackTrace,
    super.statusCode,
  });
}

class UnauthorizedException extends RestException {
  UnauthorizedException({
    super.prefix = "UnauthorizedException",
    required super.message,
    required super.stackTrace,
    required super.statusCode,
  });
}

class InvalidInputException extends RestException {
  InvalidInputException({
    super.prefix = "InvalidInputException",
    required super.message,
    required super.stackTrace,
    required super.statusCode,
  });
}
