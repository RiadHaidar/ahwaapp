import 'package:ahwa/features/orders/data/models/orders.dart';
import 'package:ahwa/features/reports/data/models/report.dart';
import 'package:ahwa/features/reports/logic/report_handler.dart';
import 'package:ahwa/features/reports/logic/reports_cubit.dart';
import 'package:ahwa/features/reports/logic/reports_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportDetailsScreen extends StatefulWidget {
  final ReportHandler handler;
  final List<Orders> orders;

  const ReportDetailsScreen({super.key, required this.handler, required this.orders});

  @override
  State<ReportDetailsScreen> createState() => _ReportDetailsScreenState();
}

class _ReportDetailsScreenState extends State<ReportDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  String _formatDate(String raw) {
    final DateTime? parsed = DateTime.tryParse(raw);
    if (parsed == null) return raw;
    String two(int n) => n.toString().padLeft(2, '0');
    return '${parsed.year}-${two(parsed.month)}-${two(parsed.day)} ${two(parsed.hour)}:${two(parsed.minute)}';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReportsCubit>(
      create: (_) => ReportsCubit(handler: widget.handler)..generate(widget.orders),
      child: Scaffold(
        appBar: AppBar(title: const Text('Report Details')),
        body: BlocBuilder<ReportsCubit, ReportsStates>(
          builder: (context, state) {
            if (state is ReportsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ReportsErrorState) {
              return const Center(child: Text('Failed to generate report'));
            }
            if (state is ReportsLoadedState) {
              final Report report = state.report;
              final bool isTopSelling = report.reportTitle.toLowerCase().contains('top');

              Widget buildTopSellingSummary() {
                final Map<String, Map<String, int>> summary = {};
                for (final Orders o in report.orders) {
                  final String name = o.drinkType.name;
                  final int price = (o.drinkType.price).toInt();
                  final Map<String, int> current = summary[name] ?? {'count': 0, 'total': 0};
                  current['count'] = (current['count'] ?? 0) + 1;
                  current['total'] = (current['total'] ?? 0) + price;
                  summary[name] = current;
                }
                final entries = summary.entries.toList();
                return ListView.separated(
                  itemCount: entries.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final e = entries[index];
                    final drinkName = e.key;
                    final count = e.value['count'] ?? 0;
                    final total = e.value['total'] ?? 0;
                    return ListTile(
                      title: Text(drinkName),
                      subtitle: Text('Sold: $count times'),
                      trailing: Text('Total amount: $total E£'),
                    );
                  },
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(report.reportTitle, style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 8),
                        Text(report.reportResult),
                        const SizedBox(height: 12),
                        Text('Generated at: ${_formatDate(report.reportDate)}'),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  Expanded(
                    child: isTopSelling
                        ? buildTopSellingSummary()
                        : ListView.builder(
                            itemCount: report.orders.length,
                            itemBuilder: (context, index) {
                              final Orders order = report.orders[index];
                              return ListTile(
                                title: Text(order.drinkType.name),
                                subtitle: Text('Price: ${order.drinkType.price}')
                              );
                            },
                          ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}


