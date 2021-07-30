import 'package:fintech_app/screens/payment_page.dart';
import 'package:fintech_app/screens/transaction.dart';
import 'package:fintech_app/services/tranaction_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartPayOptions extends StatefulWidget {
  @override
  _SmartPayOptionsState createState() => _SmartPayOptionsState();
}

class _SmartPayOptionsState extends State<SmartPayOptions> {
  Widget _buildItems(String title, Color color, Icon icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 22.5,
          backgroundColor: color,
          child: icon,
        ),
        SizedBox(
          height: 9,
        ),
        Container(
            width: 43,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: CupertinoTheme.of(context).textTheme.textStyle.color),
            ))
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
            color: CupertinoTheme.of(context).barBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(0, 3))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Smart Pay",
                style: TextStyle(
                    color:
                        CupertinoTheme.of(context).textTheme.textStyle.color),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 1,
                color: CupertinoTheme.of(context).textTheme.textStyle.color,
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                // builder: (_) => FeePaymentPage(
                                //       logo: "assets/images/school.jpg",
                                //       pageTitle: "School Fees",
                                // ))
                                builder: (_) => StackPayment()));
                      },
                      child: _buildItems(
                          "School fees",
                          Color(0xffFF3F00),
                          Icon(
                            CupertinoIcons.person_solid,
                            color: Colors.white,
                          ))),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => StackPayment(),
                              // builder: (_) => FeePaymentPage(
                              //       logo: "assets/images/src.jpg",
                              //       pageTitle: "SRC Dues",
                              //     )
                            ));
                      },
                      child: _buildItems(
                          "SRC Dues",
                          Color(0xff0DB17F),
                          Icon(
                            CupertinoIcons.money_dollar,
                            color: Colors.white,
                          ))),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => StackPayment(),
                              // builder: (_) => FeePaymentPage(
                              //       logo: "assets/images/src.jpg",
                              //       pageTitle: "SRC Dues",
                              //     )
                            ));
                      },
                      child: _buildItems(
                          "Resit",
                          Color(0xffB11998),
                          Icon(
                            CupertinoIcons.pencil,
                            color: Colors.white,
                          ))),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, "/stackpay");
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => StackPayment(),
                              // builder: (_) => FeePaymentPage(
                              //       logo: "assets/images/src.jpg",
                              //       pageTitle: "SRC Dues",
                              //     )
                            ));
                      },
                      child: _buildItems(
                          "Transcript",
                          Color(0xff191EB1),
                          Icon(
                            CupertinoIcons.doc,
                            color: Colors.white,
                          ))),
                ],
              ),
              SizedBox(
                height: 14,
              )
            ],
          ),
        ),
      ),
    );
  }
}
