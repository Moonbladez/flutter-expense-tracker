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
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                      labelText: "Amount",
                      prefixText: "£ ",
                      helperText: "Amount in GBP"),
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: _showDatePicker,
                      icon: const Icon(Icons.calendar_month_outlined),
                      label: Text(
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                        _selectedDate == null
                            ? "No date chosen"
                            : formatter.format(_selectedDate!),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
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
                items: Category.values.map(
                  (Category category) {
                    return DropdownMenuItem<Category>(
                      value: category,
                      child: Text(
                        category.name.toUpperCase(),
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
          const Spacer(),
          Row(
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
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
                  print(_selectedDate);
                  print(_selectedCategory);
                },
                icon: const Icon(Icons.save),
                label: const Text("Save"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
