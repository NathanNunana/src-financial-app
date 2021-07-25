import 'package:flutter/cupertino.dart';
import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  User user =
      User(name: "Kulewoshie Nathan", email: "kulewoshienathan@gmail.com");
  final secreteKey = 'Bearer sk_test_85d2fcc16ab847d070bc6e5bcd99a713de9a787b';
}
