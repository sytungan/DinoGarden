import 'package:flutter/material.dart';
import 'package:dinogarden/HomeScreen.dart';

class Time_limit extends StatefulWidget {

  Time_limit();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Time_limit_State();
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
                          MaterialPageRoute(builder: (context) => HomeScreen( "id","name")));
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
                                padding: const EdgeInsets.all(20.0),
                                child: new Text("Time Limit", style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                            )
                            ),
                            new Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children :<Widget>[
                                  new Text("Time limit",style: new TextStyle(fontSize: 20.0)),
                                  new Container(
                                    padding: EdgeInsets.only(left: 170.0),
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
                bottom:  -30.0,
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
                bottom: 60.0,
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
