import 'package:dinogarden/Pump_mode_screen.dart';
import 'package:dinogarden/Time_limit.dart';
import 'package:dinogarden/api/device_api.dart';
import 'package:dinogarden/model/Device_Auto.dart';
import 'package:dinogarden/water.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dinogarden/HomeScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:dinogarden/api/schedule_api.dart';
import 'dart:convert';

class Maybom extends StatefulWidget {
  String userID;
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

  @override
  void initState() {
    super.initState();
    setState(() {
      deviceAPI = DeviceAPI(widget.userID);
      scheduleAPI = ScheduleAPI(widget.userID);
    });
    _getStatus();
  }

  Future<void> _getStatus() async {
    final Future<String> status = scheduleAPI.getSchedule();
    dynamic data = json.decode(await status)['data'];
    print(data);
    setState(() {
      dvcTemp = DeviceAuto.fromJson(data[0]);
      dvcSoil = DeviceAuto.fromJson(data[1]);
      dvcLight = DeviceAuto.fromJson(data[2]);
    });
    _setStatus();
  }

  void _setStatus() {
    Map<String, dynamic> schedule;
    dvcTemp.status = "false";
    List<Map<String, dynamic>> lstDeviceAuto = [
      dvcTemp.toJson(),
      dvcSoil.toJson(),
      dvcLight.toJson()
    ];
    schedule = {
      'data': List<dynamic>.from(lstDeviceAuto.map((x) => x)),
    };
    print(schedule);
    scheduleAPI.setSchedule(schedule);
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen("id", "name")));
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen("id", "name")));
              },
            ),
          ),
          Center(
            child: Container(
              child: Text(
                'Power Off',
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
