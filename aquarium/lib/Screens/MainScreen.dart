import 'package:aquarium/Widgets/Schedule.dart';
import 'package:aquarium/Widgets/Forum.dart';
import 'package:aquarium/Widgets/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// This is the stateful widget that the main application instantiates.
class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @required
  List<Event> Events; //CALENDAR_OP
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Event> _getDataSource() {
      //CALENDAR_OP
      Events = <Event>[];
      final DateTime today = DateTime.now();
      final DateTime startTime =
          DateTime(today.year, today.month, today.day, 9, 0, 0);
      final DateTime endTime = startTime.add(const Duration(hours: 2));
      Events.add(Event(
          'WATER CHANGE', startTime, endTime, const Color(0xFF0F8644), false));
      return Events;
    }

    if (_selectedIndex == 1)
      return Scaffold(
        appBar: AppBar(
          title: Text('My Aquarium', style: TextStyle(color: Colors.white)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ),
        body: Home(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              label: 'Forum',
            ),
          ],
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
        ),
      );
    else if (_selectedIndex == 0)
      return Scaffold(
        appBar: AppBar(
          title: Text('Schedule', style: TextStyle(color: Colors.white)),
        ),
        body: SfCalendar(
          //CALENDAR_OP
          view: CalendarView.month,
          dataSource: EventDataSource(_getDataSource()),
          monthViewSettings: MonthViewSettings(
              numberOfWeeksInView: 4,
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              label: 'Forum',
            ),
          ],
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
        ),
      );
    else if (_selectedIndex == 2)
      return Scaffold(
        appBar: AppBar(
          title: Text('Forum', style: TextStyle(color: Colors.white)),
        ),
        body: Forum(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              label: 'Forum',
            ),
          ],
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
        ),
      );
  }
}
