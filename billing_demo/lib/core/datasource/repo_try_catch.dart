import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';

import 'rest/rest_exceptions.dart';
import '../error/resource_failure.dart';

typedef Caller<T> = Future<Either<ResourceFailure, T>> Function();

Future<Either<ResourceFailure, T>> repoTryCatch<T>(Caller<T> call) async {
  try {
    return await call();
  } on UnauthorizedException catch (e, s) {
    return Left(
      ResourceFailure(
        prefix: e.prefix,
        message: e.toString(),
        stackTrace: s,
        statusCode: e.statusCode,
        unauthorized: true,
      ),
    );
  } on FetchDataException catch (e, s) {
    return Left(
      ResourceFailure(
        prefix: e.prefix,
        message: e.message,
        stackTrace: s,
        statusCode: e.statusCode,
        unauthorized: false,
      ),
    );
  } on NoNetworkException catch (e, s) {
    return Left(
      ResourceFailure(
        prefix: e.prefix,
        message: e.message,
        stackTrace: s,
        statusCode: e.statusCode,
        unauthorized: false,
      ),
    );
  } on BadRequestException catch (e, s) {
    return Left(
      ResourceFailure(
        prefix: e.prefix,
        message: e.message,
        stackTrace: s,
        statusCode: e.statusCode,
        unauthorized: false,
      ),
    );
  } on InvalidInputException catch (e, s) {
    return Left(
      ResourceFailure(
        prefix: e.prefix,
        message: e.message,
        stackTrace: s,
        statusCode: e.statusCode,
        unauthorized: false,
      ),
    );
  } on CouldNotRollBackException catch (e, s) {
    return Left(
      ResourceFailure(
        prefix: "CouldNotRollBackException",
        message: 'Error: ${e.cause}',
        stackTrace: s,
        unauthorized: false,
      ),
    );
  } on DriftWrappedException catch (e, s) {
    return Left(
      ResourceFailure(
        prefix: "DriftWrappedException",
        message: "Error > ${e.message}",
        stackTrace: s,
        unauthorized: false,
      ),
    );
  } on InvalidDataException catch (e, s) {
    return Left(
      ResourceFailure(
        prefix: "InvalidDataException",
        message: "Error > ${e.message}",
        stackTrace: s,
        unauthorized: false,
      ),
    );
  } catch (e, s) {
    return Left(
      ResourceFailure(
        prefix: "RepositoryException",
        message: 'Error > $e',
        stackTrace: s,
        unauthorized: false,
      ),
    );
  }
}
