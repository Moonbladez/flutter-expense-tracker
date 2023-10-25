import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/expense.dart';

class ExpensesListItem extends StatelessWidget {
  const ExpensesListItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        dense: true,
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          child: Icon(expense.icon,
              size: 20,
              color: Theme.of(context).colorScheme.onSecondaryContainer),
        ),
        subtitle: Row(
          children: [
            Icon(Icons.calendar_today,
                size: 16,
                color: Theme.of(context).colorScheme.onPrimaryContainer),
            const SizedBox(width: 4),
            Text(
              expense.formattedDate,
            ),
          ],
        ),
        title: Text(expense.title),
        trailing: Text("£${expense.amount.toStringAsFixed(2)}"),
      ),
    );
  }
}
