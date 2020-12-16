import 'package:HELLO_FLATTER/States/BottomMenu.dart';
import 'package:flutter/material.dart';

class ForumScreen extends StatefulWidget {
  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      appBar: AppBar(
        title: Text("Forum"),
        backgroundColor: Colors.blue.shade600,
      ),
      body: BottomMenu(),
    );
  }
}
