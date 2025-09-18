

import 'package:ahwa/features/orders/data/models/drink_type.dart';

class Orders{
  String customerName;
  DrinkType drinkType;
  String specialInstructions;
  String orderStatus;
  DateTime timeOrdered;

  Orders({
    required this.customerName,
    required this.drinkType,
    required this.specialInstructions,
    required this.orderStatus,
    required this.timeOrdered
  }
  );

}