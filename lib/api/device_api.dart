import 'package:dinogarden/model/Feed.dart';
import 'package:dinogarden/model/log_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class DeviceAPI {
  String userId;
  DeviceAPI(this.userId);
  Future<Feed> getDevice(String id) async {
    String url = 'https://testdinogarden.herokuapp.com/device/get/' +
        "60d3e6d66cd58b00151a3e2d" +
        "/" +
        id;
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Feed.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load device');
    }
  }

  Future<dynamic> getAllDevice(String id) async {
    String url = 'https://testdinogarden.herokuapp.com/device/get/' +
        "60d3e6d66cd58b00151a3e2d";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      if (response.body.length == 0) return "None";
      return json.decode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load device');
    }
  }

  Future<bool> setDevice(Feed device) async {
    final response = await http.post(
        Uri.parse(
            'https://testdinogarden.herokuapp.com/device/updateMode/' + userId),
        body: device.toJson());
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

  Future<void> sendLog(LogLine logLine) async {
    DateTime now = new DateTime.now();
    Map log = {
      'userId': userId,
      'date': now.day.toString() +
          " " +
          now.month.toString() +
          " " +
          now.year.toString(),
      'data': json.encode(logLine.toJson()),
    };
    print(log.toString());
    final response = await http.post(
        Uri.parse('https://testdinogarden.herokuapp.com/log/creat'),
        headers: {"content-type": "application/json"},
        body: json.encode(log));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load device');
    }
  }
}
