import '../../domain/invoice_model.dart';

abstract class HomeRestApi {
  Future<List<Invoice>?> getMonthlyInvoice({required String id});
}
