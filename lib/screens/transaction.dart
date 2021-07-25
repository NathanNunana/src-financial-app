
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class RenderStackPay extends StatelessWidget {
  final url;
  RenderStackPay(this.url);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Payment"),
        ),
          child: SafeArea(
        child: WebView(
          userAgent: 'ormanel',
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      )),
    );
  }
}
