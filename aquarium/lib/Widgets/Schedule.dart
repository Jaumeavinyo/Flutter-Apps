import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
//import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

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

class Schedule extends StatefulWidget {
  CalendarController _controller;

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  CalendarController _controller;
  TextEditingController _text;
  TextEditingController _start;
  TextEditingController _end;
  Color _color;
  bool _insideEvent = false;
  List<Event> Events; //CALENDAR_OP

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
    List<Event> _getDataSource() {
      //CALENDAR_OP
      Events = <Event>[];
      for (int i = 0; i < docs.length; i++) {
        Events.add(Event(
            docs[i]['Texto'],
            docs[i]['Inicio'].toDate(),
            docs[i]['Fin'].toDate(),
            Color(int.parse("0xFF${docs[i]['Color']}")),
            false));
      }
      return Events;
    }

    bool insideEvent = _insideEvent;
    DateTime firstday = DateTime.utc(DateTime.now().year, DateTime.now().month);
    CalendarTapDetails selectedDetails;

    if (insideEvent == false)
      return Padding(
        padding:
            const EdgeInsets.only(top: 30, bottom: 60, right: 10, left: 10),
        child: Column(
          children: [
            Expanded(
              child: SfCalendar(
                showDatePickerButton: true,
                onTap: (details) {
                  selectedDetails = details;
                },
                view: CalendarView.month,
                dataSource: EventDataSource(_getDataSource()),
                monthViewSettings: MonthViewSettings(
                  numberOfWeeksInView: 5,
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment,
                  showAgenda: true,
                  showTrailingAndLeadingDates: false,
                ),
                headerStyle: CalendarHeaderStyle(
                  textStyle: TextStyle(fontSize: 22),
                ),
                firstDayOfWeek: 1,
                initialSelectedDate: DateTime.now(),
                initialDisplayDate: firstday,
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
                child: Text('Add Event'),
                onPressed: () {
                  setState(() {
                    _insideEvent = !_insideEvent;
                  });
                }),
          ],
        ),
      );
    else if (_insideEvent == true) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select Color',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 15),
            CircleColorPicker(
              initialColor: Colors.blue,
              onChanged: (color) {
                _color = color;
              },
              size: const Size(240, 240),
              strokeWidth: 4,
              thumbSize: 36,
            ),
            SizedBox(height: 50),
            RaisedButton(
                color: Colors.lightBlue,
                child: Text('Create Event',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    )),
                onPressed: () {
                  setState(() {
                    _insideEvent = !_insideEvent;
                  });
                }),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final events = FirebaseFirestore.instance
        .collection('Aquariums')
        .doc('${user.email}')
        .collection('Events');
    return StreamBuilder(
      stream: events.snapshots(),
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
