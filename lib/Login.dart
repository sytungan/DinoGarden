import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'Signup.dart';
// import 'package:passwordfield/passwordfield.dart';

class Login extends StatefulWidget {
  Login({
    Key key,
  }) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 80.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Positioned.fill(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                              "Welcome\n"
                              "Back",
                              //overflow: TextOverflow.visible,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                height: 1.171875,
                                fontSize: 30.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 1, 170, 79),
                              )),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              color: Color.fromARGB(255, 214, 220, 226),
              constraints: BoxConstraints(
                maxHeight: 528,
                maxWidth: 400,
              ),
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 28.0, top: 10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Image.asset(
                            'images/Key_login.png',
                            height: 60,
                            width: 60,
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(children: [
                        Text(
                          'Login'
                          ''
                          '',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              height: 1.171875,
                              fontSize: 20.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 102, 102, 102)),
                        ),
                      ]),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                              child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        hintText: "Enter your email",
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                width: 0, color: Colors.green)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ))
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                              child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 300,

                                    // child: PasswordField(
                                    //   color: Colors.green,
                                    //   hasFloatingPlaceholder: true,
                                    //   hintText: "Enter your password",

                                    //   pattern: r'.*[a-zA-z0-9].*',
                                    //   // border: OutlineInputBorder(
                                    //   //     borderRadius: BorderRadius.circular(2),
                                    //   //     borderSide: BorderSide(width: 0, color: Colors.green)),
                                    //   focusedBorder: OutlineInputBorder(
                                    //       borderRadius: BorderRadius.circular(10),
                                    //       borderSide: BorderSide(width: 0, color: Colors.green)),

                                    // ),
                                  )
                                ],
                              ),
                            ],
                          ))
                        ],
                      ),
                      SizedBox(height: 40),
                      Row(
                        children: [
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.black12)),
                            color: Color.fromARGB(255, 1, 170, 79),
                            textColor: Color.fromARGB(255, 255, 255, 255),
                            padding: EdgeInsets.all(8.0),
                            minWidth: 300.0,
                            onPressed: () {},
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
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
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
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
                    ],
                  ),
                ),
              )),
        ]));
  }
}
