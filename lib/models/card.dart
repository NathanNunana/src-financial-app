import 'package:flutter/cupertino.dart';

class CardModel {
  String cardNumber;
  Color cardColor;
  String cardType;
  DateTime date;
  CardModel(this.cardNumber, this.cardColor, this.cardType):
  date = DateTime.now();
}