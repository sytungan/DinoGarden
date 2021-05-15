import 'package:flutter/material.dart';

AppBar tabBar() {
  return AppBar(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      elevation: 0,
      title: Text(
        'Dash Board',
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Color.fromRGBO(44, 110, 73, 1),
            fontFamily: 'Mulish',
            fontSize: 30,
            letterSpacing:
                0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1),
      ));
}
