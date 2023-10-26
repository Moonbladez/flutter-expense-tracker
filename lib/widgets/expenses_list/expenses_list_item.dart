import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/expense.dart';
import 'package:flutter_expense_tracker/theme.dart';

class ExpensesListItem extends StatelessWidget {
  const ExpensesListItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        dense: true,
        leading: CircleAvatar(
          backgroundColor: kColorScheme.secondaryContainer,
          child: Icon(expense.icon,
              size: 20, color: kColorScheme.onSecondaryContainer),
        ),
        subtitle: Text(
          expense.formattedDate,
        ),
        title: Text(expense.title),
        trailing: Text("£${expense.amount.toStringAsFixed(2)}"),
      ),
    );
  }
}
