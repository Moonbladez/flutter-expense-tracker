import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/expense.dart';
import 'package:flutter_expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter_expense_tracker/widgets/expenses_list/new_expense_modal.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Flutter Course",
      amount: 19.99,
      date: DateTime.now(),
      category: Category.other,
    ),
    Expense(
      title: "Dinner",
      amount: 15.99,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Car",
      amount: 100.00,
      date: DateTime.now(),
      category: Category.transportation,
    )
  ];

  void _openAddExpenseModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewExpenseModal(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(
      () {
        _registeredExpenses.add(expense);
      },
    );
  }

  void _deleteExpense(String id) {
    setState(
      () {
        _registeredExpenses.removeWhere((expense) => expense.id == id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _openAddExpenseModal,
            icon: const Icon(Icons.add),
          )
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Expense Tracker'),
      ),
      body: Column(
        children: [
          const Text("Chart"),
          Expanded(
            child: ExpensesList(
                expenses: _registeredExpenses, onDeleteExpense: _deleteExpense),
          ),
        ],
      ),
    );
  }
}
