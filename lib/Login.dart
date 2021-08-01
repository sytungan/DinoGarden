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
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  color: Colors.white,
                  constraints: BoxConstraints(
                    minHeight: 600, //minimum height
                    minWidth: 400, // minimum width
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: MediaQuery.of(context).size.height,
                    //maximum width set to 100% of width
                  ),
                ),
                Positioned(
                  top: 300.0,
                  child: Container(
                    // alignment: Alignment.bottomCenter,
                    constraints: BoxConstraints(
                      minHeight: 550, //minimum height
                      minWidth: 400, // minimum width

                      maxHeight: MediaQuery.of(context).size.height,

                      maxWidth: MediaQuery.of(context).size.width,
                      //maximum width set to 100% of width
                    ),
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    // margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFeceff1),
                    ),
                    child: Form(
                      key: globalFormKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(0.0),
                            child: Text("Login",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  height: 1.171875,
                                  fontSize: 24.0,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF90a4ae),
                                )),
                          ), //Container
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
                                  borderSide: BorderSide(
                                      width: 0, color: Colors.green)),
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
                                      "Password should be at least 6 characters"),
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
                            textColor: Color(0xffeceff1),
                            padding: EdgeInsets.all(8.0),
                            minWidth: 300.0,
                            onPressed: () {
                              if (validateAndSave()) {
                                print(loginRequestModel.toJson());

                                setState(() {
                                  isApiCallProcess = true;
                                });

                                APIService apiService = new APIService();
                                apiService
                                    .login(loginRequestModel)
                                    .then((value) {
                                  if (value != null) {
                                    setState(() {
                                      isApiCallProcess = false;
                                    });

                                    if (value.status ==
                                        "Đăng nhập thành công!") {
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
                                      final snackBar = SnackBar(
                                          content: Text("Sai mật khẩu"));
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
                                color: Color.fromARGB(255, 255, 255, 230),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          FlatButton(
                            textColor: Color(0xFF90a4ae),
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
                                color: Color(0xFF90a4ae),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 260.0,
                  left: 20,
                  child: Container(
                      // padding: EdgeInsets.all(15.0),
                      child: Image(
                          width: 70.0,
                          height: 70.0,
                          image: AssetImage('images/Key_login.png'))),
                ), //Container
                Positioned(
                  top: 100.0,
                  left: 20,
                  child: Container(
                    // padding: EdgeInsets.all(15.0),
                    child: Text("Login \naccount",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          height: 1.2,
                          fontSize: 35.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.lerp(
                              FontWeight.w900, FontWeight.w900, 1.5),
                          color: Color(0xff00e676),
                        )),
                  ),
                ), //Container
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
