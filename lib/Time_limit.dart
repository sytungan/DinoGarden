import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';




class Time_limit extends StatefulWidget {

  Time_limit();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Time_limit_State();
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

class _Time_limit_State extends State<Time_limit> {
  bool isSwitched = false;
  String dropdownValue = 'Phun vòi';

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
                  height: MediaQuery.of(context).size.height*0.66,
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
                 top: Size.height(2.7, context),
                 child: new Container(
                   width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height/2,
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
                                padding: const EdgeInsets.all(20.0),
                                child: Text('Time limit',style: GoogleFonts.mulish(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),),
                            )
                            ),
                            new Container(padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                              child: Row(
                                children :<Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text('Time limit',style: GoogleFonts.mulish(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      textStyle: TextStyle(
                                          color: HexColor("#06492C")),
                                    ),),
                                  ),
                                  new Container(
                                    padding: EdgeInsets.only(left: 130.0),
                                    child:  Switch(
                                      value: isSwitched,
                                      onChanged: (value){
                                        setState(() {
                                          isSwitched=value;
                                          print(isSwitched);
                                        });
                                      },
                                      activeTrackColor: Colors.lightGreenAccent,
                                      activeColor: Colors.green,
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
                top: Size.height(1.7, context),
                left: 0.0,
                right: 0.0,
                child: Center(
                  child: Container(
                    height: 200.0,
                    width: 200.0,
                    child: new Image.asset(
                      "images/w.jpg",
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 600,
                left: 0.0,
                right: 0.0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text("15:00"),
                ),

                ),
              ),


              ],
            ),
        ),
    );
  }
}
