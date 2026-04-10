import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
// import '../../../linux/expenses_list.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'flutter course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'cinema',
        amount: 15.99,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Expense deleted'),
        action: SnackBarAction(
            label: 'undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = Center(
      child: Text('no expenses founf , start adding some !'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('flutter expense tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
