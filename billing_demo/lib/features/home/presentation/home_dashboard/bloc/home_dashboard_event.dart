part of 'home_dashboard_bloc.dart';

abstract class HomeDashboardEvent extends Equatable {
  const HomeDashboardEvent();

  @override
  List<Object> get props => [];
}

class UseGetHomeDashboard extends HomeDashboardEvent {}

class UseGetHomeUsername extends HomeDashboardEvent {}

class UseGetHomeDashboardStatistic extends HomeDashboardEvent {}

class UseGetHomeVacant extends HomeDashboardEvent {}

class UseGetHomeAppointment extends HomeDashboardEvent {}
