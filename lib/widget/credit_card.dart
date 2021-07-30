import 'package:fintech_app/providers/card_provider.dart';
import 'package:fintech_app/providers/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreditCard extends StatelessWidget {
  final int index;
  CreditCard(this.index);
  @override
  Widget build(BuildContext context) {
  final user = context.read<UserProvider>().user;
  final card = context.read<CardProvider>().cards;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 20.0,left: 20.0, top: 30, bottom: 29),
          height: 170,
          decoration: BoxDecoration(

              color: card[index].cardColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: Offset(0, 3))
              ]),
        ),
        Positioned(
            left: 40,
            top: 47,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(CupertinoIcons.radiowaves_left, color: Colors.white, size: 25,),
                SizedBox(height: 20,),
                Text(
                  card[index].cardType,
                  style: TextStyle(fontSize: 13, color: Colors.white54),
                ),
              ],
            )),
        Positioned(
          top: 110,
          left: 40,
          child: Text(
            card[index].cardNumber,
            style: TextStyle(fontSize: 19, color: Color(0xffFFFFFF)),
          ),
        ),
        Positioned(
          top: 47,
          right: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xffE11313),
                    radius: 14,
                  ),
                  Transform.translate(
                      offset: Offset(14, 0),
                      child: CircleAvatar(
                        backgroundColor: Color(0xffFF9100).withOpacity(.5),
                        radius: 14,
                      ))
                ],

              ),
              Text("mastercard", style: TextStyle(fontSize: 10, color: Colors.white54),)
            ],
          ),
        ),
        Positioned(
            bottom: 45,
            left: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Card Number Holder",
                  style: TextStyle(fontSize: 12, color: Colors.white54),
                ),
                Text(user.name.toString().toUpperCase(),
                    style: TextStyle(fontSize: 15, color: Color(0xffFFFFFF)))
              ],
            )),
        Positioned(
            bottom: 45,
            right: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Expiry Date",
                    style: TextStyle(fontSize: 12, color: Colors.white54)),
                Text('${card[index].date.month}/${(card[index].date.year + 3)}',
                    style: TextStyle(fontSize: 15, color: Color(0xffFFFFFF)))
              ],
            )),
      ],
    );
  }
}
