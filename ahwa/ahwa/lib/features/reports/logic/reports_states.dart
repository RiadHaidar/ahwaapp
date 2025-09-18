import 'package:ahwa/features/reports/data/models/report.dart';

abstract class ReportsStates {}

class ReportsInitialState extends ReportsStates {}

class ReportsLoadingState extends ReportsStates {}

class ReportsLoadedState extends ReportsStates {
  final Report report;
  ReportsLoadedState({required this.report});
}

class ReportsErrorState extends ReportsStates {}


