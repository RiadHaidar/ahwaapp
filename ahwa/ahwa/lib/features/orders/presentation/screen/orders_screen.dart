import 'package:ahwa/features/orders/data/models/orders.dart';
import 'package:ahwa/features/orders/logic/orders_cubit.dart';
import 'package:ahwa/features/orders/logic/orders_states.dart';
import 'package:ahwa/features/orders/presentation/widgets/add_order_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          label: Text('Add Order'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (dialogCtx) {
                // Use parent context for reading cubit to avoid provider lookup issues
                return BlocProvider.value(
                  value: context.read<OrdersCubit>(),
                  child: const AddOrderDialog(),
                );
              },
            );
          },
          icon: Icon(Icons.add),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(icon: Icon(Icons.list_alt)
               , text: 'All Orders',
                ),
                Tab(icon: Icon(Icons.assignment),

                    text: 'Completed',
                ),
                Tab(icon: Icon(Icons.assignment_outlined)
                  ,text: 'Pending',
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<OrdersCubit, OrdersStates>(
                builder: (context, state) {
                  if (state is OrdersLoadingState || state is OrdersAddLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is OrdersErrorState || state is OrdersAddErrorState) {
                    return Center(child: Text('Failed to load orders'));
                  }

                  // ensure data is loaded
                  List<Orders> all = [];
                  if (state is OrdersLoadedState) {
                    all = state.orders;
                  }

                  final List<Orders> completed = all.where((o) => o.orderStatus == 'completed').toList();
                  final List<Orders> pending = all.where((o) => o.orderStatus == 'pending').toList();

                  return TabBarView(
                    children: [
                      _OrdersList(orders: all),
                      _OrdersList(orders: completed),
                      _OrdersList(orders: pending),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrdersList extends StatelessWidget {
  final List<Orders> orders;
  const _OrdersList({required this.orders});

  String _formatDate(DateTime dt) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'completed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return Center(child: Text('No orders'));
    }
    final List<Orders> sorted = List<Orders>.from(orders)
      ..sort((a, b) => b.timeOrdered.compareTo(a.timeOrdered));
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: sorted.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final o = sorted[index];
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(
                              text: o.drinkType.name,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const TextSpan(text: '  '),
                            TextSpan(
                              text: '${o.drinkType.price} E£',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    PopupMenuButton<String>(
                      tooltip: 'Change status',
                      onSelected: (value) {
                        context.read<OrdersCubit>().updateOrderStatus(o, value);
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(value: 'pending', child: Text('Pending')),
                        const PopupMenuItem(value: 'completed', child: Text('Completed')),
                      ],
                      child: Chip(
                        label: Text(o.orderStatus),
                        backgroundColor: _statusColor(o.orderStatus).withOpacity(0.15),
                        labelStyle: TextStyle(color: _statusColor(o.orderStatus), fontWeight: FontWeight.w600),
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (o.specialInstructions.trim().isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      o.specialInstructions,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
                    ),
                  ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        o.customerName,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Text(
                      _formatDate(o.timeOrdered),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
