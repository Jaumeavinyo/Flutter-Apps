import 'package:flutter/material.dart';

import 'App.dart';

void main() {
  runApp(MyApp());
  // MyApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Template",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
