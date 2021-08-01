import 'package:dinogarden/maybom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'model/cardItem.dart';
import 'model/cart_model.dart';
import 'model/global_device.dart';
import 'widget/bottomNavigator.dart';
import 'package:dinogarden/manage/mqtt/MQTTManager.dart';
import 'package:dinogarden/manage/mqtt/MQTTAppState.dart';
import 'dart:convert';
import 'package:dinogarden/model/Feed.dart';
import 'package:dinogarden/api/device_api.dart';

class HomeScreen extends StatefulWidget {
  String userID;
  String gardenName;
  HomeScreen(@required this.userID, @required this.gardenName, {Key key})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum BottomIcons { Home, Report, Profile }

class _HomeScreenState extends State<HomeScreen> {
  MQTTManager _manager_1 = new MQTTManager();
  MQTTManager _manager_2 = new MQTTManager();
  BottomIcons bottomIcons = BottomIcons.Home;
  int _currentIndex = 0;
  String runtime = "2h";
  bool online = true;
  double waterPercent = 0.5;
  String waterCap = "1000 ml";
  num temperature = 0;
  num humidity = 0;
  num waterLv = 0;
  num lightLv = 0;
  bool pumpStart = false;
  Widget contentDialog;
  Widget contentDialogHumidity;
  Widget contentDialogWater;
  Widget contentDialogLight;
  bool isLoading = true;

  @override
  void initState() {
    // initValue
    _initValue();
    // connect
    // _configureAndConnect();

    _manager_1.addListener(() {
      MQTTAppState map1 = _manager_1.currentState;
      Map<String, dynamic> adaResponse = jsonDecode(map1.getReceivedText);
      Feed feed = Feed.fromJson(adaResponse);
      setState(() {
        online = true;
      });
      String data = feed.data;
      switch (int.parse(feed.id)) {
        case 7:
          {
            setState(() {
              final sub = data.indexOf("-");
              temperature = int.parse(data.substring(0, sub));
              humidity = int.parse(data.substring(sub + 1, data.length));
            });
          }
          break;

        case 9:
          {
            setState(() {
              waterLv = int.parse(data);
            });
          }
          break;

        default:
          {
            //statements;
          }
          break;
      }
    });
    _manager_2.addListener(() {
      MQTTAppState map2 = _manager_2.currentState;
      Map<String, dynamic> adaResponse = jsonDecode(map2.getReceivedText);
      Feed feed = Feed.fromJson(adaResponse);
      setState(() {
        online = true;
      });
      String data = feed.data;
      switch (int.parse(feed.id)) {
        case 11:
          {
            setState(() {
              pumpStart = (data == "1") ? true : false;
            });
            var deviceStatus = context.read<GlobalDeviceStatus>();
            deviceStatus.setDeviceStatus(pumpStart, 0);
          }
          break;

        case 13:
          {
            setState(() {
              lightLv = int.parse(data);
            });
          }
          break;

        default:
          {
            //statements;
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    if (isLoading) {
      return MaterialApp(
          title: "This is a StatafulWidget",
          home: Scaffold(
              body: Align(
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please wait....",
                style: GoogleFonts.mulish(
                  color: Colors.green,
                  fontSize: 18.0,
                ),
              )
            ]),
          )));
    } else
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
                                              widget.gardenName,
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
                                    padding: EdgeInsets.only(
                                        top: 10.0, bottom: 10.0),
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
                                          pumpStart ? "Running" : "Stopped",
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Maybom(widget.userID)));
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                                child: Container(
                                  constraints: BoxConstraints.expand(
                                      height: constrains.maxWidth * 0.3,
                                      width: constrains.maxWidth * 0.3),
                                  child: cardItem(
                                      context,
                                      temperature.toString() + " °C",
                                      "Temperature",
                                      "assets/temperature.png"),
                                ),
                                onTap: () => _showDialogTemperature()),
                            InkWell(
                              onTap: () => _showDialogHumidity(),
                              child: Container(
                                constraints: BoxConstraints.expand(
                                    height: constrains.maxWidth * 0.3,
                                    width: constrains.maxWidth * 0.3),
                                child: cardItem(
                                    context,
                                    (humidity).toString() + " %",
                                    "Humidity",
                                    "assets/humidity.png"),
                              ),
                            ),
                            InkWell(
                              onTap: () => _showDialogWater(),
                              child: Container(
                                constraints: BoxConstraints.expand(
                                    height: constrains.maxWidth * 0.3,
                                    width: constrains.maxWidth * 0.3),
                                child: cardItem(
                                    context,
                                    (waterLv).toString() + " %",
                                    "Water level",
                                    "assets/water_level.png"),
                              ),
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
                            InkWell(
                              onTap: () => _showDialogLight(),
                              child: Container(
                                constraints: BoxConstraints.expand(
                                    height: constrains.maxWidth * 0.3,
                                    width: constrains.maxWidth * 0.3),
                                child: cardItem(context, lightLv.toString(),
                                    "Light", "assets/clock.png"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // floatingActionButton: Visibility(
            //   child: FloatingActionButton(
            //     onPressed: () async {
            //       await _manager_2.publishInputDevice(11, "0", widget.userID);
            //     },
            //     tooltip: 'Add new',
            //     child: const Icon(Icons.add),
            //   ),
            //   visible: true,
            // ),
            bottomNavigationBar: bottomNavigator(context, _currentIndex,
                userID: widget.userID, userName: widget.gardenName),
          );
        },
      );
  }

  void _showDialogTemperature() {
    if (temperature >= 30) {
      contentDialog = SvgPicture.asset(
        "assets/icons/hot.svg",
        width: 300.0,
        height: 300.0,
      );
    } else {
      contentDialog = Image.asset(
        "assets/icons/smi.png",
        width: 300.0,
        height: 300.0,
      );
    }
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('$temperature' + " °C"),
        content: contentDialog,
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showDialogHumidity() {
    if (humidity >= 20) {
      contentDialogHumidity = SvgPicture.asset(
        'assets/icons/cold.svg',
        width: 300.0,
        height: 300.0,
      );
    } else {
      contentDialogHumidity = Image.asset(
        "assets/icons/smi.png",
        width: 300.0,
        height: 300.0,
      );
    }
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('$humidity' + " %"),
        content: contentDialogHumidity,
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showDialogWater() {
    if (waterLv >= 2) {
      contentDialogWater = Image.asset(
        "assets/icons/crying.png",
        width: 300.0,
        height: 300.0,
      );
    } else {
      contentDialogWater = Image.asset(
        "assets/icons/smi.png",
        width: 300.0,
        height: 300.0,
      );
    }
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('$waterLv' + " %"),
        content: contentDialogWater,
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showDialogLight() {
    if (lightLv >= 527) {
      contentDialogLight = Image.asset(
        "assets/icons/proud.png",
        width: 300.0,
        height: 300.0,
      );
    } else {
      contentDialogLight = Image.asset(
        "assets/icons/smi.png",
        width: 300.0,
        height: 300.0,
      );
    }
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('$lightLv'),
        content: contentDialogLight,
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _configureAndConnect() async {
    // TODO: Use UUID
    String server1 = 'server_1';
    String server2 = 'server_2';
    await _manager_1.initializeMQTTClient(identifier: server1, server: "BBC");
    await _manager_2.initializeMQTTClient(identifier: server2, server: "BBC1");
    _manager_1.connect();
    _manager_2.connect();
    // _manager.subScribeTo('sytungan/feeds/garden');
  }

  void _initValue() async {
    DeviceAPI deviceAPI = new DeviceAPI(widget.userID);
    dynamic allDevice = await deviceAPI.getAllDevice(widget.userID);
    // temp + humi
    // Feed temp = await deviceAPI.getDevice("7");
    Feed temp = new Feed.fromJson(allDevice[0]);
    String data = temp.data;
    final sub = data.indexOf("-");
    setState(() {
      temperature = int.parse(data.substring(0, sub));
      humidity = int.parse(data.substring(sub + 1, data.length));
    });
    // soil
    // temp = await deviceAPI.getDevice("9");
    temp = new Feed.fromJson(allDevice[1]);
    setState(() {
      waterLv = int.parse(temp.data);
    });

    // light
    // temp = await deviceAPI.getDevice("13");
    temp = new Feed.fromJson(allDevice[2]);
    // print(temp.data);
    setState(() {
      lightLv = int.parse(temp.data);
    });

    // pump
    // temp = await deviceAPI.getDevice("11");
    temp = new Feed.fromJson(allDevice[3]);
    setState(() {
      pumpStart = (temp.data == "1") ? true : false;
    });
    var deviceStatus = context.read<GlobalDeviceStatus>();
    deviceStatus.setDeviceStatus(pumpStart, 0);
    setState(() {
      isLoading = false;
    });
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
