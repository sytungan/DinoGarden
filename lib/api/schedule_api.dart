import 'package:dinogarden/model/Feed.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class ScheduleAPI {
  String userId;
  ScheduleAPI(this.userId);
  Future<String> getSchedule() async {
    String url = 'https://testdinogarden.herokuapp.com/schedule/' + this.userId;
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return json.decode(response.body)['schedule'];
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load device');
    }
  }

  Future<bool> setSchedule(Map<String, dynamic> schedule) async {
    String url = 'https://testdinogarden.herokuapp.com/schedule/' + this.userId;
    final response = await http.post(Uri.parse(url), body: schedule.toString());
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return true;
    } else {
      return false;
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load device');
    }
  }
}
