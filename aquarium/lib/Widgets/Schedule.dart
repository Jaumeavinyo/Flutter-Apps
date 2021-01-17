import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
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
  String _color;
  DateTime _start;
  DateTime _end;
  bool _insideEvent = false;
  List<Event> Events; //CALENDAR_OP

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
    _text = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _text.dispose();
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

  Widget _buildAlertDialog() {
    return AlertDialog(
      title: Text('Delete Events'),
      content: Text("Are you sure you want to delete all your Events?"),
      actions: [
        FlatButton(
            child: Text("Yes"),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.of(context).pop(true);
            }),
        FlatButton(
            child: Text("No"),
            textColor: Colors.red,
            onPressed: () {
              Navigator.of(context).pop(false);
            }),
      ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                    child: Text('Delete Events',
                        style: TextStyle(color: Colors.white)),
                    color: Colors.red,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => _buildAlertDialog(),
                      ).then((result) {
                        if (result == true)
                          for (int i = 0; i < docs.length; i++) {
                            FirebaseFirestore.instance
                                .collection('Aquariums')
                                .doc(
                                    '${FirebaseAuth.instance.currentUser.email}')
                                .collection('Events')
                                .doc(docs[i].id)
                                .delete();
                          }
                      });
                    }),
                RaisedButton(
                    child: Text('Add Event',
                        style: TextStyle(color: Colors.white)),
                    color: Colors.lightBlue,
                    onPressed: () {
                      setState(() {
                        _insideEvent = !_insideEvent;
                      });
                    }),
              ],
            ),
          ],
        ),
      );
    else if (_insideEvent == true) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DateTimePicker(
                type: DateTimePickerType.dateTime,
                initialValue: '',
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                dateLabelText: 'Start',
                onChanged: (val) {
                  _start = DateTime.parse(val);
                },
              ),
              DateTimePicker(
                type: DateTimePickerType.dateTime,
                initialValue: '',
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                dateLabelText: 'End',
                onChanged: (val) {
                  _end = DateTime.parse(val);
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Text',
                ),
                controller: _text,
                onSubmitted: (newValue) {
                  _text.text = newValue;
                },
              ),
              SizedBox(height: 25),
              CircleColorPicker(
                textStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                initialColor: Colors.pink,
                onChanged: (color) {
                  String redzero = '';
                  String greenzero = '';
                  String bluezero = '';
                  if (color.red.toRadixString(16).length == 1) {
                    redzero = '0';
                  } else {
                    redzero = '';
                  }
                  if (color.blue.toRadixString(16).length == 1) {
                    bluezero = '0';
                  } else {
                    bluezero = '';
                  }
                  if (color.green.toRadixString(16).length == 1) {
                    greenzero = '0';
                  } else {
                    greenzero = '';
                  }
                  _color =
                      '$redzero${color.red.toRadixString(16)}$greenzero${color.green.toRadixString(16)}$redzero${color.blue.toRadixString(16)}';
                  print(_color);
                },
                size: const Size(240, 240),
                strokeWidth: 4,
                thumbSize: 36,
              ),
              SizedBox(height: 30),
              RaisedButton(
                  color: Colors.lightBlue,
                  child: Text('Create Event',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      )),
                  onPressed: () {
                    if (_start != null &&
                        _end != null &&
                        _text.text != null &&
                        _color != null)
                      FirebaseFirestore.instance
                          .collection('Aquariums')
                          .doc('${FirebaseAuth.instance.currentUser.email}')
                          .collection('Events')
                          .doc(
                              '${_start.year}${_start.month}${_start.day}${_start.hour}${_start.minute}')
                          .set({
                        'Texto': _text.text,
                        'Inicio': _start,
                        'Fin': _end,
                        'Color': _color,
                      });
                    setState(() {
                      _insideEvent = !_insideEvent;
                    });
                  }),
              SizedBox(height: 50),
              Container(
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.lightBlue,
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      _insideEvent = !_insideEvent;
                    });
                  },
                  color: Colors.white,
                ),
              ),
            ],
          ),
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
