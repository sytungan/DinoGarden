import 'package:flutter/material.dart';

BottomNavigationBar BottomBar() {
  return BottomNavigationBar(
    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
    elevation: 0,
    fixedColor: Color(0xff01AA4F),
    items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.radio_button_checked), title: Text("Something")),
      BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text("Report")),
      BottomNavigationBarItem(
          icon: Icon(Icons.person), title: Text("Something")),
    ],
  );
}
