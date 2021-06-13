import 'package:flutter/cupertino.dart';

class Expense {
  String title;
  String description;
  int amount;
  String id;
  bool isPayed;

  Expense({
    @required this.title,
    @required this.description,
    @required this.amount,
    this.id,
    this.isPayed = false,
  });
}
