import 'package:ahwa/features/orders/data/models/orders.dart';
import 'package:ahwa/features/reports/data/models/report.dart';
import 'package:ahwa/features/reports/logic/report_handler.dart';
import 'package:ahwa/features/reports/logic/reports_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportsCubit extends Cubit<ReportsStates> {
  final ReportHandler handler;
  ReportsCubit({required this.handler}) : super(ReportsInitialState());

  Future<void> generate(List<Orders> orders) async {
    emit(ReportsLoadingState());
    try {
      final Report report = await handler.getReport(orders);
      emit(ReportsLoadedState(report: report));
    } catch (_) {
      emit(ReportsErrorState());
    }
  }
}


