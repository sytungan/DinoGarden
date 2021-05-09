import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String runtime = "2h";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#C7F9CC"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Stack(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.25,
                      blurRadius: 5,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'pump.png',
                        height: 50,
                        width: 50,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Máy bơm ABCXYZ",
                            style: GoogleFonts.muli(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            "Running",
                            style: GoogleFonts.muli(
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                textStyle:
                                    TextStyle(color: HexColor("#D3D3D3"))),
                          ),
                          Text(
                            "Run time: " + runtime,
                            style: GoogleFonts.muli(
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                textStyle:
                                    TextStyle(color: HexColor("#D3D3D3"))),
                          ),
                        ],
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Icon(
                          Icons.chevron_right,
                          size: 30,
                        ),
                        tooltip: 'Go detail',
                        color: HexColor("#0C9359"),
                        onPressed: () {
                          print("Pressed detail");
                        },
                      ),
                      flex: 1,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        child: FloatingActionButton(
          onPressed: () async {
            print("hhehe");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChildHomeScreen()));
          },
          tooltip: 'Add new',
          child: const Icon(Icons.add),
        ),
        visible: true,
      ),
    );
  }
}

class ChildHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("next page"),
    );
  }
}
