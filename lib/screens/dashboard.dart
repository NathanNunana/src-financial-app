import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter_icons/flutter_icons.dart';

import './tabs/home_tab.dart';
import './tabs/notification_tab.dart';
import './tabs/profile_tab.dart';

class Dashboard extends StatelessWidget {
  final List<Widget> _tabs = [
    HomeTab(),
    NotificationTab(), 
    UserProfileTab()
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color(0xffFF3F00),
        leading: Text(
          "Dashboard",
          style: TextStyle(
              fontSize: 19, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        trailing: Icon(Icons.menu, color: Colors.white,),
      ),
  
      child: SafeArea(
        child: Scaffold(
          body: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              inactiveColor: Color(0xffFF3F00).withOpacity(.5),
              activeColor: Color(0xffFF3F00),
              backgroundColor: Color(0xffFFFFFF),
              items: [
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),),
              BottomNavigationBarItem(icon: Icon(Icons.notifications_outlined)),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.person)),
            ]),
            tabBuilder: (BuildContext context, int index){
              return _tabs[index];
            },
          ),
        ),
      ),
    );
  }
}
