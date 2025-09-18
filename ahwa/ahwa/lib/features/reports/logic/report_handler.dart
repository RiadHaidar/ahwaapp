import 'package:ahwa/features/orders/data/models/orders.dart';
import 'package:ahwa/features/reports/data/models/report.dart';

abstract class ReportHandler {
  Future<Report> getReport(List<Orders> ordersList);
}

class TopSellingOrdersReport implements ReportHandler {
  @override
  Future<Report> getReport(List<Orders> ordersList) async {
    // i need to find the most frequent element, because its the top selling one .
    Report? report;

    Map<String, int> drinks = {};
    List<Orders> filtredOrdersList = [];

    for (var order in ordersList) {
      final drinkName = order.drinkType.name; // get the name of the drink
      drinks[drinkName] = (drinks[drinkName] ?? 0) + 1;
    }

    int maxCount = drinks.values.reduce((a, b) => a > b ? a : b);
    var topDrinks = drinks.entries
        .where((entry) => entry.value == maxCount)
        .toList();

    for (var drink in topDrinks) {
      var filteredOrders = ordersList
          .where((element) => element.drinkType.name == drink.key)
          .toList();
      filtredOrdersList.addAll(filteredOrders);
    }
    report = Report(
      DateTime.now().toString(),

      filtredOrdersList,

      'Here are your most popular drinks',

      'Top Selling Drinks report',
    );

    return report;
  }
}

class TotalOrdersReport implements ReportHandler {
  // i need to count all the orders in the list.
  @override
  Future<Report> getReport(List<Orders> ordersList) async {
    Report? report = Report(
      DateTime.now().toString(),
      ordersList,
      ' Here is your Total orders report ',
      'Total Orders report',
    );
    return report;
  }
}

class DailyOrdersReport implements ReportHandler {
  // i need to make the logic based on the date of each order and then count them .
  @override
  Future<Report> getReport(List<Orders> ordersList) async {
    Orders order;
    List<Orders> filtredOrdersList = [];
    for (order in ordersList) {
      // هون عم نحاول نحسب انو اذا
      // الاوردر من هلا ل وقت طلبو هوي اقل من ٢٤ ساعة
      // عمليا الاوردر مطلوب اليوم
      if (DateTime.now().hour - order.timeOrdered.hour <= 24) {
        filtredOrdersList.add(order);
      }
    }

    Report? report = Report(
      DateTime.now().toString(),
      filtredOrdersList,
      ' Here is your daily report ',
      'Daily report',
    );
    return report;
  }
}
