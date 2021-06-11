import 'dart:convert';

import 'package:dinogarden/Screens/DailyReport/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Log.dart';

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

List<Event> _getEventsForDay(DateTime day) {
  // Implementation example
  return [new Event("even" + day.day.toString())];
}
Map<String,List<dynamic>> _getEven(List<dynamic> log){
  Map<String,List<dynamic>> re={};
  for(Map i in log){
    i.forEach((key, value) {
      if (re.isEmpty){
        re[key] = [value];
      }
      else if(re.containsKey(key)){
        re[key].add(value);
      }
      else {
        re[key] = [value];
      }
    });
  }
  return re;
}

class TableEventsExample extends StatefulWidget {
  List<dynamic> log;
  TableEventsExample(this.log);
  @override
  _TableEventsExampleState createState() => _TableEventsExampleState(log);
}

class _TableEventsExampleState extends State<TableEventsExample> {
  List<dynamic> log;
  _TableEventsExampleState(this.log);

  @override
  Widget build(BuildContext context) {
    Map<String,List<dynamic>> even = _getEven(log);
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime(2020),
            lastDay: DateTime(2030),
            weekendDays: [],
            eventLoader: (day) {
              if (even.containsKey(day.day.toString()+" "+day.month.toString()+" "+day.year.toString())) {
                return even[day.day.toString()+" "+day.month.toString()+" "+day.year.toString()];
              }
              return [];
            },
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, date, events) =>
                  _calenderItems(context, date, events, false,even),
              todayBuilder: (context, date, events) =>
                  _calenderItems(context, date, events, true,even),
              // markerBuilder: (context, date, events) =>
            ),
          ),
        ],
      )

    );
  }
}

Widget _calenderItems(context, date, events, bool selected,even) {
  return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        color: Color.fromRGBO(255, 255, 255, 1),
        border: Border.all(
          color: selected == false ? Color(0xffF5F5F5) : Color(0xff01AA4F),
          width: 1,
        ),
      ),
      alignment: Alignment.center,
      child: FlatButton(
          onPressed: () {
            Route route =
                MaterialPageRoute(builder: (context) => DailyReport(date,even));
            Navigator.push(context, route);
          },
          child: Stack(children: <Widget>[
            Positioned(
                top: 7.799999713897705,
                left: 9.539999961853027,
                child: Text(
                  date.day.toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color(0xff666666),
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
                      height: 1),
                )),
            Positioned(
                top: 7.799999713897705,
                right: 9.539999961853027,
                child: selected
                    ? Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(1, 170, 79, 1),
                      borderRadius: BorderRadius.all(Radius.elliptical(7, 7)),
                    ))
                    : Container(
                  width: 7,
                  height: 7,
                ))
          ])));
}
