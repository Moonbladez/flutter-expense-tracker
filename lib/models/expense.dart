import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMMMd();

enum Category {
  food,
  bills,
  clothes,
  entertainment,
  transportation,
  health,
  other,
}

const categoryItems = {
  Category.food: Icons.fastfood,
  Category.bills: Icons.receipt,
  Category.clothes: Icons.shopping_bag,
  Category.entertainment: Icons.movie,
  Category.transportation: Icons.car_rental,
  Category.health: Icons.medical_services,
  Category.other: Icons.more_horiz,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  get icon => categoryItems[category];
  String get formattedDate => formatter.format(date);
}
