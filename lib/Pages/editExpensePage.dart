import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:midterm_02_v1/Models/expenseModel.dart';
import 'package:midterm_02_v1/Provider/expenseProvider.dart';
import 'package:midterm_02_v1/widgets/expenseFormWidget.dart';
import 'package:provider/provider.dart';

class EditExpensePage extends StatefulWidget {
  final Expense expense;
  const EditExpensePage({Key key, this.expense}) : super(key: key);

  @override
  _EditExpensePageState createState() => _EditExpensePageState();
}

class _EditExpensePageState extends State<EditExpensePage> {
  String title;
  String description;
  int amount;
  @override
  void initState(){
    super.initState();
    title = widget.expense.title;
    description = widget.expense.description;
    amount = widget.expense.amount;
  }
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Edit Expense'),
    ),
    body: Padding(padding: EdgeInsets.all(15),
      child: ExpenseFormWidget(
        title: title,
        description: description,
        amount: amount,
        onChangedTitle: (title) => setState(() => this.title = title),
        onChangedDescription: (description) => setState(() => this.description = description),
        onChangedAmount: (amount) => setState(() => this.amount = amount.toString() as int),
        onSavedExpense: saveExpense,

      ),
    ),
  );

  void saveExpense(){
    final provider = Provider.of<ExpenseProvider>(context,listen: false);
    provider.updateExpense(widget.expense, title,description,amount);
    Navigator.of(context).pop();
  }
}
