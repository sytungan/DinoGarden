import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Pump_mode extends StatefulWidget {

  Pump_mode();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Pump_modeState();
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

class _Pump_modeState extends State<Pump_mode> {
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
              top:Size.height(2.6, context),
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
                            padding: const EdgeInsets.all(20.0),
                            child: Text('Pump mode',style: GoogleFonts.mulish(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),),
                          )
                      ),
                      new Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                        child: Row(
                          children :<Widget>[
                            Text('Custom mode',style: GoogleFonts.mulish(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              textStyle: TextStyle(
                                  color: HexColor("#06492C")),
                            ),
                            ),
                            new Container(
                              padding: EdgeInsets.only(left: 100.0),
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
                      new Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                        child: Row(
                          children :<Widget>[
                              Text('Mode',style: GoogleFonts.mulish(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              textStyle: TextStyle(
                                  color: HexColor("#06492C")),
                            ),),
                            SizedBox(width: Size.width(3, context)),
                            DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_forward_ios_rounded , color: Colors.green),
                                style: GoogleFonts.mulish(
                                  fontSize: 20,
                                  color: Colors.green,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>['Phun vòi', 'Phun sương', 'Phun khói', 'Phun Oxy']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                          ],
                        ),
                      )

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
}
