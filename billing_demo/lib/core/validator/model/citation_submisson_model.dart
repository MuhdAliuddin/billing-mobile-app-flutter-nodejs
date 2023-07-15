import 'package:equatable/equatable.dart';

class CitationSubmissionModel extends Equatable {
  final String report;
  final String action;
  const CitationSubmissionModel({
    required this.report,
    required this.action,
  });
  @override
  List<Object?> get props => [report, action];
}
