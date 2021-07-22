import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionRecords extends StatelessWidget {
  final Map<int, Map<String, String>> transactions = {
    1: {
      "type": "School fees",
      "mode": "GCB Bank",
      "amount": "1000.00",
      "date": "Jan 1",
      "logo": "assets/images/school.jpg"
    },
    2: {
      "type": "SRC Dues",
      "mode": "Mobile Money",
      "amount": "50.00",
      "date": "Jan 2",
      "logo": "assets/images/src.jpg"
    },
    3: {
      "type": "Resit",
      "mode": "Vodafone Cash",
      "amount": "100.00",
      "date": "Dec 31",
      "logo": "assets/images/resit.jpg"
    },
  };

  Widget _buildCustomListTile(MapEntry<int, Map<String, String>> _tran) {
    Map<String, String> _item = _tran.value;
    return Column(
      children: [
        Container(
          height: 64,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: (_tran.key % 2 == 0)
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
                _item["logo"].toString(),
                fit: BoxFit.cover,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _item["type"].toString(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  _item["mode"].toString(),
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '-GHS${_item["amount"].toString()}',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  _item["date"].toString(),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
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
                      "Recent Transactions",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
              margin: EdgeInsets.only(top: 9, bottom: 9),
              child: Text(
                "TODAY",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xffFF3F00),
                  fontWeight: FontWeight.bold,
                ),
              )),
              ],
            ),
          ),
          
          Column(
            children: transactions.entries.map((e) {
              return _buildCustomListTile(e);
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "YESTERDAY",
              style: TextStyle(
                fontSize: 12,
                color: Color(0xffFF3F00),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
