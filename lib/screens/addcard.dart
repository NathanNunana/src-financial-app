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

  _showDialog() {
    showCupertinoDialog(
        context: context,
        builder: (_) {
          return Container(
            alignment: Alignment.center,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
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
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(5),
                      child: CupertinoPicker(
                          itemExtent: 45.0,
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
                                      style: TextStyle(color: Colors.black54),
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
                          placeholderStyle:
                              TextStyle(fontSize: 16, color: Colors.black54),
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
                          placeholderStyle:
                              TextStyle(fontSize: 16, color: Colors.black54),
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
                        context
                            .read<CardProvider>()
                            .createCard(cardNum, method, indexNum);
                        Navigator.pop(context);
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
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: context.read<CardProvider>().cards.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          GestureDetector(
                              onTap: () async {
                                showCupertinoDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (_) {
                                      return CupertinoAlertDialog(
                                        title: Text(
                                            "Would you like to select this card?"),
                                        content: Text(
                                            "This card will be used for all your transactions"),
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
                                              context
                                                  .read<CardProvider>()
                                                  .activeCreditCard = index;
                                              // Navigator.of(context).pop();
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      );
                                    });
                              },
                              child: CreditCard(index)),
                        ],
                      );
                    }),
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 20),
                //   child: Text("Create Card", style: TextStyle(color: CupertinoTheme.of(context).primaryColor),)),
                GestureDetector(
                  onTap: () {
                    _showDialog();
                  },
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
