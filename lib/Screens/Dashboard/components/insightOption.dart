import 'package:flutter/material.dart';

class Insight extends StatefulWidget {
  @override
  _Group34WidgetState createState() => _Group34WidgetState();
}

class _Group34WidgetState extends State<Insight> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Group63Widget - GROUP
    return Container(
        color: Color.fromRGBO(255, 255, 255, 1),
        padding: const EdgeInsets.all(10.0),
        height: 70,
        child: Row(children: <Widget>[
          Container(
              width: 142,
              height: 23,
              child: Stack(children: <Widget>[
                Positioned(
                    top: 0,
                    left: 0,
                    child: Text(
                      'Insight',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
              ])),
          Expanded(child: Option())
        ]));
  }
}

class Option extends StatefulWidget {
  @override
  _Group12WidgetState createState() => _Group12WidgetState();
}

class _Group12WidgetState extends State<Option> {
  bool _w = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        child: Row(children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                  width: 111,
                  height: 50,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _w = true;
                      });
                    },
                    child: Text(
                      'Week',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: _w == true
                              ? Color.fromRGBO(255, 255, 255, 1)
                              : Color(0xff999999),
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    color: _w == true ? Color(0xff01AA4F) : Color(0xffffffff),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      side: BorderSide(
                        color: Color.fromRGBO(235, 235, 235, 1),
                        width: 1,
                      ),
                    ),
                  ))),
          Expanded(
              flex: 1,
              child: Container(
                  width: 111,
                  height: 50,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _w = false;
                      });
                    },
                    child: Text(
                      'Month',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: _w == false
                              ? Color.fromRGBO(255, 255, 255, 1)
                              : Color(0xff999999),
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    color: _w == false ? Color(0xff01AA4F) : Color(0xffffffff),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      side: BorderSide(
                        color: Color.fromRGBO(235, 235, 235, 1),
                        width: 1,
                      ),
                    ),
                  ))),
        ]));
  }
}
