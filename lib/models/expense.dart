import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

enum Category { food, work, leisure, travel } //enums used to create custom type

final formatter = DateFormat.yMd();
const CategoryIcons = {
  Category.food: Icons.lunch_dining_outlined,
  Category.travel: Icons.travel_explore_outlined,
  Category.leisure: Icons.sports_esports_outlined,
  Category.work: Icons.work_outlined,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // to generate random string of id
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  String get formattedDate => formatter.format(date);
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();
  final Category category;
  final List<Expense> expenses;
  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
