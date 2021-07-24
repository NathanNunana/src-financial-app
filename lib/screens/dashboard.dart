// system imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// local imports
import './tabs/home_tab.dart';
import './tabs/notification_tab.dart';
import './tabs/profile_tab.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Scaffold(
          body: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
                activeColor: CupertinoTheme.of(context).primaryColor,
                backgroundColor: Color(0xffFFFFFF),
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home),
                  ),
                  BottomNavigationBarItem(
                      icon: Stack(
                    children: [
                      // Positioned(
                      //   right: 0,
                      //   child: CircleAvatar(
                      //     radius: 7.5,
                      //     // backgroundColor: CupertinoTheme.of(context).primaryColor,
                      //     // child: Text(context.read<NotificationProvider>().notifications.length.toString(), style: TextStyle(fontSize: 11, color: Colors.white),),
                      //   ),
                      // ),
                      Icon(CupertinoIcons.bell),
                    ],
                  )),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.person_alt)),
                ]),
            tabBuilder: (context, index) {
              late Widget page;
              if (index == 0) {
                page = CupertinoTabView(
                  builder: (_) => HomeTab());
              } else if (index == 1) {
                page = CupertinoTabView(
                  builder: (_) => NotificationTab(),
                );
              } else if (index == 2) {
                page = CupertinoTabView(
                  builder: (_) => UserProfileTab(),
                );
              }
              return page;
            },
          ),
        ),
      ),
    );
  }
}
