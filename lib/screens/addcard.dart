import 'package:fintech_app/providers/card_provider.dart';
import 'package:fintech_app/widget/credit_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String cardNum = '';

  String indexNum = '';

  String method = '';

  void _showSelectDialog(int index) {
    showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("Would you like to select this card?"),
            content: Text("This card will be used for all your transactions"),
            actions: [
              CupertinoDialogAction(
                child: Text("Do'nt Allow"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                child: Text("Allow"),
                onPressed: () {
                  setState(() {
                    context.read<CardProvider>().activeCreditCard = index;
                    Navigator.pop(context);
                  });
                },
              )
            ],
          );
        });
  }

  _showDialog() {
    showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Container(
            alignment: Alignment.center,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CupertinoTheme.of(context).barBackgroundColor,
                ),
                width: 300,
                height: 330,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    // Container(
                    //     margin: EdgeInsets.symmetric(horizontal: 25),
                    //     child: Text(
                    //       "SELECT THE CARD TYPE",
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.w800,
                    //           color: CupertinoTheme.of(context).primaryColor),
                    //     )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // margin: EdgeInsets.symmetric(horizontal: 10),
                      // padding: EdgeInsets.all(5),
                      height: 60,
                      child: CupertinoPicker(
                          itemExtent: 32.0,
                          looping: true,
                          onSelectedItemChanged: (int index) {
                            method =
                                context.read<CardProvider>().cardTypes[index];
                          },
                          children: List.generate(
                              context.read<CardProvider>().cardTypes.length,
                              (index) => Center(
                                    child: new Text(
                                      context
                                          .read<CardProvider>()
                                          .cardTypes[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                  ))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: CupertinoTextField(
                          onChanged: (String val) {
                            setState(() {
                              cardNum = val;
                            });
                          },
                          keyboardType: TextInputType.text,
                          padding: EdgeInsets.all(15),
                          placeholder: "Enter account number or mobile number",
                          placeholderStyle: TextStyle(fontSize: 16),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.42, color: Colors.blue),
                              borderRadius: BorderRadius.circular(9)),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: CupertinoTextField(
                          onChanged: (String val) {
                            setState(() {
                              indexNum = val;
                            });
                          },
                          keyboardType: TextInputType.text,
                          padding: EdgeInsets.all(15),
                          placeholder: "Enter your index number",
                          placeholderStyle: TextStyle(fontSize: 16),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.42, color: Colors.blue),
                              borderRadius: BorderRadius.circular(9)),
                        )),
                    SizedBox(
                      height: 30,
                    ),

                    CupertinoButton.filled(
                      onPressed: () {
                        if (cardNum.isEmpty) {
                          setState(() {
                            context.read<CardProvider>().createCard(
                                cardNum = "*** **** **** *****",
                                method,
                                indexNum);
                            Navigator.pop(context);
                          });
                        } else {
                          setState(() {
                            context
                                .read<CardProvider>()
                                .createCard(cardNum, method, indexNum);
                            Navigator.pop(context);
                          });
                        }
                      },
                      child: Text("Add Card"),
                    )
                  ],
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Add Card"),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0;
                    i < context.read<CardProvider>().cards.length;
                    i++)
                  GestureDetector(
                    onTap: () => _showSelectDialog(i),
                    child: CreditCard(i),
                  ),

                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 20),
                //   child: Text("Create Card", style: TextStyle(color: CupertinoTheme.of(context).primaryColor),)),
                GestureDetector(
                  onTap: () => _showDialog(),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: CupertinoTheme.of(context).primaryColor,
                            style: BorderStyle.solid)),
                    child: Center(
                      child: Icon(
                        CupertinoIcons.add,
                        size: 40,
                      ),
                      // child:
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
