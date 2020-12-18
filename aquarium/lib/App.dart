import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'States/BottomMenu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[400],
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blue.shade600,
      ),
      // bottomNavigationBar: BottomMenu(),
      body: BottomMenu(),
    );
  }
}

/// This is the private State class that goes with BottomMenu.
