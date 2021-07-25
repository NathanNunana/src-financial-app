import 'package:fintech_app/providers/card_provider.dart';
import 'package:fintech_app/screens/addcard.dart';
import 'package:fintech_app/widget/credit_card.dart';
import 'package:fintech_app/widget/smart_pay_option.dart';
import 'package:fintech_app/widget/transaction_records.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var card = context.read<CardProvider>();
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text(
              "DashBoard",
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
            ),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                // await FirebaseAuth.instance.signOut();
                // Navigator.of(context).pushNamed("/addcard");
                Navigator.push(context, CupertinoPageRoute(builder: (_)=>AddCard()));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.plus_app_fill,
                    color: CupertinoTheme.of(context).primaryColor,
                  ),
                  Text("AddCard"),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: 
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  CreditCard(card.activeCard),
                  SmartPayOptions(),
                  TransactionRecords()
                ],
              ),
            );
          }, childCount: 1))
        ],
      ),
    );
  }
}
