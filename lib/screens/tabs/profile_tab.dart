import 'package:fintech_app/providers/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Profile"),
        ),
        child: ListView(
          children: [
            Container(
              height: 190,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Positioned.fill(
                  child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white12,
                      child: Icon(
                        CupertinoIcons.person_circle_fill,
                        size: 180,
                        color: Colors.grey[400],
                      )),
                ),
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  context
                      .read<UserProvider>()
                      .user
                      .name
                      .toString()
                      .toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
                )),
            Container(
                alignment: Alignment.center,
                child: Text(
                  context.read<UserProvider>().user.indexNumber.toString(),
                  style: TextStyle(fontSize: 15),
                )),
            Container(
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: CupertinoButton.filled(
                padding: EdgeInsets.all(3.0),
                onPressed: () {},
                child: Text("Edit Profile"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          CupertinoIcons.settings,
                          color: Colors.white,
                        ),
                      ),
                      title: Text("Settings"),
                      trailing: Icon(CupertinoIcons.chevron_right),
                    ),
                    ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          CupertinoIcons.doc_plaintext,
                          color: Colors.white,
                        ),
                      ),
                      title: Text("About"),
                      trailing: Icon(CupertinoIcons.chevron_right),
                    ),
                    ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          CupertinoIcons.info,
                          color: Colors.white,
                        ),
                      ),
                      title: Text("Help"),
                      trailing: Icon(CupertinoIcons.chevron_right),
                    ),
                    ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          CupertinoIcons.person_3,
                          color: Colors.white,
                        ),
                      ),
                      title: Text("Invite Friends"),
                      trailing: Icon(CupertinoIcons.chevron_right),
                    ),
                    ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          CupertinoIcons.power,
                          color: Colors.white,
                        ),
                      ),
                      title: Text("Logout"),
                      trailing: Icon(CupertinoIcons.chevron_right),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
