import 'package:flutter/material.dart';
import 'package:dinogarden/Screens/Calender/index.dart';

class BtViewCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        home: Container(
          color: Color.fromRGBO(255, 255, 255, 1),
          child: Row(children: <Widget>[
            Expanded(flex: 5, child: Text("")),
            Expanded(flex: 5, child: RaisedButton.icon(
              elevation: 0,
              onPressed: (){
                Route route = MaterialPageRoute(builder: (context) => Calender());
                Navigator.push(context, route);
                },
              color: Color.fromRGBO(255, 255, 255, 1),
              icon: Icon(Icons.arrow_circle_down,color: Color(0xffEEA46B)),
              label: Text("View Calendar",style: TextStyle(color: Color(0xffEEA46B)),),
            ),
            )
          ]),
        ));
  }
}


