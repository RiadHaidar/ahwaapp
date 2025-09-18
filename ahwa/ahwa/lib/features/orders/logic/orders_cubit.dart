import 'package:ahwa/features/orders/data/models/drink_type.dart';
import 'package:ahwa/features/orders/data/models/orders.dart';
import 'package:ahwa/features/orders/logic/orders_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersCubit extends Cubit<OrdersStates> {
  OrdersCubit() : super(OrdersInitialState());

  List<Orders> _orders = [
    Orders(
      customerName: 'Ahmed Hassan',
      drinkType: DrinkType('shai', 25),
      specialInstructions: 'Extra sugar',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 9)),
    ),
    Orders(
      customerName: 'Sara Ali',
      drinkType: DrinkType('shai', 25),
      specialInstructions: 'With mint',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 8)),
    ),
    Orders(
      customerName: 'Mohamed Ibrahim',
      drinkType: DrinkType('mloukhia', 90),
      specialInstructions: 'No spices',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 7)),
    ),
    Orders(
      customerName: 'Fatima Mahmoud',
      drinkType: DrinkType('laban', 20),
      specialInstructions: 'Cold',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 6)),
    ),
    Orders(
      customerName: 'Omar Khaled',
      drinkType: DrinkType('espresso', 35),
      specialInstructions: 'Double shot',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    Orders(
      customerName: 'Layla Nour',
      drinkType: DrinkType('cappuccino', 45),
      specialInstructions: 'Extra foam',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 4)),
    ),
    Orders(
      customerName: 'Karim Adel',
      drinkType: DrinkType('latte', 40),
      specialInstructions: 'With caramel',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 3)),
    ),
    Orders(
      customerName: 'Nour Essam',
      drinkType: DrinkType('americano', 30),
      specialInstructions: 'Extra hot',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 2)),
    ),
    Orders(
      customerName: 'Youssef Tarek',
      drinkType: DrinkType('mocha', 55),
      specialInstructions: 'Less sugar',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 1)),
    ),
    Orders(
      customerName: 'Hana Mostafa',
      drinkType: DrinkType('hot chocolate', 40),
      specialInstructions: 'With whipped cream',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 12)),
    ),
    Orders(
      customerName: 'Ali Samy',
      drinkType: DrinkType('shai', 25),
      specialInstructions: 'Strong',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 11)),
    ),
    Orders(
      customerName: 'Mariam Hossam',
      drinkType: DrinkType('ahwa', 50),
      specialInstructions: 'Medium sugar',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 10)),
    ),
    Orders(
      customerName: 'Hassan Mahmoud',
      drinkType: DrinkType('green tea', 25),
      specialInstructions: 'With honey',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 7)),
    ),
    Orders(
      customerName: 'Salma Khaled',
      drinkType: DrinkType('mint tea', 25),
      specialInstructions: 'Extra mint',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 30)),
    ),
    Orders(
      customerName: 'Amr Farouk',
      drinkType: DrinkType('iced coffee', 45),
      specialInstructions: 'With vanilla',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 8)),
    ),
    Orders(
      customerName: 'Dina Samir',
      drinkType: DrinkType('turkish coffee', 35),
      specialInstructions: 'Medium sweet',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 12)),
    ),
    Orders(
      customerName: 'Tarek Nabil',
      drinkType: DrinkType('orange juice', 30),
      specialInstructions: 'No ice',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 9)),
    ),
    Orders(
      customerName: 'Yasmin Adel',
      drinkType: DrinkType('mloukhia', 90),
      specialInstructions: 'Extra spicy',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 35)),
    ),
    Orders(
      customerName: 'Khaled Mostafa',
      drinkType: DrinkType('laban', 20),
      specialInstructions: 'Room temperature',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 10)),
    ),
    Orders(
      customerName: 'Rana Hany',
      drinkType: DrinkType('espresso', 35),
      specialInstructions: 'Single shot',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 14)),
    ),
    Orders(
      customerName: 'Mostafa Ibrahim',
      drinkType: DrinkType('cappuccino', 45),
      specialInstructions: 'Less foam',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 11)),
    ),
    Orders(
      customerName: 'Amal Saeed',
      drinkType: DrinkType('latte', 40),
      specialInstructions: 'With chocolate',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 40)),
    ),
    Orders(
      customerName: 'Sherif Adel',
      drinkType: DrinkType('americano', 30),
      specialInstructions: 'With milk',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 12)),
    ),
    Orders(
      customerName: 'Heba Mahmoud',
      drinkType: DrinkType('mocha', 55),
      specialInstructions: 'Extra chocolate',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 16)),
    ),
    Orders(
      customerName: 'Adel Kamal',
      drinkType: DrinkType('hot chocolate', 40),
      specialInstructions: 'No whipped cream',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 13)),
    ),
    Orders(
      customerName: 'Mona Hisham',
      drinkType: DrinkType('green tea', 25),
      specialInstructions: 'With lemon',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 45)),
    ),
    Orders(
      customerName: 'Tamer Hosny',
      drinkType: DrinkType('mint tea', 25),
      specialInstructions: 'With sugar',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 14)),
    ),
    Orders(
      customerName: 'Rania Ahmed',
      drinkType: DrinkType('iced coffee', 45),
      specialInstructions: 'With caramel',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 18)),
    ),
    Orders(
      customerName: 'Hany Ramzy',
      drinkType: DrinkType('turkish coffee', 35),
      specialInstructions: 'No sugar',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 15)),
    ),
    Orders(
      customerName: 'Noha Samy',
      drinkType: DrinkType('orange juice', 30),
      specialInstructions: 'With ice',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 50)),
    ),
    Orders(
      customerName: 'Samy Gamal',
      drinkType: DrinkType('shai', 25),
      specialInstructions: 'With milk',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 16)),
    ),
    Orders(
      customerName: 'Hoda Kamel',
      drinkType: DrinkType('ahwa', 50),
      specialInstructions: 'No sugar',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 20)),
    ),
    Orders(
      customerName: 'Gamal Hamdy',
      drinkType: DrinkType('mloukhia', 90),
      specialInstructions: 'Medium spicy',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 17)),
    ),
    Orders(
      customerName: 'Sahar Nabil',
      drinkType: DrinkType('laban', 20),
      specialInstructions: 'Extra cold',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 55)),
    ),
    Orders(
      customerName: 'Nabil Fahmy',
      drinkType: DrinkType('espresso', 35),
      specialInstructions: 'With sugar',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 18)),
    ),
    Orders(
      customerName: 'Lamia Kamal',
      drinkType: DrinkType('cappuccino', 45),
      specialInstructions: 'With cinnamon',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 22)),
    ),
    Orders(
      customerName: 'Kamal Adel',
      drinkType: DrinkType('latte', 40),
      specialInstructions: 'With vanilla',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 19)),
    ),
    Orders(
      customerName: 'Amira Hany',
      drinkType: DrinkType('americano', 30),
      specialInstructions: 'Strong',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    Orders(
      customerName: 'Hany Shaker',
      drinkType: DrinkType('mocha', 55),
      specialInstructions: 'With whipped cream',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 20)),
    ),
    Orders(
      customerName: 'Sherine Ahmed',
      drinkType: DrinkType('hot chocolate', 40),
      specialInstructions: 'Extra hot',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 24)),
    ),
    Orders(
      customerName: 'Ahmed Helmy',
      drinkType: DrinkType('green tea', 25),
      specialInstructions: 'With mint',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 21)),
    ),
    Orders(
      customerName: 'Menna Shalaby',
      drinkType: DrinkType('mint tea', 25),
      specialInstructions: 'With honey',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(
        const Duration(hours: 1, minutes: 5),
      ),
    ),
    Orders(
      customerName: 'Amr Diab',
      drinkType: DrinkType('iced coffee', 45),
      specialInstructions: 'Less ice',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 22)),
    ),
    Orders(
      customerName: 'Donia Samir',
      drinkType: DrinkType('turkish coffee', 35),
      specialInstructions: 'Extra sugar',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 26)),
    ),
    Orders(
      customerName: 'Mohamed Mounir',
      drinkType: DrinkType('orange juice', 30),
      specialInstructions: 'Fresh',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 23)),
    ),
    Orders(
      customerName: 'Yousra Ahmed',
      drinkType: DrinkType('shai', 25),
      specialInstructions: 'With cardamom',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(
        const Duration(hours: 1, minutes: 10),
      ),
    ),
    Orders(
      customerName: 'Adel Imam',
      drinkType: DrinkType('ahwa', 50),
      specialInstructions: 'Traditional',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 24)),
    ),
    Orders(
      customerName: 'Leila Elwi',
      drinkType: DrinkType('mloukhia', 90),
      specialInstructions: 'Family size',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(const Duration(minutes: 28)),
    ),
    Orders(
      customerName: 'Hussein Fahmy',
      drinkType: DrinkType('laban', 20),
      specialInstructions: 'With ice',
      orderStatus: 'completed',
      timeOrdered: DateTime.now().subtract(const Duration(hours: 25)),
    ),
    Orders(
      customerName: 'Elham Shahin',
      drinkType: DrinkType('espresso', 35),
      specialInstructions: 'With chocolate',
      orderStatus: 'pending',
      timeOrdered: DateTime.now().subtract(
        const Duration(hours: 1, minutes: 15),
      ),
    ),
  ];

  void getAllOrders() {
    emit(OrdersAddLoadingState());

    try {
      emit(OrdersLoadedState(orders: _orders));
    } catch (e) {
      emit(OrdersErrorState());
    }
  }

  void addOrder(Orders newOrder) {
    emit(OrdersAddLoadingState());

    try {
      _orders.add(newOrder);
      emit(OrdersAddSuccessState());
    } catch (e) {
      emit(OrdersAddErrorState());
    }
  }

  void updateOrderStatus(Orders order, String newStatus) {
    emit(OrdersUpdateStatusLoadingState());
    try {
      order.orderStatus = newStatus;
      emit(OrdersUpdateStatusSuccessState());
      emit(OrdersLoadedState(orders: _orders));
    } catch (e) {
      emit(OrdersUpdateStatusErrorState());
    }
  }
}
