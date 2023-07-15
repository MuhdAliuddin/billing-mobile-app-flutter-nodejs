part of 'history_dashboard_bloc.dart';

abstract class HistoryDashboardEvent extends Equatable {
  const HistoryDashboardEvent();

  @override
  List<Object> get props => [];
}

class UseGetMonthlyInvoice extends HistoryDashboardEvent {}
