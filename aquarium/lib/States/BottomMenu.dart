import 'package:aquarium/Screens/CalendarScreen.dart';
import 'package:aquarium/Screens/ForumScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../App.dart';

/// This is the stateful widget that the main application instantiates.
class BottomMenu extends StatefulWidget {
  BottomMenu({Key key}) : super(key: key);

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => HomeScreen(),
          ),
        );
      } else if (index == 1) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => CalendarScreen(),
          ),
        );
      } else if (index == 2) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => ForumScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Forum',
          ),
        ],
        //currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[400],
        onTap: _onItemTapped,
      ),
    );
  }
}
