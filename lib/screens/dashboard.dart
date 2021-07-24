// system imports
import 'package:fintech_app/providers/notification_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// local imports
import './tabs/home_tab.dart';
import './tabs/notification_tab.dart';
import './tabs/profile_tab.dart';

class Dashboard extends StatelessWidget {
  // variable holds the tabs widgets
  final List<Widget> _tabs = [HomeTab(), NotificationTab(), UserProfileTab()];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: CupertinoNavigationBar(
      //   backgroundColor: Color(0xffFF3F00),
      //   leading: Text(
      //     "Dashboard",
      //     style: TextStyle(
      //         fontSize: 19, fontWeight: FontWeight.w400, color: Colors.white),
      //   ),
      // ),
      child: SafeArea(
        child: Scaffold(
          body: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              onTap: (int index){
                if(index == 2){
                  Navigator.pushNamed(context, "/notification");
                }
              },
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
            tabBuilder: (BuildContext context, int index) {
              return CustomScrollView(
                slivers: [
                  CupertinoSliverNavigationBar(
                    largeTitle: Text(
                      "DashBoard",
                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                    ),
                    trailing: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        // await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushNamed("/addcard");
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            CupertinoIcons.add_circled_solid,
                            color: CupertinoTheme.of(context).primaryColor,
                          ),
                          Text("AddCard"),
                        ],
                      ),
                    ),
                  ),
                  SliverList(delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return HomeTab();
                  },
                  childCount: 1
                  ))
                ],
              );

              // _tabs[index];
            },
          ),
        ),
      ),
    );
  }
}
