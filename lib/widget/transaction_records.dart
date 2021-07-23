import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/transaction_provider.dart';

class TransactionRecords extends StatelessWidget {
  String _convertMonth(int num) {
    String date = "";
    switch (num) {
      case 1:
        date = "Jan";
        break;
      case 2:
        date = "Feb";
        break;
      case 3:
        date = "March";
        break;
      case 4:
        date = "April";
        break;
      case 5:
        date = "May";
        break;
      case 6:
        date = "June";
        break;
      case 7:
        date = "July";
        break;
      case 8:
        date = "Aug";
        break;
      case 9:
        date = "Sept";
        break;
      case 10:
        date = "Oct";
        break;
      case 11:
        date = "Nov";
        break;
      case 12:
        date = "Dec";
        break;
    }
    return date;
  }

  Widget _buildCustomListTile(BuildContext context, int index) {
    var provider = context.read<TransactionProvider>().transactions[index];
    return Column(
      children: [
        SizedBox(
          height: 11,
        ),
        Stack(
          children: [
            Container(
              height: 64,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: (index % 2 == 0)
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
              child: ListTile(
                leading: Container(
                  height: 45,
                  width: 45,
                  child: Image.asset(
                    provider.image.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      provider.title.toString(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      provider.mode.toString(),
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '-GHS${provider.amount.toString()}',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${_convertMonth(provider.date.month)}, ${provider.date.day.toString()}',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
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
                          context
                              .read<TransactionProvider>()
                              .deleteTransaction(index);
                        },
                        child: Icon(
                          Icons.cancel,
                          color: Color(0xffFF3F00),
                          size: 25,
                        ))))
          ],
        ),
        SizedBox(
          height: 6,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transactions",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text("See All",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xffFF3F00),
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 9),
                    child: Text(
                      "RECENT",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffFF3F00),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ),
          ListView.builder(
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "OLDER",
              style: TextStyle(
                fontSize: 12,
                color: Color(0xffFF3F00),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
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
                  // if(count == 0){
                  //   return Container(
                  //     height: 150,
                  //     color: Colors.red,
                  //   );
                  // }else{
                    return Container();
                  // }
                }
              }),
        ],
      ),
    );
  }
}
