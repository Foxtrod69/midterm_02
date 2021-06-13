import 'package:flutter/material.dart';
import 'package:midterm_02_v1/Models/expenseModel.dart';
import 'package:midterm_02_v1/Provider/expenseProvider.dart';
import 'package:midterm_02_v1/widgets/expenseFormWidget.dart';
import 'package:provider/provider.dart';

class AddExpensesWidget extends StatefulWidget {
  const AddExpensesWidget({Key key}) : super(key: key);

  @override
  _AddExpensesWidgetState createState() => _AddExpensesWidgetState();
}

class _AddExpensesWidgetState extends State<AddExpensesWidget> {
  final _formkey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  int amount = 0;

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Form(
      key: _formkey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add An Expense', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          SizedBox(height: 10),
          ExpenseFormWidget(
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) => setState(() => this.description = description),
              onChangedAmount: (description) => setState(() => this.amount = amount),
            onSavedExpense: addExpenses,
          )
        ],
      ),
    ),
  );

  void addExpenses(){
    final isValid = _formkey.currentState.validate();

    if (!isValid) {
      return;
    }
    else{
      final expense = Expense(id:DateTime.now().toString(),
        title: title,
        description: description,
        amount: amount,
      );
      final provider = Provider.of<ExpenseProvider>(context,listen:false);
      provider.addExpense(expense);
      Navigator.of(context).pop();

    }
  }
}
