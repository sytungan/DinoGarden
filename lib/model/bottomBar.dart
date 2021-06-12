import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BottomBar extends StatefulWidget {
  Function onPressed;
  bool bottomIcons;
  String text;
  IconData icons;
  final String id;
  final String gardenName;
  BottomBar(
      {
        @required this.id,
        @required this.gardenName,
        @required this.onPressed,
      @required this.bottomIcons,
      @required this.icons,
      @required this.text});
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onPressed,
        child: widget.bottomIcons == true
            ? Container(
                decoration: BoxDecoration(
                  color: HexColor("#01AA4F").withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: Row(
                  children: <Widget>[
                    Icon(
                      widget.icons,
                      color: HexColor("#01AA4F"),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      widget.text,
                      style: TextStyle(
                          color: HexColor("#01AA4F"),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              )
            : Icon(widget.icons));
  }
}
