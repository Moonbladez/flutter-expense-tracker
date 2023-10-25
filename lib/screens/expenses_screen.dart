import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/expense.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _registereExpenses = [
    Expense(
      title: "Flutter Course",
      amount: 19.99,
      date: DateTime.now(),
      category: Category.other,
    ),
    Expense(
      title: "New Shirt",
      amount: 39.99,
      date: DateTime.now(),
      category: Category.clothes,
    ),
    Expense(
      title: 'Dinner',
      amount: 15.99,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 20,
            icon: const Icon(Icons.add),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Expenses'),
      ),
      body: const Column(
        children: [
          Text("Chart"),
          Text("Expenses List"),
        ],
      ),
    );
  }
}
