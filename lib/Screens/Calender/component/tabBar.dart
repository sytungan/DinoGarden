import 'package:flutter/material.dart';


AppBar tabBar(context) {
  return AppBar(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Color(0xff2C6E49),
        onPressed: (){
          // Route route = MaterialPageRoute(builder: (context) => dashboardScrean());
          // Navigator.push(context, route);
          Navigator.pop(context);
        },
      ),
      title: Text(
        'Calender',
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
