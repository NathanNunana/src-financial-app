import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 20.0,left: 20.0, top: 30, bottom: 29),
          height: 150,
          decoration: BoxDecoration(
              color: Color(0xff628395),
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
            child: Text(
              "Simple",
              style: TextStyle(fontSize: 13, color: Colors.white54),
            )),
        Positioned(
          top: 85,
          left: 143,
          child: Text(
            "**** **** *** 6784",
            style: TextStyle(fontSize: 20, color: Color(0xffFFFFFF)),
          ),
        ),
        Positioned(
          top: 47,
          right: 40,
          child: Stack(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xffE11313),
                radius: 9,
              ),
              Transform.translate(
                  offset: Offset(9, 0),
                  child: CircleAvatar(
                    backgroundColor: Color(0xffFF9100).withOpacity(.5),
                    radius: 9,
                  ))
            ],
          ),
        ),
        Positioned(
            bottom: 40,
            left: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Card Number Holder",
                  style: TextStyle(fontSize: 13, color: Colors.white54),
                ),
                Text("DZINEDU KING DAVID",
                    style: TextStyle(fontSize: 17, color: Color(0xffFFFFFF)))
              ],
            )),
        Positioned(
            bottom: 40,
            right: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Expiry Date",
                    style: TextStyle(fontSize: 13, color: Colors.white54)),
                Text("02/23",
                    style: TextStyle(fontSize: 17, color: Color(0xffFFFFFF)))
              ],
            )),
      ],
    );
  }
}
