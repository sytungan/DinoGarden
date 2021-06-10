import 'package:dinogarden/widget/bottomNavigator.dart';
import 'package:flutter/material.dart';

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

Future<Album> fetchAlbum() async {
  final response = await http.post(
      Uri.parse('https://testdinogarden.herokuapp.com/log/get'),
      body: {'userId': '60c19343cc9b4d001502f2ff'});

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class hitory {
  Map<String, String> data;
  hitory(this.data);
}

class Album {
  final List<dynamic> data;
  final String status;
  Album({this.data, this.status});

  factory Album.fromJson(Map<String, dynamic> json) {
    // [
    // {
    //   "19 4 2021": "{test:asda, time:4 07}"
    // }
    // ]
    // List<dynamic> a = json['data']['history'];
    // List< Map< String,dynamic>> b ;
    // for(dynamic i  in a){
    //   Map<String, dynamic> temp = jsonDecode(i);
    //   b.add(temp);
    // }
    return Album(
        data: json['data']['history'].toList(), status: json['status']);
  }
}

////////////////////////////////////////////
class dashboardScrean extends StatelessWidget {
  int _currentIndex = 1;
  var user = fetchAlbum();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'dashboardScrean',
        color: Color.fromRGBO(255, 255, 255, 1),
        home: Scaffold(
          appBar: tabBar(),
          body: ListView(children: <Widget>[
            // Container(height: 130.0, child: Calendar()),
            // Container(height: 40.0, child: BtViewCalendar()),
            // Container(height: 70.0, child: Insight()),
            // Container(height: 400.0, child: GraphGroup()),
            ///////////////////
            Center(
              child: FutureBuilder<Album>(
                future: fetchAlbum(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<dynamic> post = snapshot.data.data;
                    // return ListView(
                    //   children: post
                    //       .map((dynamic temp) => ListTile(
                    //             title: Text(temp),
                    //           ))
                    //       .toList(),
                    // );
                    Map a= json.decode(post[2]['19 4 2021']);
                    return Text(a['text']);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
            )
            //////////////////
          ]),
          bottomNavigationBar: bottomNavigator(context, _currentIndex),
        ));
  }
}
