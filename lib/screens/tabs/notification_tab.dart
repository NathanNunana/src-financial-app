import 'package:fintech_app/providers/notification_provider.dart';
import 'package:fintech_app/utilities/months.dart';
import 'package:fintech_app/widget/list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = context.read<NotificationProvider>();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Notification"),
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildBuilderDelegate((contex, index) {
              var date =
                  DateTime.parse(provider.notifications[index].date.toString());
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomListTile(
                    Container(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                            provider.notifications[index].image.toString())),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .60,
                          child: Text(
                            provider.notifications[index].title.toString(),
                            style: TextStyle(
                              color: CupertinoTheme.of(context).textTheme.textStyle.color,
                                fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                        ),
                        // SizedBox(width: 10,),
                        Container(
                          width: MediaQuery.of(context).size.width * .60,
                          child: Text(
                            provider.notifications[index].content.toString(),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: CupertinoTheme.of(context).textTheme.textStyle.color, fontSize: 14, ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Text(
                        '${CalcMonth().convertMonth(date.month)}, ${date.day.toString()}',
                        style: TextStyle(fontSize: 13, color: CupertinoTheme.of(context).textTheme.textStyle.color),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  )
                ],
              );
            }, childCount: provider.notifications.length))
          ],
        ),
      ),
    );
  }
}
