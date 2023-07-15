import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../entities/user.dart';
import '../../../../authentication/application/get_user_details.dart';
import '../../../application/get_home_model.dart';
import '../../../../../core/error/resource_failure.dart';
import '../../../application/get_monthly_invoice.dart';
import '../../../domain/home_model.dart';
import '../../../domain/invoice_model.dart';

part 'home_dashboard_event.dart';
part 'home_dashboard_state.dart';

class HomeDashboardBloc extends Bloc<HomeDashboardEvent, HomeDashboardState> {
  final GetHomeDashboard getHomeDashboard;
  final GetMonthlyInvoice getMonthlyInvoice;
  final GetUserDetails getUserDetails;

  HomeDashboardBloc({
    required this.getHomeDashboard,
    required this.getMonthlyInvoice,
    required this.getUserDetails,
  }) : super(HomeDashboardInitial()) {
    on<UseGetHomeUsername>((event, emit) async {
      emit(UseGetHomeDashboardLoading());
      var eitherUsername = await getHomeDashboard(const None());

      eitherUsername.fold((failure) {
        emit(UseGetHomeDashboardError(failure: failure));
      }, (dashboard) {
        emit(UseGetHomeDashboardSuccess(dashboard: dashboard));
      });
    });

    on<UseGetHomeDashboardStatistic>((event, emit) async {
      emit(UseGetHomeDashboardLoading());

      var eitherInvoice = await getMonthlyInvoice('100');
      var token = await getUserDetails(const None());
      eitherInvoice.fold((failure) {
        emit(
          UseGetHomeDashboardError(failure: failure),
        );
      }, (dashboard) {
        token.fold((failure) {
          emit(
            UseGetHomeDashboardError(failure: failure),
          );
        }, (user) {
          emit(
            UseGetMonthlyInvoiceSuccess(
              invoiceModel: dashboard,
              user: user,
            ),
          );
        });
      });
    });
  }
}
