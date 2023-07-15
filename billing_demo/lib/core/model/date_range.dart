import 'package:equatable/equatable.dart';

class DateRange extends Equatable {
  final DateTime fromDate;
  final DateTime toDate;
  const DateRange({
    required this.fromDate,
    required this.toDate,
  });
  @override
  List<Object?> get props => [
        fromDate,
        toDate,
      ];
}
