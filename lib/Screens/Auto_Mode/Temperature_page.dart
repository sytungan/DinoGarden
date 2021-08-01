import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Temperature extends StatefulWidget {
  Temperature();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return temperatureState();
  }
}

class Size {
  static width(double p, BuildContext context) {
    return MediaQuery.of(context).size.width / p;
  }

  static height(double p, BuildContext context) {
    return MediaQuery.of(context).size.height / p;
  }
}

class temperatureState extends State<Temperature> {
  String contend = "";
  bool isSwitched = false;
  double startPointerValue = 20;
  double endPointerValue = 40;
  TimeOfDay _time = TimeOfDay(hour: 00, minute: 00);
  TimeOfDay _timeOff = TimeOfDay(hour: 10, minute: 00);
  void _selectTimeOff() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _timeOff,
    );
    if (newTime != null) {
      setState(() {
        _timeOff = newTime;
      });
    }
  }

  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: _buildShrineTheme(),
      title: "This is a StatafulWidget",
      home: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            screenImage(),
            backbutton(),
            Positioned(
              top: Size.height(3.0, context),
              child: new Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  child: new Column(
                    children: <Widget>[
                      title(),
                      new Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                field("Enable"),
                                EnableButton(),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                field("Time On"),
                                clock(),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                field("Time Off"),
                                clockOff(),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.0),
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              height: Size.height(5, context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.red.shade100,
                              ),
                              child: SfLinearGauge(
                                markerPointers: [
                                  LinearWidgetPointer(
                                    position: LinearElementPosition.outside,
                                    value: startPointerValue,
                                    onValueChanged: (value) {
                                      setState(() {
                                        startPointerValue = value;
                                      });
                                    },
                                    child: Container(
                                        height: 22,
                                        width: 22,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle),
                                        child: Center(
                                            child: Text(
                                          "${startPointerValue.toInt()}",
                                          style: TextStyle(fontSize: 14.0),
                                        ))),
                                  ),
                                  LinearWidgetPointer(
                                    position: LinearElementPosition.outside,
                                    value: endPointerValue,
                                    onValueChanged: (value) {
                                      setState(() {
                                        endPointerValue = value;
                                      });
                                    },
                                    child: Container(
                                        height: 22,
                                        width: 22,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle),
                                        child: Center(
                                            child: Text(
                                          "${endPointerValue.toInt()}",
                                          style: TextStyle(fontSize: 14.0),
                                        ))),
                                  ),
                                ],
                              ),
                            ),
                            confirmButton(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget confirmButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Center(
        child: Container(
          width: 150.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: HexColor("#01AA4F"),
            borderRadius: BorderRadius.all(
                Radius.circular(40.0) //                 <--- border radius here
                ),
          ),
          child: TextButton(
            onPressed: () {
              print("CONFIRMED");
            },
            child: Text("CONFIRM",
                style: GoogleFonts.mulish(fontSize: 16.0, color: Colors.white)),
          ),
        ),
      ),
    );
  }

  Widget EnableButton() {
    return new Container(
      margin: EdgeInsets.only(left: Size.width(1.8, context)),
      child: Switch(
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched = value;
            print(isSwitched);
          });
        },
        activeTrackColor: Colors.lightGreenAccent,
        activeColor: Colors.green,
      ),
    );
  }

  Widget clock() {
    return new Container(
      // padding: EdgeInsets.only(left: Size.width(1.9, context)),
      child: TextButton(
        onPressed: _selectTime,
        child: Text(
          '${_time.format(context)}',
          style: GoogleFonts.lato(
            color: Colors.green,
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }

  Widget clockOff() {
    return new Container(
      // padding: EdgeInsets.only(left: Size.width(1.94, context)),
      child: TextButton(
        onPressed: _selectTimeOff,
        child: Text(
          '${_timeOff.format(context)}',
          style: GoogleFonts.lato(
            color: Colors.green,
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }

  Widget field(String contend) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Text(
        contend,
        style: GoogleFonts.mulish(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          textStyle: TextStyle(color: HexColor("#06492C")),
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      margin: EdgeInsets.only(
        top: 40.0,
        bottom: 30.0,
        left: Size.width(3.8, context),
        //right: Size.width(4, context),
      ),
      child: new Center(
        child: Row(
          children: [
            Text(
              'Temperature',
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            SizedBox(
              width: Size.width(500, context),
            ),
            SvgPicture.asset(
              "assets/icons/thermometer.svg",
              height: 35.0,
              width: 35.0,
            )
          ],
        ),
      ),
    );
  }

  Widget backbutton() {
    return Container(
      margin: EdgeInsets.only(top: 50.0, left: 5.0),
      width: MediaQuery.of(context).size.width / 6.85,
      height: MediaQuery.of(context).size.height / 13.675,
      //color: Colors.green,
      child: new IconButton(
        iconSize: 40.0,
        icon: const Icon(Icons.arrow_back, color: Colors.green),
        onPressed: () {
          //right way: use context in below level tree with MaterialApp
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget screenImage() {
    return Container(
      width: Size.width(1.0, context),
      height: MediaQuery.of(context).size.height - 200.0,
      child: new Image.asset(
        "images/screen_image.jpg",
      ),
    );
  }
}
