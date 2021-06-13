import 'package:flutter/material.dart';
import 'package:midterm_02_v1/Pages/mainPage.dart';
import 'package:midterm_02_v1/Provider/expenseProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  // ignore: missing_return
  Widget build(BuildContext context) => ChangeNotifierProvider(create: (context) => ExpenseProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses App',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),
      home: MainPage(),
    ),
  );
  }



