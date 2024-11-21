import 'package:flutter/material.dart';
import 'package:pool/models/expense.dart';
import 'package:pool/widgets/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemovedExpense});

  final List<Expense> expenses;

  final void Function(Expense expense) onRemovedExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        direction: DismissDirection.endToStart,
        key: ValueKey(expenses[index]),
        background: Container(
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.red.shade400,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        onDismissed: (direction) {
          onRemovedExpense(expenses[index]);
        },
        child: ExpensesItem(expenses[index]),
      ),
    );
  }
}
