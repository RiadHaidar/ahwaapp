# ahwa


A new Flutter project.


The app is called ahwa,
It allows you to add orders, check their status, update them, and generate different reports based on these orders.


## Getting Started




The project is pretty basic; it's mainly to cover the concepts of the first and second chapters mentioned in the The Object-Oriented Thought Process book.




I tried to follow basic clean architecture with feature structure




Each feature is supposed to logically consist of three layers:


1_Data: where we have a connection with a source of data, could be local or an API.
its also where we have our models that are defined based on the data we need to deal with.




2_Logic: where the business happens, how do we manipulate the data, how do we write a logic of functions and operations to manage data and stuff across our app


3_Presentaion: Lets say its the surface layer, the user deal with it directly, it includes the UI.




Now talking about using OOPs and SOLID, the features:


Orders:
in orders.dart (the order model)
I used a slight composition by considering that the Order has a  DrinkType




I created an abstract class called report handler, in which i implemented 3 report generator from.


which covers inheritance.
polymorphism.
and it also covers Open ending princples, because i can keep on adding new repoert generation forms.




making  List<Orders> _orders private in the orders cubit, as sort of following encapuslation as well.


## Features

### Orders Feature
The Orders feature allows users to manage drink orders in the café. It includes:
- Viewing all orders with their status (pending or completed)
- Adding new orders with customer details and special instructions
- Updating order status between pending and completed
- Filtering orders by their status

The Orders screen is organized with a tab-based interface that separates all orders, completed orders, and pending orders for easy management. Each order card displays the drink type, price, customer name, special instructions, and order time.

### Reports Feature
The Reports feature provides analytical insights about the orders. It includes three types of reports:
- Top Selling Report: Shows the most popular drinks based on order frequency
- Daily Report: Displays orders made within the last 24 hours
- Total Report: Shows all orders in the system

Each report is generated dynamically based on the current order data, making it always up-to-date. The reports are presented in a visually appealing grid layout with distinctive icons and colors.

## Dependency Injection

For dependency injection, I used the GetIt package with lazy singletons. I chose lazy singletons to keep the same instance of the cubits running throughout the app lifecycle, as I don't need to destroy them. I didn't use factory registration because my use case didn't require a fresh instance of the cubit every time.

```dart
// Cubits
getIt.registerLazySingleton<OrdersCubit>(() => OrdersCubit());
getIt.registerLazySingleton<ReportsCubit>(() => ReportsCubit(handler: getIt<ReportHandler>()));
```

## UI Implementation

The app uses a bottom navigation bar to switch between the Orders and Reports screens. For state management, I implemented the BLoC pattern using the flutter_bloc package.

In the main.dart file, I set up MultiBlocProvider to provide the necessary cubits to the widget tree:

```dart
home: MultiBlocProvider(
    providers: [
      BlocProvider<OrdersCubit>(create: (_) => getIt<OrdersCubit>()..getAllOrders()),
      BlocProvider<ReportsCubit>(create: (_) => getIt<ReportsCubit>()),
    ],
```

While this approach works well for a small app like this, for larger scalable applications, there are better approaches such as using route-specific BlocProviders or context-based injection.

When implementing the Add Order dialog, I had to use BlocProvider.value:

```dart
return BlocProvider.value(
  value: context.read<OrdersCubit>(),
  child: const AddOrderDialog(),
);
```

This was necessary because dialogs typically don't carry their parent context - they have their own context. Attempting to access the bloc inside the dialog would cause a BlocProvider access error. Using BlocProvider.value allows the dialog to use the existing running instance of the OrdersCubit.

## State Management

The app uses BlocBuilder and BlocListener patterns to react to state changes:

- In OrdersScreen, BlocBuilder monitors the OrdersStates to update the UI when orders are loaded, added, or their status changes.
- In ReportsScreen, the app checks the current state of OrdersCubit before navigating to the report details, ensuring data is available.
- In ReportDetailsScreen, BlocBuilder is used to show loading indicators, error messages, or the report content based on the current state.

This reactive approach ensures the UI always reflects the current application state, providing a smooth user experience.




Final Project:




<img width="400" height="650" alt="Simulator Screenshot - iPhone 15 - 2025-09-18 at 19 06 03" src="https://github.com/user-attachments/assets/4424bc90-935a-48b1-baaa-c1566cc102c1" />

<img width="400" height="650" alt="Simulator Screenshot - iPhone 15 - 2025-09-18 at 19 05 55" src="https://github.com/user-attachments/assets/afe758b9-be68-4cf9-accd-7c3216c8bf29" />

<img width="400" height="650" alt="Simulator Screenshot - iPhone 15 - 2025-09-18 at 19 05 53" src="https://github.com/user-attachments/assets/90746b00-ea33-413f-b18c-2f5e3577a194" />


# ahwaapp






Final Assignment:

[final_assignment.pdf](https://github.com/user-attachments/files/22411611/final_assignment.pdf)

