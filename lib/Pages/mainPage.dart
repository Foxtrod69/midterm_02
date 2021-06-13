import 'package:flutter/material.dart';
import 'package:midterm_02_v1/main.dart';
import 'package:midterm_02_v1/widgets/addExpensesWidget.dart';
import 'package:midterm_02_v1/widgets/completedExpenses.dart';
import 'package:midterm_02_v1/widgets/expenseFormWidget.dart';
import 'package:midterm_02_v1/widgets/expenseListWidget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      ExpenseListWidget(),
      CompletedExpenses(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses App'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => setState((){
          selectedIndex = index;
    }),
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.account_balance_wallet),
            label: 'Expenses'
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.done),
              label: 'Completed Expenses'
          ),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(builder: (context) => AddExpensesWidget(), context: context,barrierDismissible: false),
        child: Icon(Icons.add),
      ),
    );
  }
}
