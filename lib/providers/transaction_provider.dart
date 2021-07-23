import 'package:flutter/cupertino.dart';

import '../models/transaction_model.dart';

class TransactionProvider extends ChangeNotifier {
  List<Transaction> transactions = [
    Transaction(
        title: "School Dues",
        mode: "GCB Bank",
        amount: 1000,
        image: "assets/images/school.jpg"),
    Transaction(
        title: "SRC Dues",
        mode: "Mobile Money",
        amount: 50,
        image: "assets/images/src.jpg"),
    Transaction(
        title: "Resit",
        mode: "Vodafone Cash",
        amount: 100,
        image: "assets/images/resit.jpg")
  ];
  addTransaction({String? title, String? mode, int? amount, String? image}){
    var value = Transaction(
        title: title,
        mode: mode,
        amount: amount,
        image: image
      );
    transactions.add(value);
    notifyListeners();
  }
  deleteTransaction(int index){
    transactions.remove(index);
    notifyListeners();
  }
}
