import 'package:dinogarden/widget/bottomNavigator.dart';
import 'package:flutter/material.dart';

import 'components/bottomBar.dart';
import 'components/btViewCalendar.dart';
import 'components/calendar.dart';
import 'components/graph.dart';
import 'components/insightOption.dart';
import 'components/tabBar.dart';

class dashboardScrean extends StatelessWidget {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'dashboardScrean',
        color: Color.fromRGBO(255, 255, 255, 1),
        home: Scaffold(
          appBar: tabBar(),
          body: ListView(children: <Widget>[
            Container(height: 130.0, child: Calendar()),
            Container(height: 40.0, child: BtViewCalendar()),
            Container(height: 70.0, child: Insight()),
            Container(height: 400.0, child: GraphGroup()),
          ]),
          bottomNavigationBar: bottomNavigator(context, _currentIndex),
        ));
  }
}
