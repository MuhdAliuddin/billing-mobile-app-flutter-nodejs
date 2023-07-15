import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math' as math;
import 'dart:ui' as ui;

import '../../../../core/authorization/bloc/authorization_bloc.dart';
import '../../../authentication/presentation/login/login_auth.dart';
import '../../domain/invoice_model.dart';
import 'bloc/home_dashboard_bloc.dart';

class HomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = ui.Gradient.linear(
        const Offset(60, 60),
        const Offset(100, 800),
        [
          const Color.fromARGB(255, 87, 189, 90),
          const Color.fromARGB(255, 18, 117, 21),
        ],
      );
    // ..style = PaintingStyle.stroke;
    final arcRect = Rect.fromCircle(
      center: size.topCenter(Offset.zero),
      radius: 400,
    );
    canvas.drawArc(arcRect, 0, -math.pi * 2, false, paint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;
}

final ButtonStyle style = ElevatedButton.styleFrom(
  backgroundColor: const Color.fromARGB(255, 239, 239, 239),
);
const listStyle = TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);
const txtstyle = TextStyle(
  fontSize: 10,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

class HomeDashboardHeader extends StatelessWidget {
  const HomeDashboardHeader({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class HomeDashboardContent extends StatelessWidget {
  const HomeDashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: CustomPaint(
                      painter: HomePainter(),
                      child: const AspectRatio(
                        aspectRatio: 2,
                        child: SizedBox(),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    BlocConsumer<HomeDashboardBloc, HomeDashboardState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is HomeDashboardInitial) {
                          context.read<HomeDashboardBloc>().add(
                                UseGetHomeUsername(),
                              );
                          context.read<HomeDashboardBloc>().add(
                                UseGetHomeDashboardStatistic(),
                              );
                        }
                        if (state is UseGetMonthlyInvoiceSuccess) {
                          return SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.15,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Welcome Back",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            state.user?.name ?? '',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      ElevatedButton.icon(
                                        style: ButtonStyle(
                                          fixedSize: MaterialStateProperty.all<Size>(const Size(100, 100)),
                                          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                          shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                        ),
                                        onPressed: () => showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text("Confirm Log Out?"),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                                  child: const Text("Cancel"),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context, 'Confirm');
                                                  },
                                                  child: const Text("Confirm"),
                                                )
                                              ],
                                            );
                                          },
                                        ).then((value) {
                                          if (value == "Confirm") {
                                            context.read<AuthorizationBloc>().add(RevokeAccessToken());
                                          }
                                        }),
                                        icon: const CircleAvatar(
                                          minRadius: 25,
                                          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=31'),
                                          backgroundColor: Colors.transparent,
                                        ),
                                        label: const Text(''),
                                      ),
                                    ],
                                  ),
                                ),
                                _BillCardContent(
                                  invoiceModel: state.invoiceModel,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                _DetailsContent(
                                  invoiceModel: state.invoiceModel,
                                  dataDetails: state.user?.expiredDate ?? '',
                                  planDetails: state.user?.planType ?? '',
                                ),
                              ],
                            ),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsContent extends StatelessWidget {
  final InvoiceModel? invoiceModel;
  final String? dataDetails;
  final String? planDetails;

  const _DetailsContent({
    required this.invoiceModel,
    required this.dataDetails,
    required this.planDetails,
  });

  @override
  Widget build(BuildContext context) {
    var dateNow = DateTime.now();
    var date = DateTime.parse(dataDetails ?? '');
    var time = DateFormat('j').format(DateTime.parse(dataDetails ?? ''));
    var timeLeft = date.difference(dateNow);

    List<MonthlyPayment> bayaranBulanan = [];
    List<charts.Series<MonthlyPayment, String>> createPaymentChart = [
      charts.Series<MonthlyPayment, String>(
        id: 'Monthly Invoice',
        data: bayaranBulanan,
        domainFn: (MonthlyPayment monthlyPayment, _) => monthlyPayment.month,
        measureFn: (MonthlyPayment monthlyPayment, _) => monthlyPayment.payment,
        colorFn: (MonthlyPayment monthlyPayment, _) => monthlyPayment.barColor,
      ),
    ];

    for (var i = 0; i < invoiceModel!.invoiceList.length; i++) {
      bayaranBulanan.add(
        MonthlyPayment(
          DateFormat('MMMM').format(DateTime.parse(invoiceModel!.invoiceList[i].month)),
          int.parse(invoiceModel!.invoiceList[i].amount),
          charts.ColorUtil.fromDartColor(Colors.green),
        ),
      );
    }

    return Material(
      elevation: 20,
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "My Plan",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "High Speed Data Plan",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  Text(
                    "Renews In",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$planDetails | 100 mins",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  Text(
                    "${timeLeft.inDays.toString()} days ${time.toString()}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Expanded(
                      child: charts.BarChart(
                        createPaymentChart,
                        barGroupingType: charts.BarGroupingType.stacked, //this is for stacking barchart
                        behaviors: [
                          //this is legends and its properties
                          charts.SeriesLegend(
                            position: charts.BehaviorPosition.bottom,
                            entryTextStyle: const charts.TextStyleSpec(fontSize: 9),
                          )
                        ],
                        animate: false,
                        primaryMeasureAxis: const charts.NumericAxisSpec(
                            tickProviderSpec: charts.StaticNumericTickProviderSpec(<charts.TickSpec<num>>[
                          charts.TickSpec<num>(0),
                          charts.TickSpec<num>(20),
                          charts.TickSpec<num>(40),
                          charts.TickSpec<num>(60),
                          charts.TickSpec<num>(80),
                        ])),
                        domainAxis: const charts.OrdinalAxisSpec(), //this show x-axis value
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
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
    var width = MediaQuery.of(context).size.width * 1;

    String outstanding = '0';
    String month = '';
    for (var i = 0; i < invoiceModel!.invoiceList.length; i++) {
      if (invoiceModel!.invoiceList[i].status == 1) {
        outstanding = invoiceModel!.invoiceList[i].amount;
        month = DateFormat('MMMM').format(DateTime.parse(invoiceModel!.invoiceList[i].month));
        // invoiceModel!.invoiceList[i].month;
      }
    }

    return Material(
      elevation: 20,
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
      child: SizedBox(
        width: width, //0.29
        // height: height,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "RM $outstanding",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                    Text(
                      month.isEmpty ? '' : "Total Bill For $month",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                    const Text(
                      "Predicted Bill For Next Month RM60",
                      style: TextStyle(
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
                  child: const Text("Pay"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Stacked Bar Chart
class MonthlyPayment {
  final String month;
  final int payment;
  final charts.Color barColor;
  MonthlyPayment(this.month, this.payment, this.barColor);
}
