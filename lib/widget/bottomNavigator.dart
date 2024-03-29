import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dinogarden/model/bottomBar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../Login.dart';
import '../Signup.dart';
import '../Profile.dart';
import '../HomeScreen.dart';
import '../screens/Dashboard/index.dart';

Widget bottomNavigator(context, index, {userID = Null, userName = Null}) {
  BottomBar btm;
  return Stack(children: [
    Container(
      padding: EdgeInsets.only(left: 24, right: 24, bottom: 15, top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.25,
            blurRadius: 5,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomBar(
              onPressed: () {
                if (index != 0) {
                  // if (userID == Null) {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => LoginPage()));
                  // }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(userID, userName)));
                }
              },
              bottomIcons: index == 0,
              icons: EvaIcons.home,
              text: "Home"),
          BottomBar(
              onPressed: () {
                if (index != 1) {
                  // if (userID == Null) {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => LoginPage()));
                  // }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DashboardScreen(userID, userName)));
                }
              },
              bottomIcons: index == 1,
              icons: EvaIcons.bookOpen,
              text: "Report"),
          BottomBar(
              onPressed: () {
                if (index != 2) {
                  // if (userID == Null) {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => LoginPage()));
                  // }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profile(userID, userName)));
                }
              },
              bottomIcons: index == 2,
              icons: EvaIcons.personOutline,
              text: "Profile")
        ],
      ),
    )
  ]);
}
