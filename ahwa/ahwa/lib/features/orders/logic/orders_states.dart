

import 'package:ahwa/features/orders/data/models/orders.dart';

abstract class OrdersStates {}

class OrdersInitialState extends OrdersStates {}

class OrdersLoadingState extends OrdersStates {}

class OrdersLoadedState extends OrdersStates {

  List<Orders> orders;
  OrdersLoadedState({required this.orders});
}

class OrdersErrorState extends OrdersStates {}


class OrdersAddSuccessState extends OrdersStates {}

class OrdersAddErrorState extends OrdersStates {}

class OrdersAddLoadingState extends OrdersStates {}

class OrdersUpdateStatusLoadingState extends OrdersStates {}

class OrdersUpdateStatusSuccessState extends OrdersStates {}

class OrdersUpdateStatusErrorState extends OrdersStates {}


