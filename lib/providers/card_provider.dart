import 'dart:math';

import 'package:fintech_app/models/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier{
  List<CardModel> cards = [
    CardModel("054 020 9195", Color(0xff625677), "Mobile Money"),
    // CardModel("346 765 23 879", Color(0xff628395), "Bank"),
  ];
  int activeCard = 0;
  createCard(String cardNum, String cardType, String indexNum){
    var val = CardModel(cardNum, Color.fromARGB(Random().nextInt(255), Random().nextInt(200),
            Random().nextInt(200), Random().nextInt(200)) ,cardType);
    cards.add(val);
    notifyListeners();
  }
}