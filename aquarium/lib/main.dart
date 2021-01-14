import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/MainScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aquarium",
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: MainScreen(),
    );
  }
}
