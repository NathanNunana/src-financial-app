class Transaction {
  String? title;
  String? mode;
  int? amount;
  DateTime date;
  String? image;
  Transaction({this.title, this.mode, this.amount, this.image})
  : date = DateTime.now()
  ;
}