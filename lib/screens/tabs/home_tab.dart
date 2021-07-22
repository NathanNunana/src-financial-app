import 'package:fintech_app/widget/credit_card.dart';
import 'package:fintech_app/widget/smart_pay_option.dart';
import 'package:fintech_app/widget/transaction_records.dart';
import 'package:flutter/cupertino.dart';


class HomeTab extends StatelessWidget{
  @override 
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
            children: [
              CreditCard(),
              SmartPayOptions(),
              TransactionRecords()
            ],
          ),
    );
  }
}