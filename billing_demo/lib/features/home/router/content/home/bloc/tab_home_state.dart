part of 'tab_home_bloc.dart';

abstract class TabHomeState extends Equatable {
  const TabHomeState();

  @override
  List<Object> get props => [];
}

class TabHomeDashboard extends TabHomeState {}

class TabHomeRoutineInspectionMenu extends TabHomeState {}

class TabHomeRoutineInspectionPending extends TabHomeState {
  final String id;
  const TabHomeRoutineInspectionPending({required this.id}) : super();
  @override
  List<Object> get props => [id];
}

class TabHomeRoutineInspectionHistory extends TabHomeState {
  final String id;
  const TabHomeRoutineInspectionHistory({required this.id}) : super();
  @override
  List<Object> get props => [id];
}

class TabHomeRoutineInspectionCompleted extends TabHomeState {
  final String id;
  const TabHomeRoutineInspectionCompleted({required this.id}) : super();
  @override
  List<Object> get props => [id];
}

class TabHomeComplaintInspectionMenu extends TabHomeState {}

class TabHomeComplaintInspectionPending extends TabHomeState {
  final String id;
  const TabHomeComplaintInspectionPending({required this.id}) : super();
  @override
  List<Object> get props => [id];
}

class TabHomeComplaintInspectionHistory extends TabHomeState {
  final String id;
  const TabHomeComplaintInspectionHistory({required this.id}) : super();
  @override
  List<Object> get props => [id];
}

class TabHomeComplaintInspectionCompleted extends TabHomeState {
  final String id;
  const TabHomeComplaintInspectionCompleted({required this.id}) : super();
  @override
  List<Object> get props => [id];
}

class TabHomeCitationInspectionMenu extends TabHomeState {}

class TabHomeCitationInspectionDamage extends TabHomeState {
  final String id;
  const TabHomeCitationInspectionDamage({required this.id}) : super();
  @override
  List<Object> get props => [id];
}

class TabHomeCitationInspecitonViolation extends TabHomeState {
  final String id;
  const TabHomeCitationInspecitonViolation({required this.id}) : super();
  @override
  List<Object> get props => [id];
}
