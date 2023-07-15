import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/resource_failure.dart';
import '../../../home/application/get_monthly_invoice.dart';
import '../../../home/domain/invoice_model.dart';

part 'history_dashboard_event.dart';
part 'history_dashboard_state.dart';

class HistoryDashboardBloc extends Bloc<HistoryDashboardEvent, HistoryDashboardState> {
  final GetMonthlyInvoice getMonthlyInvoice;

  HistoryDashboardBloc({
    required this.getMonthlyInvoice,
  }) : super(HistoryDashboardInitial()) {
    on<UseGetMonthlyInvoice>((event, emit) async {
      emit(HistoryDashboardInitial());

      var eitherInvoice = await getMonthlyInvoice('100');

      eitherInvoice.fold((failure) {
        emit(UseGetHistoryDashboardError(failure: failure));
      }, (dashboard) {
        emit(UseGetMonthlyInvoiceSuccess(invoiceModel: dashboard));
      });
    });
  }
}
