import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Calendar extends StatefulWidget {
  DateTime day;

  Calendar(this.day);

  @override
  _Group34WidgetState createState() => _Group34WidgetState(day);
}

class _Group34WidgetState extends State<Calendar> {
  DateTime day;
  DateTime selectedDay = DateTime.now();
  _Group34WidgetState(this.day);
  var dow = [];
  @override
  void initState() {
    dow.add(day);
    selectedDay = day;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              height: 130.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index == dow.length) {
                    day = day.subtract(const Duration(days: -1));
                    dow.add(day);
                  }
                  return Container(
                      width: 95.0,
                      child: FlatButton(
                        child: _builditem(dow[index], [], selectedDay),
                        onPressed: () {
                          setState(() {
                            selectedDay = dow[index];
                            ////////////////////////////////////even//////////////////////////////
                          });
                        },
                      ));
                },
              ),
            ),
            //////////////////////////listeven////////////////////////////////////////
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(top: 20.0),
              height: 500,
              color: Colors.blue,
            )
          ],
        ));
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

Widget _builditem(DateTime date, List<String> img, selectedDay) {
  return Container(
      width: 78,
      height: 102,
      child: Stack(children: <Widget>[
        // ListView.builder(
        //   scrollDirection: Axis.horizontal,
        //   itemBuilder: (context,index){
        //     if(img.isEmpty==false){return _icon(img[index], index);}
        // }),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
              width: 78,
              height: 102,
              decoration: BoxDecoration(
                color: date.compareTo(selectedDay) == 0
                    ? Color(0xff01AA4F)
                    : Color.fromRGBO(255, 255, 255, 1),
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
              )),
        ),
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
            left: date.day.toString().length == 2 ? 17 : 26,
            child: Text(
              date.day.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: date.compareTo(selectedDay) != 0
                      ? Color.fromRGBO(102, 102, 102, 1)
                      : Color(0xffFFFFFF),
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
              _change(date.weekday),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: date.compareTo(selectedDay) != 0
                      ? Color.fromRGBO(102, 102, 102, 1)
                      : Color(0xffFFFFFF),
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
            child: (date.year == DateTime.now().year &&
                    date.day == DateTime.now().day &&
                    date.month == DateTime.now().month)
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
      ]));
}
