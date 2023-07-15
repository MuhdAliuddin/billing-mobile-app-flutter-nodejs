import 'package:equatable/equatable.dart';

class InvoiceModel extends Equatable {
  final List<Invoice> invoiceList;

  const InvoiceModel({
    required this.invoiceList,
  });

  @override
  List<Object?> get props => [invoiceList];
}

class Invoice extends Equatable {
  final String id;
  final String amount;
  final String month;
  final int status;

  const Invoice({
    required this.id,
    required this.amount,
    required this.month,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        amount,
        month,
        status,
      ];
}
