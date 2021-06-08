import 'package:dinogarden/Screens/DailyReport/index.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

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

class TableEventsExample extends StatefulWidget {
  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample> {
  // CalendarController _controller = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        focusedDay: DateTime.now(),
        firstDay: DateTime(2020),
        lastDay: DateTime(2030),
        weekendDays: [],
        //events: {DateTime.now(): _getEventsForDay(DateTime.now())},
        calendarFormat: CalendarFormat.month,
        startingDayOfWeek: StartingDayOfWeek.monday,
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
        ),
        calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, date, events) =>
                _calenderItems(context, date, events, false),
            todayBuilder: (context, date, events) =>
                _calenderItems(context, date, events, true)),
      ),
    );
  }
}

Widget _calenderItems(context, date, events, bool selected) {
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
                MaterialPageRoute(builder: (context) => DailyReport(date));
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
