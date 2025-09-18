import 'package:ahwa/core/di/injection.dart';
import 'package:ahwa/features/orders/logic/orders_cubit.dart';
import 'package:ahwa/features/orders/presentation/screen/orders_screen.dart';
import 'package:ahwa/features/reports/logic/reports_cubit.dart';
import 'package:ahwa/features/reports/presentation/screen/reports_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp( AhwaApp());
}




class AhwaApp extends StatefulWidget {
  const AhwaApp({super.key});

  @override
  State<AhwaApp> createState() => _AhwaAppState();
}

class _AhwaAppState extends State<AhwaApp> {

  List<Widget> pages=[
      OrdersScreen(),
      ReportsScreen(),
  ];

  int index =0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<OrdersCubit>(create: (_) => getIt<OrdersCubit>()..getAllOrders()),
          BlocProvider<ReportsCubit>(create: (_) => getIt<ReportsCubit>()),
        ],
        child: Scaffold(
        body: pages[index],
        appBar: AppBar(title:Text('Ahwa App')),
      
        
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index=value;
            });
          },
          
          items: [
      
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long),label:'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt),label:'Reports'),
        ]),
      ),
      ),
    );
  }
}