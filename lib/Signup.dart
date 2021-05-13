import 'package:flutter/material.dart';
import 'Login.dart';
class Signup extends StatefulWidget {
  final String string;

  Signup(this.string); // receiving "Foo" in 2nd
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding (
                padding: const EdgeInsets.only(left: 20.0, top: 99.0),
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
                                  "Create "
                                      "New Account",
                                  //overflow: TextOverflow.visible,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    height: 1.171875,
                                    fontSize: 30.0,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 1, 170, 79),
                                  )
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding (
                padding: const EdgeInsets.only(left: 40.0, top: 22.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Positioned.fill(
                      child: Column(
                        children: [
                          Row(
                            children: [

                               new Image.asset(
                                'images/key_signup.png',
                                height: 100,
                                width: 100,
                              ),

                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Row(
                    children: [
                      Container(
                        width: 360.0,
                        height: 500.0,
                        child: Container(
                            color: Color.fromARGB( 255, 214, 220, 226),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 28.0, top : 60.0),
                                child: Column(
                                  children: [
                                    Row(
                                        children:[ Text(
                                          'Sign Up'
                                              ''
                                              '',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              height: 1.171875,
                                              fontSize: 20.0,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromARGB(255, 102, 102, 102)
                                          ),
                                        ),
                                        ]

                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children:[
                                        Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children:[
                                                    SizedBox(
                                                      width:300,
                                                      child: TextField(
                                                        keyboardType: TextInputType.emailAddress,
                                                        decoration: InputDecoration(
                                                          hintText: "Enter your email",

                                                        ),
                                                      ),
                                                    )

                                                  ],
                                                ),

                                              ],
                                            )

                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children:[
                                        Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children:[
                                                    SizedBox(
                                                      width:300,
                                                      child: TextField(
                                                        keyboardType: TextInputType.emailAddress,
                                                        decoration: InputDecoration(
                                                          hintText: "Enter your password",

                                                        ),
                                                      ),
                                                    )

                                                  ],
                                                ),

                                              ],
                                            )

                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children:[
                                        Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children:[
                                                    SizedBox(
                                                      width:300,
                                                      child: TextField(
                                                        keyboardType: TextInputType.emailAddress,
                                                        decoration: InputDecoration(
                                                          hintText: "Re Enter your password",

                                                        ),
                                                      ),
                                                    )

                                                  ],
                                                ),

                                              ],
                                            )

                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children:[
                                        FlatButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(color: Colors.black12)),
                                          color: Color.fromARGB(255, 1, 170, 79),
                                          textColor: Color.fromARGB(255, 255, 255, 255),
                                          padding: EdgeInsets.all(8.0),
                                          minWidth: 300.0,
                                          onPressed: () {

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
                                    SizedBox(height: 10),
                                    Row(
                                      children:[
                                        FlatButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(color: Colors.grey)),

                                          textColor: Colors.grey,
                                          padding: EdgeInsets.all(8.0),
                                          minWidth: 300.0,
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
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
                              ),
                            )
                        ),

                      ),
                    ]
                ),
              ),



            ]
        )
    );
  }
}


