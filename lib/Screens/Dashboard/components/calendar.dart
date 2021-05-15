import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Calendar extends StatefulWidget {
  @override
  _Group34WidgetState createState() => _Group34WidgetState();
}

class _Group34WidgetState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime _toDay = DateTime.now();
  var dow = [];
  @override
  void initState() {
    dow.add(_focusedDay);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calendar',
      home: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          height: 140.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (!dow.isEmpty) {
                _focusedDay = _focusedDay.subtract(const Duration(days: -1));
                dow.add(_focusedDay);
              }
              return _builditem(
                  dow[index],_toDay, []);
            },
          ),
        ),
      ),
    );
  }
}

String _change(int i) {
  switch (i) {
    case 1:
      return "Mon";
      break;
    case 2:
      return "Tue";
      break;
    case 3:
      return "Wed";
      break;
    case 4:
      return "Thu";
      break;
    case 5:
      return "Fri";
      break;
    case 6:
      return "Sat";
      break;
    case 7:
      return "Sun";
      break;
  }
  return "";
}

Widget _builditem(DateTime day,DateTime toDay, List<String> img) {
  return Container(
      width: 83,
      height: 130,
      padding: EdgeInsets.all(2.0),
      child: Stack(children: <Widget>[
        // ListView.builder(
        //   scrollDirection: Axis.horizontal,
        //   itemBuilder: (context,index){
        //     if(img.isEmpty==false){return _icon(img[index], index);}
        // }),
        Positioned(
            top: 79,
            left: 33,
            child: Container(
                width: 13,
                height: 8,
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 0,
                      child: SvgPicture.asset(
                          img.isEmpty == false
                              ? img[0]
                              : 'assets/images/null.svg',
                          semanticsLabel: 'vector')),
                ]))),
        Positioned(
            top: 9,
            left: day.day.toString().length == 2 ? 17 : 26,
            child: Text(
              day.day.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(102, 102, 102, 1),
                  fontFamily: 'Roboto',
                  fontSize: 35,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 50,
            left: 26,
            child: Text(
              _change(day.weekday),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(153, 153, 153, 1),
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 12,
            left: 59,
            child: day.compareTo(toDay)==0
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
            )),
        Positioned(
            top: 0,
            left: 0,
            child: Container(
                width: 78,
                height: 102,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  border: Border.all(
                    color: Color.fromRGBO(224, 224, 224, 1),
                    width: 1,
                  ),
                ))),
      ]));
}
