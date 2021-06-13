import 'package:flutter/material.dart';

class ExpenseFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final int amount;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<String> onChangedAmount;
  final VoidCallback onSavedExpense;
  const ExpenseFormWidget({Key key, this.title, this.description, this.amount, this.onChangedTitle, this.onChangedDescription, this.onChangedAmount, this.onSavedExpense}) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
          buildTitle(),
        SizedBox(height: 10,),
        buildDescription(),
        SizedBox(height: 10,),
        buildAmount(),
        SizedBox(height: 30,),
        buildButton(),
      ],
    ),
  );
  Widget buildTitle() => TextFormField(
    maxLines: 1,
    initialValue: title,
    onChanged: onChangedTitle,
    validator: (title){
      if(title.isEmpty){
        return 'Please fill in the fields';
      }
      return null;
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Expense Title',
    ),
  );
  Widget buildDescription() => TextFormField(
    maxLines: 2,
    initialValue: description,
    onChanged: onChangedDescription,
    decoration: InputDecoration(border: UnderlineInputBorder(),labelText: 'Expense Description'),
  );
  Widget buildAmount() => TextFormField(
    maxLines: 1,
    initialValue: amount.toString(),
    onChanged: onChangedAmount,
    decoration: InputDecoration(border: UnderlineInputBorder(),labelText: 'Expense Amount',),
  );
  Widget buildButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
      ),
      onPressed: onSavedExpense,
      child: Text('Save Expense'),
    ),
  );
}
