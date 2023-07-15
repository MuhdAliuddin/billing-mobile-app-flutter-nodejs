import 'package:billing_demo_app/features/home/domain/invoice_model.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/resource_failure.dart';

abstract class HomeRepository {
  Future<Either<ResourceFailure, InvoiceModel?>> getMonthlyInvoice(String id);
}
