import 'package:dinogarden/Screens/Auto_Mode/Soil%20Moisture.dart';
import 'package:dinogarden/Screens/Auto_Mode/Humidity.dart';
import 'package:dinogarden/api/device_api.dart';
import 'package:dinogarden/model/Device_Auto.dart';
import 'package:dinogarden/model/global_schedule.dart';
import 'package:dinogarden/Screens/Auto_Mode/Temperature_page.dart';
import 'package:dinogarden/widget/loadingDialog.dart';
import 'package:dinogarden/model/log_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:dinogarden/api/schedule_api.dart';
import 'package:dinogarden/manage/mqtt/MQTTManager.dart';

import 'Screens/Auto_Mode/Light.dart';
import 'model/cart_model.dart';
import 'model/global_device.dart';

class Maybom extends StatefulWidget {
  String userID;
  MQTTManager _manager;
  bool pumpStart;
  // Maybom(@required this.userID, @required this._manager, this.pumpStart);
  Maybom(@required this.userID, this._manager);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MaybomState();
  }
}

class _MaybomState extends State<Maybom> {
  bool isSwitched = false;
  //String dropdownValue = 'Phun vòi';
  ScheduleAPI scheduleAPI;
  DeviceAPI deviceAPI;
  DeviceAuto dvcTemp;
  DeviceAuto dvcSoil;
  DeviceAuto dvcLight;
  bool isPumpTurnOn = true;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    var deviceStatus = context.read<GlobalDeviceStatus>();
    setState(() {
      deviceAPI = DeviceAPI(widget.userID);
      scheduleAPI = ScheduleAPI(widget.userID);
      isPumpTurnOn = deviceStatus.getStatus(0);
    });
    _getStatus();
  }

  Future<void> _getStatus() async {
    final Future<dynamic> status = scheduleAPI.getSchedule();
    dynamic dataZip = (await status);
    if (dataZip.toString() == "None") {
      setState(() {
        isLoading = false;
      });
      return;
    }
    dynamic data = dataZip['data'];
    var scheduleModel = context.read<GlobalSchedule>();
    scheduleModel.setSchedule(DeviceAuto.fromJson(data[0]), 0);
    scheduleModel.setSchedule(DeviceAuto.fromJson(data[1]), 1);
    scheduleModel.setSchedule(DeviceAuto.fromJson(data[2]), 2);
    setState(() {
      // dvcTemp = DeviceAuto.fromJson(data[0]);
      // dvcSoil = DeviceAuto.fromJson(data[1]);
      // dvcLight = DeviceAuto.fromJson(data[2]);
      isLoading = false;
    });
    print("Done loading...");
  }

  void _setStatus() {
    Map schedule;
    var scheduleModel = context.read<GlobalSchedule>();
    List<Map<String, dynamic>> lstDeviceAuto = [
      scheduleModel.listSchedule[0].toJson(),
      scheduleModel.listSchedule[1].toJson(),
      scheduleModel.listSchedule[2].toJson(),
    ];
    schedule = {
      'schedule': {
        'data': List<dynamic>.from(lstDeviceAuto.map((x) => x)),
      }
    };
    scheduleAPI.setSchedule(schedule);
  }

  void _setPump() {
    var deviceStatus = context.read<GlobalDeviceStatus>();
    if (isPumpTurnOn != deviceStatus.getStatus(0)) {
      _writeLog();
      sendPumpRequestTurnOn(isPumpTurnOn);
    }
  }

  void _writeLog() {
    DateTime now = new DateTime.now();
    deviceAPI.sendLog(LogLine(
        "user turn " + (isPumpTurnOn ? "on" : "off") + " the pump",
        now.hour.toString() + ":" + now.minute.toString()));
  }

  void sendPumpRequestTurnOn(bool isTrue) async {
    await widget._manager
        .publishInputDevice(11, isTrue ? "0" : "1", widget.userID);
  }

  void togglePumpStatus() {
    setState(() {
      isPumpTurnOn = !isPumpTurnOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
      return MaterialApp(
        title: "This is a StatafulWidget",
        home: Scaffold(
            body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 60.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.green),
                    iconSize: 40.0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Máy bơm 125D2',
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      textStyle: TextStyle(color: HexColor("#0C9359")),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.0),
            Center(
              child: IconButton(
                iconSize: 100.0,
                icon: Image.asset('images/Power_Off.png'),
                onPressed: () {
                  //right way: use context in below level tree with MaterialApp
                  togglePumpStatus();
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => HomeScreen("id", "name")));
                },
              ),
            ),
            Center(
              child: Container(
                child: Text(
                  'Power ' + (isPumpTurnOn ? 'Off' : 'On'),
                  style: GoogleFonts.mulish(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    textStyle: TextStyle(color: HexColor("#0C9359")),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0, left: 50.0, right: 50.0),
              child: Text(
                'Status: Running',
                style: GoogleFonts.mulish(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
              child: Text(
                'Last Modify: 2AM, Today',
                style: GoogleFonts.mulish(
                    fontSize: 14.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.38,
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                                  20.0) //                 <--- border radius here
                              ),
                          color: Colors.white,
                          boxShadow: kElevationToShadow[2]),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Auto Mode',
                                  style: GoogleFonts.mulish(
                                      fontSize: 16.0, color: Colors.black),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'Temperature',
                                  style: GoogleFonts.mulish(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            //top: 3.0,
                            left: 95.0,
                            child: IconButton(
                              iconSize: 5.0,
                              icon: SvgPicture.asset(
                                "assets/icons/thermometer_nhat.svg",
                                width: 20.0,
                                height: 20.0,
                              ),
                              onPressed: () {
                                //right way: use context in below level tree with MaterialApp
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Temperature(),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      )),
                  SizedBox(width: 60.0),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.38,
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                                  20.0) //                 <--- border radius here
                              ),
                          color: Colors.white,
                          boxShadow: kElevationToShadow[2]),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Auto Mode',
                                  style: GoogleFonts.mulish(
                                      fontSize: 16.0, color: Colors.black),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'Humidity',
                                  style: GoogleFonts.mulish(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 3.0,
                            left: 95.0,
                            child: IconButton(
                              iconSize: 5.0,
                              icon: Image.asset(
                                "assets/humidity.png",
                                height: 20.0,
                                width: 20.0,
                              ),
                              onPressed: () {
                                //right way: use context in below level tree with MaterialApp
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Humidity()));
                              },
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.38,
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                                  20.0) //                 <--- border radius here
                              ),
                          color: Colors.white,
                          boxShadow: kElevationToShadow[2]),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Auto Mode',
                                  style: GoogleFonts.mulish(
                                      fontSize: 16.0, color: Colors.black),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'Soil Moisture',
                                  style: GoogleFonts.mulish(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 3.0,
                            left: 95.0,
                            child: IconButton(
                              iconSize: 4.0,
                              icon: SvgPicture.asset(
                                'assets/icons/humidity_water.svg',
                                width: 20.0,
                                height: 20.0,
                              ),
                              onPressed: () {
                                //right way: use context in below level tree with MaterialApp
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Soil()));
                              },
                            ),
                          )
                        ],
                      )),
                  SizedBox(width: 60.0),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.37,
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                                  20.0) //                 <--- border radius here
                              ),
                          color: Colors.white,
                          boxShadow: kElevationToShadow[2]),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Auto Mode',
                                  style: GoogleFonts.mulish(
                                      fontSize: 16.0, color: Colors.black),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'Light',
                                  style: GoogleFonts.mulish(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 3.0,
                            left: 95.0,
                            child: IconButton(
                              iconSize: 10.0,
                              icon: Image.asset(
                                'images/spin.png',
                                width: 20.0,
                                height: 20.0,
                              ),
                              onPressed: () {
                                //right way: use context in below level tree with MaterialApp
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Light()));
                              },
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                  width: 200.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(
                            40.0) //                 <--- border radius here
                        ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      print("CONFIRMED");
                      _setPump();
                      _setStatus();
                    },
                    child: Text("CONFIRM",
                        style: GoogleFonts.mulish(
                            fontSize: 16.0, color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        )),
      );
  }
}
