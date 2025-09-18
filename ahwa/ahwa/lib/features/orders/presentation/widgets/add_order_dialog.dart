import 'package:ahwa/features/orders/data/models/drink_type.dart';
import 'package:ahwa/features/orders/data/models/orders.dart';
import 'package:ahwa/features/orders/logic/orders_cubit.dart';
import 'package:ahwa/features/orders/logic/orders_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrderDialog extends StatefulWidget {
  const AddOrderDialog({super.key});

  @override
  State<AddOrderDialog> createState() => _AddOrderDialogState();
}

class _AddOrderDialogState extends State<AddOrderDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();

  static const Map<String, int> drinkTypes = {
    'shai': 25,
    'mloukhia': 90,
    'laban': 20,
    'espresso': 35,
    'cappuccino': 45,
    'latte': 40,
    'americano': 30,
    'mocha': 55,
    'hot chocolate': 40,
    'ahwa': 50,
    'green tea': 25,
    'mint tea': 25,
    'iced coffee': 45,
    'turkish coffee': 35,
    'orange juice': 30,
  };

  String? _selectedDrink;

  @override
  void dispose() {
    _nameController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int? selectedPrice = _selectedDrink != null ? drinkTypes[_selectedDrink!] : null;
    return AlertDialog(
      title: const Text('Add New Order'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedDrink,
                decoration: const InputDecoration(labelText: 'Drink'),
                items: drinkTypes.keys
                    .map((name) => DropdownMenuItem<String>(
                          value: name,
                          child: Text(name),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedDrink = val;
                  });
                },
                validator: (val) => val == null || val.isEmpty ? 'Please select a drink' : null,
              ),
              const SizedBox(height: 12),
              if (selectedPrice != null)
                Text(
                  'Price: $selectedPrice E£',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Customer name"),
                validator: (v) => v == null || v.trim().isEmpty ? 'Enter customer name' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _instructionsController,
                decoration: const InputDecoration(labelText: "Special instructions (optional)"),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            if (!_formKey.currentState!.validate()) return;
            final String drinkName = _selectedDrink!;
            final int price = drinkTypes[drinkName]!;
            final Orders newOrder = Orders(
              customerName: _nameController.text.trim(),
              drinkType: DrinkType(drinkName, price.toDouble()),
              specialInstructions: _instructionsController.text.trim(),
              orderStatus: 'pending',
              timeOrdered: DateTime.now(),
            );

            final OrdersCubit cubit = context.read<OrdersCubit>();
            cubit.addOrder(newOrder);
            cubit.getAllOrders();
            if (mounted) Navigator.of(context).pop();
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}


