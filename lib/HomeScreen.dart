import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'cardItem.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String runtime = "2h";
  bool online = true;
  num waterPercent = 0.5;
  String waterCap = "1000 ml";
  num temperature = 28;
  num humidity = 0.74;
  num waterLv = 0.85;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return Scaffold(
          backgroundColor: HexColor("#C7F9CC"),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top side
              Padding(
                padding:
                    const EdgeInsets.only(left: 28.0, top: 30.0, bottom: 28.0),
                child: Stack(
                  children: [
                    Container(
                      height: 85,
                      width: MediaQuery.of(context).size.width * 0.60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.25,
                            blurRadius: 5,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    Positioned.fill(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 28.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Your garden",
                                        style: GoogleFonts.muli(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(width: 10),
                                      Image.asset(
                                        'assets/farm_connected.png',
                                        height: 20,
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        online ? 'Connected' : 'Not Connected',
                                        style: GoogleFonts.muli(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          textStyle: TextStyle(
                                              color: HexColor("#D3D3D3")),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Image.asset(
                                        online
                                            ? 'assets/online.png'
                                            : 'assets/offline.png',
                                        height: 10,
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // Water status
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/watering_plants.png',
                          height: 100,
                          width: 100,
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (waterPercent * 100).toString() + " %",
                              style: GoogleFonts.muli(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  textStyle:
                                      TextStyle(color: HexColor("#2C6E49"))),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              child: new LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width * 0.40,
                                animation: true,
                                lineHeight: 20.0,
                                animationDuration: 2000,
                                percent: waterPercent,
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                progressColor: HexColor("#78C6F7"),
                              ),
                            ),
                            Text(
                              waterCap,
                              style: GoogleFonts.muli(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  textStyle:
                                      TextStyle(color: HexColor("#2C6E49"))),
                            ),
                          ],
                        ),
                        flex: 2,
                      ),
                    ],
                  ),
                ),
              ),

              // Device running
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Stack(
                    children: [
                      Container(
                        height: 85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.25,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: Row(
                          children: [
                            Expanded(
                              child: Image.asset(
                                'assets/pump.png',
                                height: 50,
                                width: 50,
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Máy bơm ABCXYZ",
                                    style: GoogleFonts.muli(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "Running",
                                    style: GoogleFonts.muli(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16,
                                        textStyle: TextStyle(
                                            color: HexColor("#D3D3D3"))),
                                  ),
                                  Text(
                                    "Run time: " + runtime,
                                    style: GoogleFonts.muli(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16,
                                        textStyle: TextStyle(
                                            color: HexColor("#D3D3D3"))),
                                  ),
                                ],
                              ),
                              flex: 2,
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
              // Expanded(
              //   child: GridView.extent(
              //     primary: false,
              //     padding: const EdgeInsets.all(0),
              //     crossAxisSpacing: 3,
              //     mainAxisSpacing: 3,
              //     maxCrossAxisExtent: 200.0,
              //     children: <Widget>[
              //       GestureDetector(
              //         onTap: () {
              //           print("Container clicked");
              //         },
              //         child: cardItem(context, temperature.toString() + " °C",
              //             "Temperature", "temperature.png"),
              //       ),
              //       cardItem(context, humidity.toString() + " %", "Humidity",
              //           "humidity.png"),
              //       cardItem(context, waterLv.toString() + " %", "Water level",
              //           "water_level.png"),
              //       cardItemDouble(context, "Watering", "Need more", "Status",
              //           "plant.png", "clock.png"),
              //       cardItem(context, waterLv.toString() + " %", "Water level",
              //           "water_level.png"),
              //     ],
              //   ),
              // ),
              Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints.expand(
                              height: constrains.maxWidth * 0.3,
                              width: constrains.maxWidth * 0.3),
                          child: cardItem(
                              context,
                              temperature.toString() + " °C",
                              "Temperature",
                              "assets/temperature.png"),
                        ),
                        Container(
                          constraints: BoxConstraints.expand(
                              height: constrains.maxWidth * 0.3,
                              width: constrains.maxWidth * 0.3),
                          child: cardItem(context, humidity.toString() + " %",
                              "Humidity", "assets/humidity.png"),
                        ),
                        Container(
                          constraints: BoxConstraints.expand(
                              height: constrains.maxWidth * 0.3,
                              width: constrains.maxWidth * 0.3),
                          child: cardItem(context, waterLv.toString() + " %",
                              "Water level", "assets/water_level.png"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints.expand(
                              height: constrains.maxWidth * 0.3,
                              width: constrains.maxWidth * 0.6),
                          child: cardItemDouble(
                              context,
                              "Watering",
                              "Need more",
                              "Status",
                              "assets/plant.png",
                              "assets/clock.png"),
                        ),
                        Container(
                          constraints: BoxConstraints.expand(
                              height: constrains.maxWidth * 0.3,
                              width: constrains.maxWidth * 0.3),
                          child: cardItem(
                              context, "On", "Pump status", "assets/clock.png"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: Visibility(
            child: FloatingActionButton(
              onPressed: () async {
                print("hhehe");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChildHomeScreen()));
              },
              tooltip: 'Add new',
              child: const Icon(Icons.add),
            ),
            visible: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "data",
              )
            ],
          ),
        );
      },
    );
  }
}

class ChildHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("next page"),
    );
  }
}
