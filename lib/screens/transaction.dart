import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RenderStackPay extends StatelessWidget {
  late final body;
  RenderStackPay(this.body);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Payment"),
        ),
        child: WebView(
          userAgent: 'Flutter;Web',
          initialUrl: body["data"]["authorization_url"],
          javascriptMode: JavascriptMode.unrestricted,
          // navigationDelegate: (navigation) {
            // if (navigation.url == url) {
            //   // verifyTransaction(reference);
            //   Navigator.of(context).pop(); //close webview
            // }
            // return NavigationDecision.navigate;
          // },
        ));
  }
}
