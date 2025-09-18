import 'package:ahwa/features/orders/logic/orders_cubit.dart';
import 'package:ahwa/features/reports/logic/report_handler.dart';
import 'package:ahwa/features/reports/logic/reports_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void configureDependencies() {
  // Reports domain strategy
  getIt.registerLazySingleton<ReportHandler>(() => TopSellingOrdersReport());

  // Cubits
  getIt.registerLazySingleton<OrdersCubit>(() => OrdersCubit());
  getIt.registerLazySingleton<ReportsCubit>(() => ReportsCubit(handler: getIt<ReportHandler>()));
}


