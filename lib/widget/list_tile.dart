import 'package:flutter/cupertino.dart';

class CustomListTile extends StatefulWidget {
  final Widget leading;
  final Widget title;
  final Widget trailing;
  CustomListTile(this.leading, this.title, this.trailing);

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoTheme.of(context).barBackgroundColor,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              widget.leading,
              SizedBox(width: 17,),
              widget.title,
            ],
          ),
          widget.trailing
        ],
      ),
    );
  }
}
