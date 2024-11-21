import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final uuid = Uuid();

enum Category { food, travel, work, movie, shopping, others }

const categoryIcons = {
  Category.food: Icons.food_bank,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
  Category.movie: Icons.movie_filter_outlined,
  Category.others: Icons.read_more,
  Category.shopping: Icons.shopping_bag,
};
var categoryColors = {
  Category.food: Colors.blue,
  Category.travel: Colors.red[500],
  Category.work: Colors.purpleAccent.shade200,
  Category.movie: Colors.yellow[700],
  Category.others: Colors.orange,
  Category.shopping: Colors.green
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.catagory,
    String? id,
  }) : id = id ?? uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category catagory;

  String get formattedDate {
    return DateFormat('dd-MM-yyyy').format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.catagory == category)
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
