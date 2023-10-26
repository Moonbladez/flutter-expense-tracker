import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/expense.dart';
import 'package:flutter_expense_tracker/widgets/expenses_list/expenses_list_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onDeleteExpense});

  final List<Expense> expenses;
  final void Function(Expense) onDeleteExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        secondaryBackground: Container(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.delete,
                    color: Theme.of(context).colorScheme.onError),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  'Move to trash',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onError),
                ),
              ],
            ),
          ),
        ),
        background: Container(color: Colors.red),
        direction: DismissDirection.endToStart,
        key: ValueKey(
          expenses[index].id,
        ),
        child: ExpensesListItem(
          expense: expenses[index],
        ),
        onDismissed: (direction) => onDeleteExpense(expenses[index]),
      ),
    );
  }
}
