import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
        body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding (
              padding: const EdgeInsets.only(left: 40.0, top: 99.0),
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
                                    "Welcome Back",
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
                              // Row(
                              //   children: [
                              //     Text(
                              //         "       Dino Garden",
                              //         //overflow: TextOverflow.visible,
                              //         textAlign: TextAlign.left,
                              //         style: TextStyle(
                              //           height: 1.171875,
                              //           fontSize: 30.0,
                              //           fontFamily: 'Roboto',
                              //           fontWeight: FontWeight.w700,
                              //           color: Color.fromARGB(242, 173, 14, 27),
                              //         )
                              //     ),
                              //   ],
                              // ),

                    ],
                  ),
                )
              ],
            ),
          ),
          // Padding (
          //   padding: const EdgeInsets.only(left: 40.0, top: 22.0),
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Positioned.fill(
          //         child: Column(
          //           children: [
          //             Row(
          //               children: [
          //                  Image.asset(
          //                   'images/Key_login.png',
          //                   height: 100,
          //                   width: 100,
          //                 ),
          //
          //               ],
          //             ),
          //
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // ),

           Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Row(
              children: [
                  Container(
                    width: 360.0,
                    height: 441.0,
                      child: Container(
                        color: Color.fromARGB( 255, 214, 220, 226),
                        child: Center(
                          child: Padding(
                          padding: const EdgeInsets.only(left: 28.0, top : 100.0),
                          child: Column(
                            children: [
                              Row(
                                children:[ Text(
                                    'Login'
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
                                                    suffixIcon: Icon(Icons.print),
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
