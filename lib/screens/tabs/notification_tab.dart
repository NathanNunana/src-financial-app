import 'package:fintech_app/providers/notification_provider.dart';
import 'package:fintech_app/utilities/months.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = context.read<NotificationProvider>();
    return ListView.builder(
        itemCount: provider.notifications.length,
        itemBuilder: (context, index) {
          var date =
              DateTime.parse(provider.notifications[index].date.toString());
          return Column(
            children: [
              ListTile(
                leading:
                    Image.asset(provider.notifications[index].image.toString()),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      provider.notifications[index].title.toString(),
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      provider.notifications[index].content.toString(),
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ],
                ),
                trailing: Text(
                    '${CalcMonth().convertMonth(date.month)}, ${date.day.toString()}'),
              ),
              Divider(thickness: 1,)
            ],
          );
        });
  }
}
