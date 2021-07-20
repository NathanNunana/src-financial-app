import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          height: 152,
          decoration: BoxDecoration(
              color: Color(0xff628395),
              borderRadius: BorderRadius.circular(15)),
        ),
        Positioned(
            left: 40,
            top: 52,
            child: Text(
              "Simple",
              style: TextStyle(fontSize: 15, color: Colors.white54),
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
          top: 52,
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
            bottom: 52,
            left: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Card Number Holder",
                  style: TextStyle(fontSize: 15, color: Colors.white54),
                ),
                Text("DZINEDU KING DAVID",
                    style: TextStyle(fontSize: 20, color: Color(0xffFFFFFF)))
              ],
            )),
        Positioned(
            bottom: 52,
            right: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Expiry Date",
                    style: TextStyle(fontSize: 15, color: Colors.white54)),
                Text("02/23", style: TextStyle(fontSize: 20, color: Color(0xffFFFFFF)))
              ],
            )),
      ],
    );
  }
}
