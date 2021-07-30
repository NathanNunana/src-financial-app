import 'package:fintech_app/utilities/months.dart';
import 'package:fintech_app/widget/list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/transaction_provider.dart';

class TransactionRecords extends StatefulWidget {
  @override
  _TransactionRecordsState createState() => _TransactionRecordsState();
}

class _TransactionRecordsState extends State<TransactionRecords> {
  Widget _buildCustomListTile(BuildContext context, int index) {
    var provider = context.read<TransactionProvider>().transactions[index];
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 64,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: (index % 2 != 0)
                      ? BorderRadius.only(
                          bottomLeft: Radius.circular(9),
                          bottomRight: Radius.circular(9))
                      : BorderRadius.only(
                          topLeft: Radius.circular(9),
                          topRight: Radius.circular(9)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: Offset(0, 3))
                  ]),
              child: CustomListTile(
                Container(
                  height: 45,
                  width: 45,
                  child: Image.asset(
                    provider.image.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      provider.title.toString(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: CupertinoTheme.of(context).textTheme.textStyle.color),
                    ),
                    Text(
                      provider.mode.toString(),
                      style: TextStyle(fontSize: 12, color: CupertinoTheme.of(context).textTheme.textStyle.color),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '-GHS${provider.amount.toString()}',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CupertinoTheme.of(context).textTheme.textStyle.color),
                    ),
                    Text(
                      '${CalcMonth().convertMonth(provider.date.month)}, ${provider.date.day.toString()}',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: CupertinoTheme.of(context).textTheme.textStyle.color),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                right: 20,
                child: Transform.translate(
                    offset: Offset(0, -12.5),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            context
                              .read<TransactionProvider>()
                              .deleteTransaction(index);
                          });
                        },
                        child: Icon(
                          Icons.cancel,
                          color: Color(0xffFF3F00),
                          size: 25,
                        ))))
          ],
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 19, right: 19, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Transactions",
                  style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: CupertinoTheme.of(context).textTheme.textStyle.color),
                ),
                (context.read<TransactionProvider>().transactions.length > 0) ? Container(
                    margin: EdgeInsets.only(top: 9),
                    child: Text(
                      "RECENT",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffFF3F00),
                        fontWeight: FontWeight.bold,
                      ),
                    )): Container(),
              ],
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.all(2),
              shrinkWrap: true,
              itemCount:
                  context.read<TransactionProvider>().transactions.length,
              itemBuilder: (context, index) {
                // int count = 0;
                var date = DateTime.now();
                var transactionDate = context
                    .read<TransactionProvider>()
                    .transactions[index]
                    .date;
                bool condition = date.month == transactionDate.month &&
                    date.year == transactionDate.year;
                print(condition);
                if (condition) {
                  return _buildCustomListTile(context, index);
                } else {
                  // if(count == 0){
                  //   return Container();
                  // }else{
                    return Container();
                  // }
                }
              }),
          (context.read<TransactionProvider>().transactions.length > 0)? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "OLDER",
              style: TextStyle(
                fontSize: 12,
                color: Color(0xffFF3F00),
                fontWeight: FontWeight.bold,
              ),
            ),
          ):Container(),
          ListView.builder(
            padding: EdgeInsets.all(2),
              shrinkWrap: true,
              itemCount:
                  context.read<TransactionProvider>().transactions.length,
              itemBuilder: (context, index) {
                // int count = 0;
                var date = DateTime.now();
                var transactionDate = context
                    .read<TransactionProvider>()
                    .transactions[index]
                    .date;
                bool condition = (date.month - 1 == transactionDate.month ||
                        date.month - 2 == transactionDate.month) &&
                    date.year == transactionDate.year;
                if (condition) {
                  // count++;
                  return _buildCustomListTile(context, index);
                } else {
                    return Container();
                  // }
                }
              }),
        ],
      ),
    );
  }
}
