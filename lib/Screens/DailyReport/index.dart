import 'package:flutter/material.dart';

import '../Log.dart';
import 'components/calendar.dart';
import 'components/tabBar.dart';



class DailyReport extends StatelessWidget {
  DateTime day;
  Map<String,List<dynamic>> even;
  DailyReport(this.day,this.even);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Calender',
      color: Color.fromRGBO(255, 255, 255, 1),
      home: Scaffold(
          appBar: tabBar(context),
          body: Container(
              child:Container(child: Calendar(day,even),)

          )
      ),
    );
  }
}
