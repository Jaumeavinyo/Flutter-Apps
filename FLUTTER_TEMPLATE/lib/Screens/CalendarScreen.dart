import 'package:HELLO_FLATTER/States/BottomMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[400],
        appBar: AppBar(
          title: Text("Personal Calendar"),
          backgroundColor: Colors.blue.shade600,
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.blue),
            ),
            //BottomMenu(),
          ],
        ));
  }
}
