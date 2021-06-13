import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:midterm_02_v1/Models/expenseModel.dart';
import 'package:midterm_02_v1/Pages/editExpensePage.dart';
import 'package:midterm_02_v1/Provider/expenseProvider.dart';
import 'package:midterm_02_v1/widgets/utils.dart';
import 'package:provider/provider.dart';

class ExpenseWidget extends StatelessWidget {
  final Expense expense;
  const ExpenseWidget({Key key, this.expense}) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(actionPane: SlidableDrawerActionPane(),key:Key(expense.id),
      actions: [
        IconSlideAction(
          icon:Icons.edit,caption: 'Edit Expense',onTap:() => editExpense(context, expense) ,color: Colors.greenAccent,
        ),
      ],
      secondaryActions: [
        IconSlideAction(
          icon:Icons.remove_circle,caption: 'Delete Expense',onTap: () => deleteExpense(context,expense),color: Colors.redAccent,
        )
      ],
      child: buildExpense(context));
  Widget buildExpense(BuildContext context) => Container(
    color: Colors.white,
    padding: EdgeInsets.all(20),
    child: Row(
      children: [
        Checkbox(
          activeColor: Theme.of(context).primaryColor,
          checkColor: Colors.white,
          value: expense.isPayed,
          onChanged: (_){
          final provider = Provider.of<ExpenseProvider>(context,listen: false);
          final isPayed = provider.toggleExpenseStatus(expense);
          Utils.showSnackBar(context,
          isPayed? 'Payment Completed' : 'Payment Incomplete'
          );

          },
        ),
        SizedBox(width: 20,),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          Text(expense.title,style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 20),),
          if (expense.description.isNotEmpty)
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(expense.description,style: TextStyle(fontSize: 20,height: 1.5),),
            ),
          Text(expense.amount.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 20),),
        ],))
      ],
    ),
  );
  void deleteExpense(BuildContext context, Expense expense){
    final provider = Provider.of<ExpenseProvider>(context,listen: false);
    provider.removeExpense(expense);
    Utils.showSnackBar(context,'Expense Deleted');
  }

  void editExpense(BuildContext context, Expense expense) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditExpensePage(expense:expense)));
}
