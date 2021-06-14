import 'package:dinogarden/Time_limit.dart';
import 'package:flutter/material.dart';
import 'package:dinogarden/HomeScreen.dart';

class water extends StatefulWidget {

  water();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _water_State();
  }
}


class _water_State extends State<water> {
  bool isSwitched = false;
  String Value = '1000 ml';

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
              bottom:  -110.0,
              child: new Container(
                width: MediaQuery.of(context).size.height*0.5555,
                height: MediaQuery.of(context).size.width*1.15,
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
                            child: new Text("Water Limit", style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                          )
                      ),
                      new Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children :<Widget>[
                            new Text("Water limit",style: new TextStyle(fontSize: 20.0)),
                            new Container(
                              padding: EdgeInsets.only(left: 140.0),
                              child: DropdownButton<String>(
                                value: Value,
                                icon: const Icon(Icons.arrow_forward_ios_rounded , color: Colors.green),
                                iconSize: 20,
                                elevation: 10,
                                style: const TextStyle(fontSize: 20.0,color: Colors.green),
                                onChanged: (String newValue) {
                                setState(() {
                                Value = newValue;
                                });
                                },
                                items: <String>['1000 ml', '1100 ml', '1300 ml', '1500 ml', '1800 ml','2000 ml']
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
              bottom:  -120.0,
              left: 0.0,
              right: 0.0,
              child: Center(
                child: Container(
                  height: 250.0,
                  width: 390.0,
                  child: new Image.asset(
                    "images/water.jpg",
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
