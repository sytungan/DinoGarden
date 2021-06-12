import 'package:flutter/material.dart';
import 'package:dinogarden/HomeScreen.dart';

class Pump_mode extends StatefulWidget {

  Pump_mode();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Pump_modeState();
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
              width: 881,
              height: 522,
              child: new Image.asset(
                "images/screen_image.jpg",
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30.0, left: 2.0),
              width: 60.0,
              height: 60.0,
              //color: Colors.green,
              child: new IconButton(
                icon:   const Icon(Icons.arrow_back,   color: Colors.green),
                onPressed: () {
                  //right way: use context in below level tree with MaterialApp
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen("id","name")));
                },

              ),

            ),

            Positioned(
              bottom:  -120.0,
              child: new Container(
                width: MediaQuery.of(context).size.height*0.5555,
                height: MediaQuery.of(context).size.width*0.90,
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
                            child: new Text("Pump mode", style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                          )
                      ),
                      new Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children :<Widget>[
                            new Text("Custom mode",style: new TextStyle(fontSize: 20.0)),
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
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                        child: Row(
                          children :<Widget>[
                            new Text("Mode",style: new TextStyle(fontSize: 20.0)),
                            new Container(
                              padding: EdgeInsets.only(left: 170.0),
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_forward_ios_rounded , color: Colors.green),
                                iconSize: 20,
                                elevation: 10,
                                style: const TextStyle(fontSize: 20.0,color: Colors.green),
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
