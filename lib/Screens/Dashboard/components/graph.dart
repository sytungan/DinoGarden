import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphGroup extends StatefulWidget {
  @override
  _Group34WidgetState createState() => _Group34WidgetState();
}

class _Group34WidgetState extends State<GraphGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Color.fromRGBO(255, 255, 255, 1),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Biểu đồ sử dụng hệ thống',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(51, 51, 51, 1),
                fontFamily: 'Mulish',
                fontSize: 16,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            height: 288,
            child: Graph(),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            height: 46,
            child: Note(),
          )
        ],
      ),
    );
  }
}

class Graph extends StatefulWidget {
  @override
  _Group123WidgetState createState() => _Group123WidgetState();
}

class _Group123WidgetState extends State<Graph> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Group123Widget - GROUP

    return SizedBox(
        height: 288,
        child: Stack(children: [
          Positioned.fill(
              top: 100,
              left: 10,
              child: Column(
                children: [
                  Text(
                    'Type 01',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(1, 170, 79, 1),
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  Text(
                    '40%',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(1, 170, 79, 1),
                        fontFamily: 'Roboto',
                        fontSize: 50,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  )
                ],
              )),
          PieChart(PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: 130,
              sections: [
                PieChartSectionData(
                    color: Color(0xff1AB260),
                    radius: 65,
                    showTitle: false,
                    value: 37.5),
                PieChartSectionData(
                    color: Color(0xffB3E6CA),
                    radius: 65,
                    showTitle: false,
                    value: 25.0),
                PieChartSectionData(
                    color: Color(0xff7ED4A5), radius: 65, showTitle: false),
                PieChartSectionData(
                    color: Color(0xff3FBF7A),
                    radius: 65,
                    showTitle: false,
                    value: 22.34)
              ]))
        ]));
  }
}

class Note extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Expanded(
            child: Stack(
          children: [
            Positioned(
                child: Icon(
              Icons.album_rounded,
              color: Color(0xff1AB260),
            )),
            Positioned.fill(
              top: 5,
              left: 15,
              child: Text(
                'Watering',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff1AB260),
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            )
          ],
        )),
        Expanded(
            child: Stack(
          children: [
            Positioned(
                child: Icon(
              Icons.album_rounded,
              color: Color(0xff3FBF7A),
            )),
            Positioned.fill(
              top: 5,
              left: 15,
              child: Text(
                'Light on',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff3FBF7A),
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            )
          ],
        )),
        Expanded(
            child: Stack(
          children: [
            Positioned(
                child: Icon(
              Icons.album_rounded,
              color: Color(0xff7ED4A5),
            )),
            Positioned.fill(
              top: 5,
              left: 15,
              child: Text(
                'Light off',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff7ED4A5),
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            )
          ],
        )),
        Expanded(
            child: Stack(
          children: [
            Positioned(
                child: Icon(
              Icons.album_rounded,
              color: Color(0xffB3E6CA),
            )),
            Positioned.fill(
              top: 5,
              left: 15,
              child: Text(
                'Pump',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xffB3E6CA),
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            )
          ],
        )),
      ],
    ));
  }
}
