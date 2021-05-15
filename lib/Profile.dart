
import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  Profile({
    Key key,
  }) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
                children:[
                  Padding (
                    padding: const EdgeInsets.only(left: 10.0, top: 30.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Positioned.fill(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton (
                                      icon: Image.asset('images/back.png'),
                                      onPressed: () {
                                        print("Pressed");
                                      },
                                      iconSize: 15
                                  ),
                                  SizedBox(width: 30.0),
                                  Text(
                                      "Profile",
                                      //overflow: TextOverflow.visible,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        height: 1.171875,
                                        fontSize: 25.0,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromARGB(255, 1, 170, 79),
                                      )
                                  ),
                                  SizedBox(width: 105.0),
                                  IconButton (
                                      icon: Image.asset('images/setting.png'),
                                      onPressed: () {
                                        print("Pressed");
                                      },
                                      iconSize: 15
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                  child:
                      Stack(
                        overflow: Overflow.visible,
                        clipBehavior: Clip.hardEdge,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0,20,0,0),
                            height: 206,
                            padding: const EdgeInsets.only( top: 0.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child:
                            ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Image.asset(
                                  'images/imgprofile_1.png',
                                  width: 346,
                                  height: 205,

                                ),
                                Image.asset(
                                  'images/imgprofile_2.png',
                                  width: 346,
                                  height: 205,
                                ),
                                Image.asset(
                                  'images/imgprofile_3.png',
                                  width: 346,
                                  height: 205,
                                ),

                              ],
                            ),
                          ),
                          Positioned(
                            top: 200,
                            left: 27,
                            child: Container(
                                margin: EdgeInsets.fromLTRB(0,0,0,0),
                                height: 75,
                                width: 270,
                                padding: const EdgeInsets.all( 10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5)
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                        children:[
                                          Text("Charlie's Garden",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                height: 1.171875,
                                                fontSize: 16.0,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(255, 1, 170, 79),
                                              )),
                                        ]
                                    ),
                                    Row(
                                        children: [
                                          Text(
                                              "ID: 1344295024",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                height: 1.171875,
                                                fontSize: 16.0,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(255, 1, 170, 79),
                                              )
                                          ),
                                        ]
                                    ),
                                  ],
                                )
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,

                            child:
                              Container(
                              margin: EdgeInsets.fromLTRB(0,0,0,0),
                              height: 85,
                              width: 304,
                              padding: const EdgeInsets.all( 10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5)
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                      children:[
                                        Text("Charlie's Garden",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              height: 1.171875,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(255, 1, 170, 79),
                                            )),
                                      ]
                                  ),
                                  Row(
                                      children: [
                                        Text(
                                            "ID: 1344295024",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              height: 1.171875,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(255, 1, 170, 79),
                                            )
                                        ),
                                      ]
                                  ),
                                ],
                              )
                          ),
                          )
                        ]
                        )

                  ),
                  Center(
                  child: Container(
                        margin: EdgeInsets.fromLTRB(0,80,0,0),
                        height: 40,
                        width: 304,
                        padding: const EdgeInsets.all( 10.0),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5)
                        ),

                        ),
                        child: Column(
                          children: [
                            Row(
                              children:[
                                ButtonBar(
                                  alignment: MainAxisAlignment.start,
                                  children: [
                                    FlatButton(
                                      onPressed: () {

                                      },
                                      child: const Text('PLANTS',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            height: 1.171875,
                                            fontSize: 16.0,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          )),
                                      highlightColor: Colors.green,
                                    ),
                                    FlatButton(

                                      onPressed: () {
                                        // Perform some action
                                      },
                                      child: const Text('LOG',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            height: 1.171875,
                                            fontSize: 16.0,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          )),
                                    ),
                                    FlatButton(

                                      onPressed: () {
                                        // Perform some action
                                      },
                                      child: const Text('SETTINGS',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            height: 1.171875,
                                            fontSize: 16.0,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          )),
                                    ),
                                  ],
                                ),
                              ]
                            ),
                          ]
                        )


                  )
                  ),


        ]
        )
    );
  }
}

