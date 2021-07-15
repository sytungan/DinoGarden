
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';





class Water extends StatefulWidget {

  Water();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Water_State();
  }
}
class Size{
  static width(double p,BuildContext context)
  {
    return MediaQuery.of(context).size.width/p;
  }
  static height(double p,BuildContext context)
  {
    return MediaQuery.of(context).size.height/p;
  }
}

class _Water_State extends State<Water> {
  bool isSwitched = false;
  String value = '1000 ml';
  double shapePointerValue = 25;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "This is a StatafulWidget",
      home: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[


            Container(
              width: Size.width(1.0, context),
              height: MediaQuery.of(context).size.height - 200.0,
              child: new Image.asset(
                "images/screen_image.jpg",
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0, left: 5.0),
              width: MediaQuery.of(context).size.width/6.85,
              height: MediaQuery.of(context).size.height/13.675,
              //color: Colors.green,
              child: new IconButton(
                iconSize: 40.0,
                icon:   const Icon(Icons.arrow_back,   color: Colors.green),
                onPressed: () {
                  //right way: use context in below level tree with MaterialApp
                  Navigator.pop(context);
                },

              ),

            ),
            Positioned(
              top: Size.height(3.0, context),
              child: new Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/1.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  child:  new Column(

                    children: <Widget>[
                      new Center(
                          child: new Container(
                            padding: const EdgeInsets.only(top: 20.0, bottom: 50.0),
                            child: Text('Water limit',style: GoogleFonts.mulish(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),),
                          )
                      ),
                      new Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children :<Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Water limit',style: GoogleFonts.mulish(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                textStyle: TextStyle(
                                    color: HexColor("#06492C")),
                              ),),
                            ),
                            new Container(
                              padding: EdgeInsets.only(left: 120.0),
                              child: DropdownButton<String>(
                                value: value,
                                icon: const Icon(Icons.arrow_forward_ios_rounded , color: Colors.green),
                                iconSize: 20,
                                elevation: 10,
                                style: GoogleFonts.mulish(
                                  fontSize: 20,
                                  color: Colors.green,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    value = newValue;
                                  });
                                },
                                items: <String>['1000 ml', '1100 ml', '1200 ml', '1300 ml', '1400 ml','1500 ml']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ) ,
                    ],

                  ),
                ),
              ),


            ),
            Positioned(
              top: 500,
              left: 0.0,
              right: 0.0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width - 20.0,
                height: MediaQuery.of(context).size.height/4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), color: HexColor("#6798C0"),
                ),

                child: SfLinearGauge(minimum: 1000, maximum: 1500,
                  markerPointers: [
                    LinearShapePointer(

                        value: shapePointerValue,
                        //Changes the value of shape pointer based on interaction
                        onValueChanged: (value) {
                          setState(() {
                            shapePointerValue = value;
                          });
                        },
                        color: Colors.blue[800]),
                  ],

                  //Add a new bar pointer.

                  //Add a new shape pointer.

                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
