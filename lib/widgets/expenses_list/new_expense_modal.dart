import 'package:flutter/material.dart';

class NewExpenseModal extends StatefulWidget {
  const NewExpenseModal({super.key});

  @override
  State<NewExpenseModal> createState() => _NewExpenseModalState();
}

class _NewExpenseModalState extends State<NewExpenseModal> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

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
          const TextField(
            decoration: InputDecoration(labelText: "Date"),
            keyboardType: TextInputType.datetime,
          ),
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
