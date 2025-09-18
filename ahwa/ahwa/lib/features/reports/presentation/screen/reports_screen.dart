
import 'package:ahwa/features/orders/logic/orders_cubit.dart';
import 'package:ahwa/features/orders/logic/orders_states.dart';
import 'package:ahwa/features/reports/logic/report_handler.dart';
import 'package:ahwa/features/reports/presentation/screen/report_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            // Top Selling Report
            GestureDetector(
              onTap: () {
                final ordersCubit = context.read<OrdersCubit>();
                final ordersState = ordersCubit.state;
                if (ordersState is OrdersLoadedState) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ReportDetailsScreen(
                        handler: TopSellingOrdersReport(),
                        orders: ordersState.orders,
                      ),
                    ),
                  );
                } else {
                  ordersCubit.getAllOrders();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Loading orders... tap again')),
                  );
                }
              },
              child: _buildReportCard(
                context,
                'Top Selling',
                Icons.trending_up,
                Colors.blue.shade100,
              ),
            ),
            
            // Daily Report
            GestureDetector(
              onTap: () {
                final ordersCubit = context.read<OrdersCubit>();
                final ordersState = ordersCubit.state;
                if (ordersState is OrdersLoadedState) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ReportDetailsScreen(
                        handler: DailyOrdersReport(),
                        orders: ordersState.orders,
                      ),
                    ),
                  );
                } else {
                  ordersCubit.getAllOrders();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Loading orders... tap again')),
                  );
                }
              },
              child: _buildReportCard(
                context,
                'Daily Report',
                Icons.today,
                Colors.green.shade100,
              ),
            ),
            
            // Total Report
            GestureDetector(
              onTap: () {
                final ordersCubit = context.read<OrdersCubit>();
                final ordersState = ordersCubit.state;
                if (ordersState is OrdersLoadedState) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ReportDetailsScreen(
                        handler: TotalOrdersReport(),
                        orders: ordersState.orders,
                      ),
                    ),
                  );
                } else {
                  ordersCubit.getAllOrders();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Loading orders... tap again')),
                  );
                }
              },
              child: _buildReportCard(
                context,
                'Total',
                Icons.assessment,
                Colors.orange.shade100,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportCard(
    BuildContext context,
    String title,
    IconData icon,
    Color backgroundColor,
  ) {
    return Card(
      elevation: 4.0,
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 48.0,
            color: Colors.black87,
          ),
          const SizedBox(height: 16.0),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}