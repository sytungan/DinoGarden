import 'package:flutter/material.dart';
import 'Login.dart';

class Signup extends StatefulWidget {
  final String string;

  Signup(this.string); // receiving "Foo" in 2nd
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _checkboxListTile = false;
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
                              "Create\n "
                              "New Account",
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
          Center(
              child: Container(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 28.0, right: 10.0, bottom: 10.0),
                  height: 528,
                  width: 400,
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  color: Color.fromARGB(255, 214, 220, 226),
                  child: ListView(children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            new Image.asset(
                              'images/key_signup.png',
                              height: 60,
                              width: 60,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(children: [
                          Text(
                            'Sign Up',
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
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          hintText: "Enter your email",
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  width: 0,
                                                  color: Colors.green)),
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
                                      child: TextField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          hintText: "Enter your password",
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  width: 0,
                                                  color: Colors.green)),
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
                                      child: TextField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          hintText: "Re Enter your password",
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  width: 0,
                                                  color: Colors.green)),
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
                          children: <Widget>[
                            Checkbox(
                              value: _checkboxListTile,
                              onChanged: (bool value) {
                                setState(() {
                                  _checkboxListTile = value;
                                });
                              },
                            ),
                            Text('Agree app Policy and Term',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w100,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey)),
                          ],
                        ),
                        SizedBox(height: 10),
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
                                "Sign Up",
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
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.grey)),
                              textColor: Colors.grey,
                              padding: EdgeInsets.all(8.0),
                              minWidth: 300.0,
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) => Login()));
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ])))
        ]));
  }
}
