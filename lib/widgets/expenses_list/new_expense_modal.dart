import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/expense.dart';

class NewExpenseModal extends StatefulWidget {
  const NewExpenseModal({super.key});

  @override
  State<NewExpenseModal> createState() => _NewExpenseModalState();
}

class _NewExpenseModalState extends State<NewExpenseModal> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory = Category.other;

  void _showDatePicker() async {
    final DateTime now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now.subtract(
        const Duration(days: 365),
      ),
      lastDate: now,
    );

    setState(
      () {
        if (pickedDate != null) {
          _selectedDate = pickedDate;
        }
      },
    );
  }

  void _handleSubmit() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null ||
        _selectedCategory == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          icon: const Icon(Icons.error),
          surfaceTintColor: Theme.of(context).colorScheme.error,
          iconColor: Theme.of(context).colorScheme.error,
          title: const Text("Invalid input"),
          content: const Text(
              "Please make sure a vald title, amount, date and category are set"),
          actions: [
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text(
                "Ok",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ],
        ),
      );
      return;
    }
    final String title = _titleController.text;
    final double amount = double.parse(_amountController.text);
    final DateTime date = _selectedDate ?? DateTime.now();
    final Category category = _selectedCategory ?? Category.other;

    final Expense newExpense = Expense(
      title: title,
      amount: amount,
      date: date,
      category: category,
    );

    Navigator.of(context).pop(newExpense);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Title"),
            maxLength: 50,
            controller: _titleController,
          ),
          TextField(
            decoration: const InputDecoration(
                labelText: "Amount",
                prefixText: "£ ",
                helperText: "Amount in GBP"),
            keyboardType: TextInputType.number,
            controller: _amountController,
          ),
          const SizedBox(
            height: 16,
          ),
          _buildCategoryAndDatePicker(),
          const Spacer(),
          _buildButtonRow(),
        ],
      ),
    );
  }

  Widget _buildCategoryAndDatePicker() {
    return Row(
      children: [
        DropdownButton<Category>(
          value: _selectedCategory,
          onChanged: (Category? newValue) {
            if (newValue == null) {
              return;
            }
            setState(() {
              _selectedCategory = newValue;
            });
          },
          items: Category.values.map((Category category) {
            return DropdownMenuItem<Category>(
              value: category,
              child: Text(
                category.name.toUpperCase(),
              ),
            );
          }).toList(),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: _showDatePicker,
                icon: const Icon(Icons.calendar_month_outlined),
                label: Text(
                  _selectedDate == null
                      ? "No date chosen"
                      : formatter.format(_selectedDate!),
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtonRow() {
    return Row(
      children: [
        TextButton.icon(
          onPressed: () {
            Navigator.of(context).pop();
          },
          label: const Text("Cancel"),
          icon: const Icon(Icons.cancel_outlined),
        ),
        const Spacer(),
        ElevatedButton.icon(
          onPressed: _handleSubmit,
          icon: const Icon(Icons.save),
          label: const Text("Save"),
        ),
      ],
    );
  }
}
