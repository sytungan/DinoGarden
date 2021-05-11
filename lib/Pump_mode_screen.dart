import 'package:flutter/material.dart';

class Pump_mode extends StatefulWidget{
  String name;
  int age;
  Pump_mode({this.name, this.age});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Pump_modeState();
  }
}
class _Pump_modeState extends State<Pump_mode>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "This is a StatafulWidget",
        home: Scaffold(
            body: new ListView(
              children: <Widget>[
                new Image.asset(
                "images/screen_image.jpg",
            )
              ],
            )
        )
    );
  }


}
