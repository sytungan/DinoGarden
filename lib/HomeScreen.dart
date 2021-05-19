import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'model/cardItem.dart';
import 'model/bottomBar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:dinogarden/manage/mqtt/MQTTManager.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum BottomIcons { Home, Favorite, Search, Account }

class _HomeScreenState extends State<HomeScreen> {
  MQTTManager _manager = new MQTTManager();
  BottomIcons bottomIcons = BottomIcons.Home;
  int _currentIndex = 0;
  String runtime = "2h";
  bool online = true;
  double waterPercent = 0.5;
  String waterCap = "1000 ml";
  num temperature = 28;
  num humidity = 0.74;
  num waterLv = 0.85;
  @override
  Widget build(BuildContext context) {
    _configureAndConnect();
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return LayoutBuilder(
      builder: (context, constrains) {
        return Scaffold(
          backgroundColor: HexColor("#C7F9CC"),
          body: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top side
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 28.0, top: 30.0, bottom: 28.0),
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
                                child: Padding(
                                  padding: EdgeInsets.only(left: 28.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Your garden",
                                            style: GoogleFonts.mulish(
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
                                            online
                                                ? 'Connected'
                                                : 'Not Connected',
                                            style: GoogleFonts.mulish(
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
                                  style: GoogleFonts.mulish(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      textStyle: TextStyle(
                                          color: HexColor("#2C6E49"))),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.0, bottom: 10.0),
                                  child: new LinearPercentIndicator(
                                    width: MediaQuery.of(context).size.width *
                                        0.40,
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
                                  style: GoogleFonts.mulish(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      textStyle: TextStyle(
                                          color: HexColor("#2C6E49"))),
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
                                  offset: Offset(
                                      0, 1), // changes position of shadow
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Máy bơm ABCXYZ",
                                        style: GoogleFonts.mulish(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        "Running",
                                        style: GoogleFonts.mulish(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16,
                                            textStyle: TextStyle(
                                                color: HexColor("#D3D3D3"))),
                                      ),
                                      Text(
                                        "Run time: " + runtime,
                                        style: GoogleFonts.mulish(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
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
                            child: cardItem(context, "On", "Pump status",
                                "assets/clock.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
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
          bottomNavigationBar: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Colors.white),
                padding:
                    EdgeInsets.only(left: 24, right: 24, bottom: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    BottomBar(
                        onPressed: () {
                          setState(() {
                            bottomIcons = BottomIcons.Home;
                          });
                        },
                        bottomIcons:
                            bottomIcons == BottomIcons.Home ? true : false,
                        icons: EvaIcons.home,
                        text: "Home"),
                    BottomBar(
                        onPressed: () {
                          setState(() {
                            bottomIcons = BottomIcons.Favorite;
                          });
                        },
                        bottomIcons:
                            bottomIcons == BottomIcons.Favorite ? true : false,
                        icons: EvaIcons.heartOutline,
                        text: "Favorite"),
                    BottomBar(
                        onPressed: () {
                          setState(() {
                            bottomIcons = BottomIcons.Search;
                          });
                        },
                        bottomIcons:
                            bottomIcons == BottomIcons.Search ? true : false,
                        icons: EvaIcons.search,
                        text: "Search"),
                    BottomBar(
                        onPressed: () {
                          setState(() {
                            bottomIcons = BottomIcons.Account;
                          });
                        },
                        bottomIcons:
                            bottomIcons == BottomIcons.Account ? true : false,
                        icons: EvaIcons.personOutline,
                        text: "Account"),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _configureAndConnect() {
    // TODO: Use UUID
    String osPrefix = 'Flutter_Android';
    _manager.initializeMQTTClient(identifier: osPrefix);
    _manager.connect();
    _manager.subScribeTo('dinhkhanh412/feeds/light');
    _manager.subScribeTo('dinhkhanh412/feeds/light2');
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
