import 'package:flutter/material.dart';

import 'Screens/Calender/index.dart';
import 'Screens/DailyReport/index.dart';
import 'Screens/Dashboard/index.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/dashboard',
      routes: {
        '/dashboard': (context) => new dashboardScrean(),
        '/Calender': (context) => new Calender(),

      },
    );
  }
}
