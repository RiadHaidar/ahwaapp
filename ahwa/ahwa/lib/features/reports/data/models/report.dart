import 'package:ahwa/features/orders/data/models/orders.dart';

class Report {
	String reportDate;
	List<Orders> orders;
  String reportResult;
  String reportTitle;
	Report(this.reportDate,this.orders, this.reportResult,this.reportTitle);
}