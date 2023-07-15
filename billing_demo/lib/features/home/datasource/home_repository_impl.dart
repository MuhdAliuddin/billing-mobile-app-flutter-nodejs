import 'package:dartz/dartz.dart';

import '../../../core/datasource/repo_try_catch.dart';
import '../../../core/error/resource_failure.dart';
import '../../../core/network/network_info.dart';

import '../domain/invoice_model.dart';
import 'home_repository.dart';
import 'rest/home_rest_api.dart';

class HomeRepositoryImpl implements HomeRepository {
  final NetworkInfo networkInfo;
  final HomeRestApi homeRestApi;

  HomeRepositoryImpl({
    required this.networkInfo,
    required this.homeRestApi,
  });

  @override
  Future<Either<ResourceFailure, InvoiceModel?>> getMonthlyInvoice(
    String id,
  ) async {
    return await repoTryCatch<InvoiceModel?>(
      () async {
        var response = await homeRestApi.getMonthlyInvoice(
          id: id,
        );
        return Right(
          InvoiceModel(invoiceList: response ?? []),
        );
      },
    );
  }
}
