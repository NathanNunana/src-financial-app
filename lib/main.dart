// system imports
import 'package:fintech_app/providers/card_provider.dart';
import 'package:fintech_app/providers/notification_provider.dart';
import 'package:fintech_app/providers/transaction_provider.dart';
import 'package:fintech_app/providers/user.dart';
import 'package:fintech_app/services/tranaction_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// local imports
import './screens/dashboard.dart';
import './screens/login_page.dart';
import './screens/tabs/notification_tab.dart';
import './screens/signup_page.dart';
import './screens/addcard.dart';
import './screens/tabs/profile_tab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ), 
        ChangeNotifierProvider(
          create: (_) => CardProvider(),
        )
      ],
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(
            brightness: Brightness.light,
            // barBackgroundColor: Color(0xffFF3F00),
            // primaryColor: Colors.white),
        ),
        routes: {
          "/": (_) => LoginPage(),
          "/login": (_) => LoginPage(),
          "/signup": (_) => SignupPage(),
          "/dashboard": (_) => Dashboard(),
          "/notification": (_) => NotificationTab(),
          "/addcard": (_) => AddCard(),
          "/profile" : (_) => UserProfileTab(),
          "/stackpay": (_) => StackPayment()
        },
      ),
    );
  }
}
