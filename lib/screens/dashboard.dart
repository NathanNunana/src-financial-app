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
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          activeColor: CupertinoTheme.of(context).primaryColor,
          backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
            ),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.bell)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_alt)),
          ]),
      tabBuilder: (context, index) {
        late Widget page;
        if (index == 0) {
          page = CupertinoTabView(builder: (_) => HomeTab());
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
    );
  }
}
