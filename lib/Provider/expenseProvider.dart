import 'dart:math';

import 'package:flutter/material.dart';
import 'package:midterm_02_v1/Models/expenseModel.dart';

class ExpenseProvider extends ChangeNotifier{
    List<Expense> _expenses = [
      Expense(title: 'Expense 1', description: 'Random Expense', amount: 1000),
      Expense(title: 'Expense 2', description: 'Random Expense 2', amount: 2323),
      Expense(title: 'Expense 3 ', description: 'Random Expense 3', amount: 2525),
      Expense(title: 'Expense 1', description: 'Random Expense 4', amount: 5252),
    ];

    List<Expense> get expenses => _expenses.where((expense) => expense.isPayed == false).toList();

    List<Expense> get expensesCompleted => _expenses.where((expenses) => expenses.isPayed == true).toList();

    void addExpense(Expense expense){
      _expenses.add(expense);
      notifyListeners();
    }

    void removeExpense(Expense expense){
      _expenses.remove(expense);
      notifyListeners();

    }
    bool toggleExpenseStatus(Expense expense){
      expense.isPayed = !expense.isPayed;
      notifyListeners();
      return expense.isPayed;
    }

    void updateExpense(Expense expense,String title, String description, int amount){

      expense.title = title;
      expense.description = description;
      expense.amount = amount;
      notifyListeners();

    }
}