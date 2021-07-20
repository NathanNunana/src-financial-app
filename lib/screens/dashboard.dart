import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/credit_card.dart';
import '../widget/smart_pay_option.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color(0xffFF3F00),
        leading: Text(
          "Dashboard",
          style: TextStyle(
              fontSize: 19, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
  
      child: Column(
        children: [
          CreditCard(),
          SmartPayOptions()
        ],
      ),
    );
  }
}
