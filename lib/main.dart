import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/theme.dart';
import 'package:flutter_expense_tracker/widgets/expenses_list/expenses_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Tracker",
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: ThemeData.dark().copyWith(useMaterial3: true),
      home: const ExpensesScreen(),
    );
  }
}
