import 'package:flutter/material.dart';

class NumbersListProvider extends ChangeNotifier {
  List<int> numbers = [1];

  void add() {
    int last = numbers.last;
    String val = '';
    numbers.add(last + 1);

    notifyListeners();
  }

  getVal() {
    if (numbers.last >= 10) {
      if (numbers.last >= 20) {
        return 'This is more than 20';
      }
      return 'This Number is Greter than 10';
    } else {
      return 'This is lessthan 10';
    }
  }
}
