import 'dart:math';

import 'package:flutter/material.dart';
import 'package:midterm_02_v1/Models/expenseModel.dart';
import 'package:midterm_02_v1/Provider/expenseProvider.dart';
import 'package:midterm_02_v1/widgets/expenseWidget.dart';
import 'package:provider/provider.dart';

class ExpenseListWidget extends StatelessWidget {
  const ExpenseListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpenseProvider>(context);
    final expenses = provider.expenses;

    return expenses.isEmpty
      ?Text('No expenses',style: TextStyle(fontSize: 25),
    )

    :ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(15),
      separatorBuilder: (context,index)=>Container(height: 15,),
      itemCount: expenses.length,
      itemBuilder: (context,index){
        final expense = expenses[index];
        return ExpenseWidget(expense: expense,);
      },
    );
  }
}
