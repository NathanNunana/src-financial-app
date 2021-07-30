// system imports
import 'package:fintech_app/providers/card_provider.dart';
import 'package:fintech_app/providers/notification_provider.dart';
import 'package:fintech_app/providers/transaction_provider.dart';
import 'package:fintech_app/providers/user.dart';
import 'package:fintech_app/services/authentication.dart';
import 'package:fintech_app/services/tranaction_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
import './screens/about.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
} 

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
        ),
      ],
      child: CupertinoApp(
          debugShowCheckedModeBanner: false,
          theme: CupertinoThemeData(
              // brightness: Brightness.light,
              // barBackgroundColor: Color(0xffFF3F00),
              // primaryColor: Colors.white),
          ),
          routes: {
            "/": (_) => StartUp(),
            "/login": (_) => LoginPage(),
            "/signup": (_) => SignupPage(),
            "/dashboard": (_) => Dashboard(),
            "/notification": (_) => NotificationTab(),
            "/addcard": (_) => AddCard(),
            "/profile" : (_) => UserProfileTab(),
            "/stackpay": (_) => StackPayment(),
            "/about": (_) => AboutPage(),
          },
        )
    );
  }
}



class StartUp extends StatefulWidget{
  @override
  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // initializing flutter fire
        future: _initialization,
        builder:(context, snapshot) {
            // check for errors
            if(snapshot.hasError){
              return InitializationError();
            }
            // Once complete show application
            if(snapshot.connectionState == ConnectionState.done){
              return LoginPage();
            }
            // show somethings while waiting for initialization to complete
            return Center(child: CupertinoActivityIndicator());
        } 
      );

  }
}


class InitializationError extends StatelessWidget{
  @override 
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("Error"),),);
  }
}