// system imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// local imports
import './screens/dashboard.dart';
import './screens/login_page.dart';
import './screens/payment_page.dart';
import './screens/signup_page.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: LoginPage(),
      routes: {
        "/login": (_)=>LoginPage(),
        "/signup": (_)=>SignupPage(),
        "/dashboard": (_)=>Dashboard(),
        "/payment": (_)=>FeePaymentPage(),
      }, 
    );
  }
}