import 'package:dinogarden/widget/bottomNavigator.dart';
import 'package:flutter/material.dart';

import '../Log.dart';
import 'components/bottomBar.dart';
import 'components/btViewCalendar.dart';
import 'components/calendar.dart';
import 'components/graph.dart';
import 'components/insightOption.dart';
import 'components/tabBar.dart';

//log class
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<Log> fetchAlbum() async {
  final response =
      await http.post(Uri.parse('https://testdinogarden.herokuapp.com/log/get'),
          //user id here
          body: {'userId': '60c42eaf98ca9c0015be8cb5'}
          // body: {'userId': '60c4c686a7f9bf001569fb93'}
          );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Log.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

////////////////////////////////////////////
class DashboardScreen extends StatefulWidget {
  String userID;
  String gardenName;
  DashboardScreen(@required this.userID, @required this.gardenName, {Key key})
      : super(key: key);
  @override
  dashboardScrean createState() => dashboardScrean();
}

class dashboardScrean extends State<DashboardScreen> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'dashboardScrean',
        color: Color.fromRGBO(255, 255, 255, 1),
        home: Scaffold(
          appBar: tabBar(),
          body: Center(
            child: FutureBuilder<Log>(
              future: fetchAlbum(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<dynamic> log = snapshot.data.data;
                  // Map a= json.decode(post[2]['19 4 2021']);
                  return ListView(children: <Widget>[
                    Container(height: 130.0, child: Calendar()),
                    Container(height: 40.0, child: BtViewCalendar(log)),
                    Container(height: 70.0, child: Insight()),
                    Container(height: 400.0, child: GraphGroup()),
                    /////////////////
                    // Container(height: 100,child: Text(snapshot.data.data.toString()),)
                    ////////////////
                  ]);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
          ),
          bottomNavigationBar: bottomNavigator(context, _currentIndex,
              userID: widget.userID, userName: widget.gardenName),
        ));
  }
}
