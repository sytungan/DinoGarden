import 'package:dinogarden/Pump_mode_screen.dart';
import 'package:dinogarden/Time_limit.dart';
import 'package:dinogarden/api/device_api.dart';
import 'package:dinogarden/model/Device_Auto.dart';
import 'package:dinogarden/model/global_device.dart';
import 'package:dinogarden/model/global_schedule.dart';
import 'package:dinogarden/water.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dinogarden/HomeScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:dinogarden/api/schedule_api.dart';
import 'package:dinogarden/manage/mqtt/MQTTManager.dart';
import 'package:dinogarden/manage/mqtt/MQTTAppState.dart';
import 'dart:convert';

class Maybom extends StatefulWidget {
  String userID;
  MQTTManager _manager;
  bool pumpStart;
  // Maybom(@required this.userID, @required this._manager, this.pumpStart);
  Maybom(@required this.userID);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MaybomState();
  }
}

class _MaybomState extends State<Maybom> {
  bool isSwitched = false;
  String dropdownValue = 'Phun vòi';
  ScheduleAPI scheduleAPI;
  DeviceAPI deviceAPI;
  DeviceAuto dvcTemp;
  DeviceAuto dvcSoil;
  DeviceAuto dvcLight;
  bool isPumpTurnOn = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      deviceAPI = DeviceAPI(widget.userID);
      scheduleAPI = ScheduleAPI(widget.userID);
      // isPumpTurnOn = widget.pumpStart;
    });
    // _getStatus();
  }

  Future<void> _getStatus() async {
    final Future<dynamic> status = scheduleAPI.getSchedule();
    dynamic data = (await status)['data'];

    var scheduleModel = context.read<GlobalSchedule>();
    scheduleModel.add(DeviceAuto.fromJson(data[0]));
    scheduleModel.add(DeviceAuto.fromJson(data[1]));
    scheduleModel.add(DeviceAuto.fromJson(data[2]));

    var deviceStatus = context.read<GlobalDeviceStatus>();
    setState(() {
      isPumpTurnOn = deviceStatus.getStatus(0);
    });

    setState(() {
      dvcTemp = DeviceAuto.fromJson(data[0]);
      dvcSoil = DeviceAuto.fromJson(data[1]);
      dvcLight = DeviceAuto.fromJson(data[2]);
    });
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
                isPumpTurnOn ? 'Power Off' : 'Power On',
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
              style:
                  GoogleFonts.mulish(fontWeight: FontWeight.bold, fontSize: 16),
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
                    width: 140.0,
                    height: 95.0,
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
                                'Mode',
                                style: GoogleFonts.mulish(
                                    fontSize: 16.0, color: Colors.black),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Phun vòi',
                                style: GoogleFonts.mulish(
                                    fontSize: 20.0,
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
                            icon: Image.asset('images/spin.png'),
                            onPressed: () {
                              //right way: use context in below level tree with MaterialApp
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Pump_mode()));
                            },
                          ),
                        )
                      ],
                    )),
                SizedBox(width: 60.0),
                Container(
                    width: 140.0,
                    height: 95.0,
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
                                'Time limit',
                                style: GoogleFonts.mulish(
                                    fontSize: 16.0, color: Colors.black),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'None',
                                style: GoogleFonts.mulish(
                                    fontSize: 20.0,
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
                            icon: Image.asset('images/watch.png'),
                            onPressed: () {
                              //right way: use context in below level tree with MaterialApp
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Time_limit()));
                            },
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 140.0,
                    height: 95.0,
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
                                'Water limit',
                                style: GoogleFonts.mulish(
                                    fontSize: 16.0, color: Colors.black),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '696 ml',
                                style: GoogleFonts.mulish(
                                    fontSize: 20.0,
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
                            icon: Image.asset('images/speed.png'),
                            onPressed: () {
                              //right way: use context in below level tree with MaterialApp
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Water()));
                            },
                          ),
                        )
                      ],
                    )),
                SizedBox(width: 60.0),
                Container(
                    width: 140.0,
                    height: 95.0,
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
                                'Humid limit',
                                style: GoogleFonts.mulish(
                                    fontSize: 16.0, color: Colors.black),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'None',
                                style: GoogleFonts.mulish(
                                    fontSize: 20.0,
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
                            icon: Image.asset('images/speed.png'),
                            onPressed: () {
                              //right way: use context in below level tree with MaterialApp
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen("id", "name")));
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
                child: FlatButton(
                  onPressed: () {
                    print("CONFIRMED");
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
