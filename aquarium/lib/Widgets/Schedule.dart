//########################

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventDataSource extends CalendarDataSource {
  List<Event> meetings;
  EventDataSource(List<Event> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }
}

class Event {
  Event(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

/*
class Schedule extends StatefulWidget {
  CalendarController _controller;

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  CalendarController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget _buildErrorPage(String error) {
    return Center(
      child: Text(
        error,
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSchedule(QuerySnapshot snapshot) {
    final docs = snapshot.docs;
    final aquarium = docs[0];
    int _index = 0;

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: <Widget>[
          TableCalendar(
            calendarController: _controller,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final aquariums = FirebaseFirestore.instance.collection('Aquariums');
    return StreamBuilder(
      stream: aquariums.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return _buildErrorPage(snapshot.error.toString());
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return _buildLoading();
          case ConnectionState.active:
            return _buildSchedule(snapshot.data);
          default: // ConnectionState.none  // ConnectionState.done
            return _buildErrorPage("Unreachable!!!");
        }
      },
    );
  }
}

*/
