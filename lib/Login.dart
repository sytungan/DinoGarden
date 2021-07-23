import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dinogarden/api/login_api.dart';
import 'package:dinogarden/model/login_model.dart';
import 'Signup.dart';
import 'HomeScreen.dart';

import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(0.2),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 25),
                        Text(
                          "Login",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              height: 1.171875,
                              fontSize: 35.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 102, 102, 102)),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (input) => loginRequestModel.email = input,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                            EmailValidator(errorText: "Enter valid email id"),
                          ]),
                          decoration: new InputDecoration(
                            hintText: "Enter your account",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green.withOpacity(0.2))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(width: 0, color: Colors.green)),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (input) => loginRequestModel.pass = input,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                            MinLengthValidator(6,
                                errorText:
                                    "Password should be atleast 6 characters"),
                            MaxLengthValidator(15,
                                errorText:
                                    "Password should not be greater than 15 characters")
                          ]),
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                            hintText: " Enter your password",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green.withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Colors.grey.withOpacity(0.5),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black12)),
                          color: Color.fromARGB(255, 1, 170, 79),
                          textColor: Color.fromARGB(255, 255, 255, 255),
                          padding: EdgeInsets.all(8.0),
                          minWidth: 300.0,
                          onPressed: () {
                            if (validateAndSave()) {
                              print(loginRequestModel.toJson());

                              setState(() {
                                isApiCallProcess = true;
                              });

                              APIService apiService = new APIService();
                              apiService.login(loginRequestModel).then((value) {
                                if (value != null) {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });

                                  if (value.status == "Đăng nhập thành công!") {
                                    final snackBar = SnackBar(
                                        content: Text("Login Successful"));
                                    scaffoldKey.currentState
                                        .showSnackBar(snackBar);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => HomeScreen(
                                                value.id, value.name)));
                                  } else if (value.status == "Sai email!") {
                                    final snackBar = SnackBar(
                                        content: Text("Sai tài khoản"));
                                    scaffoldKey.currentState
                                        .showSnackBar(snackBar);
                                  } else {
                                    final snackBar =
                                        SnackBar(content: Text("Sai mật khẩu"));
                                    scaffoldKey.currentState
                                        .showSnackBar(snackBar);
                                  }
                                }
                              });
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        FlatButton(
                          textColor: Colors.grey,
                          padding: EdgeInsets.all(8.0),
                          minWidth: 300.0,
                          onPressed: () {},
                          child: Text(
                            "Forgot password",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.grey)),
                          textColor: Colors.grey,
                          padding: EdgeInsets.all(8.0),
                          minWidth: 300.0,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => Signup("Sign Up")));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
