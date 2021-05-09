import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        child: FloatingActionButton(
          onPressed: () async {
            print("hhehe");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChildHomeScreen()));
          },
          tooltip: 'Add trend',
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
      body: Text("hehehe"),
    );
  }
}
