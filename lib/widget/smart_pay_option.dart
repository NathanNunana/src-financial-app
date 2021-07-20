import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartPayOptions extends StatelessWidget {
  Widget _buildItems(String title, Color color, Icon icon) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(radius: 21.5, backgroundColor: color, child: icon,),
        SizedBox(height: 9,),
        Text(title)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      // padding: EdgeInsets.all(28.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0,3)
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Smart Pay"),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  
                children: [
                  _buildItems("School fees", Color(0xffFF3F00), Icon(CupertinoIcons.person_solid, color: Colors.white,)),
                  SizedBox(width: 8,),
                  _buildItems("SRC Dues", Color(0xff0DB17F), Icon(CupertinoIcons.money_dollar, color: Colors.white,)),
                  SizedBox(width: 8,),
                  _buildItems("Resit", Color(0xffB11998), Icon(CupertinoIcons.pencil, color: Colors.white,)),
                  SizedBox(width: 8,),
                  _buildItems("Transcript", Color(0xff191EB1), Icon(CupertinoIcons.doc, color: Colors.white,)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
