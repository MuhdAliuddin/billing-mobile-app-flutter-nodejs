part of 'history_dashboard_bloc.dart';

abstract class HistoryDashboardState extends Equatable {
  const HistoryDashboardState();
  @override
  List<Object> get props => [];
}

class HistoryDashboardInitial extends HistoryDashboardState {}

class UseGetHistoryDashboardLoading extends HistoryDashboardState {}

class UseGetMonthlyInvoiceSuccess extends HistoryDashboardState {
  final InvoiceModel? invoiceModel;
  const UseGetMonthlyInvoiceSuccess({
    required this.invoiceModel,
  });
  @override
  List<Object> get props => [];
}

class UseGetHistoryDashboardError extends HistoryDashboardState {
  final ResourceFailure failure;
  const UseGetHistoryDashboardError({required this.failure});
  @override
  List<Object> get props => [failure];
}
