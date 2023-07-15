import 'package:dartz/dartz.dart';

import '../../../core/error/resource_failure.dart';
import '../../../core/usecase/usecase.dart';
import '../datasource/home_repository.dart';
import '../domain/invoice_model.dart';

class GetMonthlyInvoice implements UseCase<InvoiceModel?, String> {
  final HomeRepository homeRepository;

  GetMonthlyInvoice({
    required this.homeRepository,
  });

  @override
  Future<Either<ResourceFailure, InvoiceModel?>> call(String id) async {
    return await homeRepository.getMonthlyInvoice(id);
  }
}
