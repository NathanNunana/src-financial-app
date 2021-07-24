import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeePaymentPage extends StatelessWidget {
  final String? logo;
  final String? pageTitle;
  FeePaymentPage({this.logo, this.pageTitle});

  Widget _buildTtextField(String title, TextInputType type) {
    return CupertinoTextField(
      keyboardType: type,
      padding: EdgeInsets.all(15),
      placeholder: title,
      placeholderStyle: TextStyle(fontSize: 16, color: Colors.black54),
      decoration: BoxDecoration(
          border: Border.all(width: 0.42),
          borderRadius: BorderRadius.circular(9)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // backgroundColor: Colors.black.withOpacity(.5),
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          pageTitle.toString(),
          // style: TextStyle(color: Colors.white),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 50, left: 50, top: 20),
              height: 200,
              child: Image.asset(
                logo.toString(),
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.softLight,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    _buildTtextField("Card Number", TextInputType.number),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // _buildTtextField("Program", TextInputType.text),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // _buildTtextField("Level", TextInputType.number),
                    SizedBox(
                      height: 15,
                    ),
                    _buildTtextField("Amount", TextInputType.number),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // _buildTtextField("Payment Method", TextInputType.text),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            Container(
            // height: 110,
            padding: EdgeInsets.all(9.0),
            decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(3, 3))
          ],
            ),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 242,
                  height: 52,
                  child: CupertinoButton(
                    color: Color(0xff628395),
                    child: Text("Details"),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 73,
                  height: 52,
                  child: CupertinoButton(
                    padding: EdgeInsets.all(0.0),
                    color: Color(0xffFF3F00),
                    child: Icon(CupertinoIcons.arrow_right),
                    onPressed: () {},
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
          ],
            ),
          )
          ],
        ),
      ),
    );
  }
}
