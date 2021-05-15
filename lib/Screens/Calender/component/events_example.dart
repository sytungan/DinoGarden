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
  CalendarController _controller = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableCalendar(
            builders: CalendarBuilders(
                dayBuilder: (context, date, events) => Container(

                    alignment: Alignment.center,
                    child: FlatButton(
                        onPressed: () {
                          Route route = MaterialPageRoute(builder: (context) => DailyReport(date));
                          Navigator.push(context, route);
                        },
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                  width: 53,
                                  height: 65,
                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                                    color : Color.fromRGBO(255, 255, 255, 1),
                                    border : Border.all(
                                      color: (date.year == DateTime.now().year && date.day == DateTime.now().day && date.month == DateTime.now().month)?
                                        Color.fromRGBO(1, 170, 79, 1):Color(0xff666666),
                                      width: 1,
                                    ),
                                  )
                              )
                          ),Positioned(
                              top: 7.799999713897705,
                              left: 9.539999961853027,
                              child: Text(date.day.toString(), textAlign: TextAlign.left, style: TextStyle(
                                  color: !(date.year == DateTime.now().year && date.day == DateTime.now().day && date.month == DateTime.now().month)?
                                  Color.fromRGBO(102, 102, 102, 1):Color.fromRGBO(1, 170, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.bold,
                                  height: 1
                              ),)
                          ),
                        ])))),
            weekendDays: [],
            //events: {DateTime.now(): _getEventsForDay(DateTime.now())},
            calendarController: _controller,
            initialCalendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,

            ),
          ),
        ],
      ),
    ));
  }
}




