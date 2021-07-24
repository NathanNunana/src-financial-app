import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../utilities/text_styles.dart';

class LoginPage extends StatelessWidget {
  Widget _buildTtextField(String title) {
    return CupertinoTextField(
      padding: EdgeInsets.all(15),
      placeholder: title,
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return CupertinoButton(
      minSize: 20,
      color: CupertinoTheme.of(context).primaryColor,
      child: Container(child: Icon(CupertinoIcons.arrow_right)),
      onPressed: () {
        Navigator.pushReplacementNamed(context, "/dashboard");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      child: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome Back!\nLogin Now",
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.w500),
            ),
            Container(
                margin: EdgeInsets.only(top: 60),
                child: _buildTtextField("Index Number")),
            Container(
                margin: EdgeInsets.only(top: 40),
                child: _buildTtextField("Password")),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 85),
                    child: _buildSubmitButton(context)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
