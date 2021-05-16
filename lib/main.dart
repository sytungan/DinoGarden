import 'package:flutter/material.dart';

import 'screens/Calender/index.dart';
import 'screens/DailyReport/index.dart';
import 'screens/Dashboard/index.dart';

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
