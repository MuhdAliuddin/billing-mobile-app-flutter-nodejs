part of 'home_dashboard_bloc.dart';

abstract class HomeDashboardState extends Equatable {
  const HomeDashboardState();
  @override
  List<Object> get props => [];
}

class HomeDashboardInitial extends HomeDashboardState {}

class UseGetHomeDashboardLoading extends HomeDashboardState {}

class UseGetHomeDashboardSuccess extends HomeDashboardState {
  final HomeModel dashboard;
  const UseGetHomeDashboardSuccess({
    required this.dashboard,
  });
  @override
  List<Object> get props => [];
}

class UseGetMonthlyInvoiceSuccess extends HomeDashboardState {
  final InvoiceModel? invoiceModel;
  final User? user;
  const UseGetMonthlyInvoiceSuccess({
    required this.invoiceModel,
    required this.user,
  });
  @override
  List<Object> get props => [];
}

class UseGetHomeDashboardError extends HomeDashboardState {
  final ResourceFailure failure;
  const UseGetHomeDashboardError({required this.failure});
  @override
  List<Object> get props => [failure];
}
