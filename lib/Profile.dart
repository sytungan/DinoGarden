import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'widget/bottomNavigator.dart';

class Profile extends StatefulWidget {
  Profile({
    Key key,
  }) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String id = '1344295024';
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
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
                                      IconButton(
                                          icon: Image.asset('images/back.png'),
                                          onPressed: () {
                                            print("Pressed");
                                          },
                                          iconSize: 15),
                                      SizedBox(width: 30.0),
                                      Text("Profile",
                                          //overflow: TextOverflow.visible,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            height: 1.171875,
                                            fontSize: 25.0,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                            color:
                                                Color.fromARGB(255, 1, 170, 79),
                                          )),
                                      SizedBox(width: 105.0),
                                      IconButton(
                                          icon:
                                              Image.asset('images/setting.png'),
                                          onPressed: () {
                                            print("Pressed");
                                          },
                                          iconSize: 15),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                          child: Stack(
                              overflow: Overflow.visible,
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              height: 205,
                              padding: const EdgeInsets.only(top: 0.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: ListView(
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
                          ])),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Stack(
                            children: [
                              Container(
                                height: 65,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.green.withOpacity(0.2),
                                      spreadRadius: 0.25,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                              ),
                              Positioned.fill(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("  Charlie's Garden",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                height: 1.171875,
                                                fontSize: 16.0,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 11, 12, 12),
                                              )),
                                          Text("  ID: " + id,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                height: 1.171875,
                                                fontSize: 16.0,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.normal,
                                                color: Color.fromARGB(
                                                    255, 33, 35, 34),
                                              )),
                                        ],
                                      ),
                                      flex: 3,
                                    ),
                                    Expanded(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.chevron_right,
                                          size: 30,
                                        ),
                                        tooltip: 'Go detail',
                                        color: HexColor("#0C9359"),
                                        onPressed: () {
                                          print("Pressed detail");
                                        },
                                      ),
                                      flex: 1,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Center(
                          child: Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        height: 60,
                        width: 304,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5)),
                        ),
                        child: ButtonBar(
                          mainAxisSize: MainAxisSize.min,
                          alignment: MainAxisAlignment.start,
                          children: [
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              height: 60,
                              color: HexColor("6422EA6D"),
                              onPressed: () {},
                              child: Text('PLANTS',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("#FF9E9E9E"))),
                            ),
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              height: 60,
                              onPressed: () {},
                              child: Text('LOG',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      height: 1.171875,
                                      fontSize: 16.0,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("#FF9E9E9E"))),
                            ),
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              height: 60,
                              onPressed: () {},
                              child: Text('SETTINGS',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    height: 1.171875,
                                    fontSize: 16.0,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: HexColor("#FF9E9E9E"),
                                  )),
                            ),
                          ],
                        ),
                      )),
                      Center(
                          child: Container(
                              height: 250,
                              width: 320,
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0.25,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: ListView(
                                children: [
                                  Column(children: [
                                    Row(children: [
                                      Center(
                                        child: Container(
                                          width: 300,
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            color: Color.fromARGB(
                                                255, 208, 236, 217),
                                          ),
                                          child: Row(children: [
                                            Icon(
                                              Icons.grass,
                                              color: Colors.grey,
                                            ),
                                            Text('  Plant growing',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                )),
                                          ]),
                                        ),
                                      )
                                    ]),
                                    SizedBox(height: 10.0),
                                    Row(children: [
                                      Image.asset(
                                        'images/garlic1.png',
                                      ),
                                      Text('   Opinion',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold,
                                          )),
                                      IconButton(
                                          icon: Icon(Icons.info,
                                              color: Color.fromARGB(
                                                  255, 22, 182, 16)),
                                          onPressed: () {})
                                    ]),
                                    const Divider(
                                      height: 20,
                                      thickness: 1,
                                      indent: 20,
                                      endIndent: 20,
                                    ),
                                    Row(children: [
                                      Image.asset(
                                        'images/corn1.png',
                                      ),
                                      Text('   Corn',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold,
                                          )),
                                      IconButton(
                                          icon: Icon(Icons.info,
                                              color: Color.fromARGB(
                                                  255, 22, 182, 16)),
                                          onPressed: () {})
                                    ]),
                                    const Divider(
                                      height: 20,
                                      thickness: 1,
                                      indent: 20,
                                      endIndent: 20,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'images/spinach1.png',
                                        ),
                                        Text('   Spinach',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.bold,
                                            )),
                                        IconButton(
                                            icon: Icon(Icons.info,
                                                color: Color.fromARGB(
                                                    255, 22, 182, 16)),
                                            onPressed: () {})
                                      ],
                                    ),
                                    const Divider(
                                      height: 20,
                                      thickness: 1,
                                      indent: 20,
                                      endIndent: 20,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'images/cabbage1.png',
                                        ),
                                        Text('   Cabbage',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.bold,
                                            )),
                                        IconButton(
                                            icon: Icon(Icons.info,
                                                color: Color.fromARGB(
                                                    255, 22, 182, 16)),
                                            onPressed: () {})
                                      ],
                                    ),
                                    const Divider(
                                      height: 20,
                                      thickness: 1,
                                      indent: 20,
                                      endIndent: 20,
                                    ),
                                  ])
                                ],
                              )))
                    ]))),
        bottomNavigationBar: bottomNavigator(context, _currentIndex),
      );
    });
  }
}
