import "dart:convert";

import 'package:fintech_app/providers/user.dart';
import 'package:fintech_app/screens/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class StackPayment extends StatefulWidget {
  @override
  _StackPaymentState createState() => _StackPaymentState();
}

class _StackPaymentState extends State<StackPayment> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  bool isLoading = false;
  String url = '';
  void generateLink() async {
    setState(() {
      isLoading = true;
    });
    final _endpoint =
        Uri.parse("https://api.paystack.co/transaction/initialize");
    var provider = context.read<UserProvider>();
    try {
      var respond = await http.post(_endpoint, headers: {
        'Authorization': provider.secreteKey,
        // 'Content-Type': 'application/json'
      }, body: {
        "email": provider.user.email,
        "amount": _controller2.text
      });
      print('Response Code: ${respond.statusCode}');
      print('Response Body: ${respond.body}');
      var body = jsonDecode(respond.body);

      Navigator.pushReplacement(context,
          CupertinoPageRoute(builder: (_) => RenderStackPay(body)));
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text("Quick Pay"),
          ),
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.all(10),
                    child: Column(
              children: [
                SizedBox(
              height: 20,
                ),
                CupertinoTextField(
                  controller: _controller1
                  ,
              keyboardType: TextInputType.number,
              padding: EdgeInsets.all(15),
              placeholder: 'Enter Card Number',
              placeholderStyle: TextStyle(fontSize: 16, color: Colors.black54),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.42, color: Colors.blue),
                  borderRadius: BorderRadius.circular(9)),
                ),
                SizedBox(
              height: 20,
                ),
                CupertinoTextField(
                  controller: _controller2,
              keyboardType: TextInputType.number,
              padding: EdgeInsets.all(15),
              placeholder: 'Enter amount',
              placeholderStyle: TextStyle(fontSize: 16, color: Colors.black54),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.42, color: Colors.blue),
                  borderRadius: BorderRadius.circular(9)),
                ),
                SizedBox(
              height: 20,
                ),
                CupertinoButton.filled(
              child: isLoading? CupertinoActivityIndicator() :Text("Continue"),
              onPressed: generateLink,
                ),
                
              ],
                    ),
                  ),
            )),
      ),
    );
  }
}
