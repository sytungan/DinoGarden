import 'package:dinogarden/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class APIService {
  Future<LoginResponseModel> login (LoginRequestModel requestModel) async{
    String url = "https://testdinogarden.herokuapp.com/auth/signInUser";
    final response = await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 200  )
      {

        return LoginResponseModel.fromJson(json.decode(response.body));

      }
    else{
      throw Exception("Failed to login");
    }
  }

  Future<SignupResponseModel> signup (SignupRequestModel requestModel) async{
    String url_check = "https://testdinogarden.herokuapp.com/auth/check_mail";
    final response = await http.post(Uri.parse(url_check), body: requestModel.toJson_Check());
    if (response.statusCode == 200 )
    {

      if (response.body == 'true') {
        String url = "https://testdinogarden.herokuapp.com/auth/signup";
        final response_2 = await http.post(
            Uri.parse(url), body: requestModel.toJson());
        if (response_2.statusCode == 200) {

          return SignupResponseModel.fromCheck(response_2.body);
        }
        else {
          throw Exception("Failed to login");
        }
      }
      else{
        return SignupResponseModel.fromCheck("Duplicate");
      }
    }
    else{
      throw Exception("Failed to check Mail");
    }

  }

}