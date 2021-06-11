import 'package:flutter/material.dart';

import '../Log.dart';
import 'component/events_example.dart';
import 'component/tabBar.dart';


class Calender extends StatelessWidget {
  List<dynamic> log;
  Calender(this.log);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Calender',
        color: Color.fromRGBO(255, 255, 255, 1),
        home: Scaffold(
          appBar: tabBar(context),
          body: Container(
            child:Container(child: TableEventsExample(log),)

          )
          ),
    );
  }
}
