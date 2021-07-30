import 'package:dinogarden/model/Feed.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class DeviceAPI {
  String userId;
  DeviceAPI(this.userId);
  Future<Feed> getDevice(String id) async {
    String url = 'https://testdinogarden.herokuapp.com/device/get/' +
        "60c584eb353077001511f098" +
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
        "60c584eb353077001511f098";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
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
}
