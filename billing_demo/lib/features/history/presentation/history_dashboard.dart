import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../home/domain/invoice_model.dart';
import 'bloc/history_dashboard_bloc.dart';

class ProfileDashboardHeader extends StatelessWidget {
  const ProfileDashboardHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color.fromARGB(255, 87, 189, 90),
            Color.fromARGB(255, 18, 117, 21),
          ],
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                'Payment History',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileDashboardContent extends StatelessWidget {
  const ProfileDashboardContent({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<HistoryDashboardBloc, HistoryDashboardState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HistoryDashboardInitial) {
            context.read<HistoryDashboardBloc>().add(
                  UseGetMonthlyInvoice(),
                );
          }
          if (state is UseGetMonthlyInvoiceSuccess) {
            // return _HomeDashboardContent();
            return Padding(
              padding: const EdgeInsets.all(20),
              child: _BillCardContent(
                invoiceModel: state.invoiceModel,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class _BillCardContent extends StatelessWidget {
  final InvoiceModel? invoiceModel;

  const _BillCardContent({
    required this.invoiceModel,
  });

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height * 0.15;
    // var width = MediaQuery.of(context).size.width * 1;
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: invoiceModel?.invoiceList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Material(
                elevation: 20,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                child: SizedBox(
                  // width: width, //0.29
                  // height: height,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "RM ${invoiceModel?.invoiceList[index].amount}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                              ),
                              Text(
                                "Total Bill For ${DateFormat('MMMM').format(DateTime.parse(invoiceModel!.invoiceList[index].month))}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 6, 90, 158),
                            ),
                            onPressed: () => {},
                            child: const Text("View Receipt"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          );
        });
  }
}
