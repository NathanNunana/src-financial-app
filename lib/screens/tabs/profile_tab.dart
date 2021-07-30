import 'package:fintech_app/providers/user.dart';
import 'package:fintech_app/screens/about.dart';
import 'package:fintech_app/widget/list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Profile"),
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildBuilderDelegate((context, index) {
              return Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 190,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Positioned.fill(
                        child: Icon(
                          CupertinoIcons.person_circle_fill,
                          size: 199,
                          color: Colors.grey[400],
                        ),
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
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 17),
                      )),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        context.read<UserProvider>().user.email.toString(),
                        style: TextStyle(fontSize: 15),
                      )),
                  Container(
                    // padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                    child: CupertinoButton.filled(
                      // padding: EdgeInsets.all(3.0),
                      onPressed: () {},
                      child: Text("Edit Profile"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomListTile(
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                CupertinoIcons.settings,
                                color: Colors.white,
                              ),
                            ),
                            Text("Settings", style: TextStyle(color: CupertinoTheme.of(context).textTheme.textStyle.color)),
                            Icon(CupertinoIcons.chevron_right),
                          ),
                          GestureDetector(
                            onTap: (){
                              // Navigator.pushNamed(context, "/about");
                              Navigator.push(context, CupertinoPageRoute(builder: (_)=>AboutPage()));
                            },
                            child: CustomListTile(
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(10),
                                child: Icon(
                                  CupertinoIcons.doc_plaintext,
                                  color: Colors.white,
                                ),
                              ),
                              Text("About", style: TextStyle(color: CupertinoTheme.of(context).textTheme.textStyle.color),),
                              Icon(CupertinoIcons.chevron_right),
                            ),
                          ),
                          CustomListTile(
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                CupertinoIcons.info,
                                color: Colors.white,
                              ),
                            ),
                            Text("Help", style: TextStyle(color: CupertinoTheme.of(context).textTheme.textStyle.color)),
                            Icon(CupertinoIcons.chevron_right),
                          ),
                          CustomListTile(
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                CupertinoIcons.person_3,
                                color: Colors.white,
                              ),
                            ),
                            Text("Invite Friends", style: TextStyle(color: CupertinoTheme.of(context).textTheme.textStyle.color)),
                            Icon(CupertinoIcons.chevron_right),
                          ),
                          CustomListTile(
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                CupertinoIcons.power,
                                color: Colors.white,
                              ),
                            ),
                            Text("Logout", style: TextStyle(color: CupertinoTheme.of(context).textTheme.textStyle.color)),
                            Icon(CupertinoIcons.chevron_right),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }, childCount: 1))
          ],
        ),
      ),
    );
  }
}
