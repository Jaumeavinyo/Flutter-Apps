import 'package:aquarium/Widgets/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
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
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      'Day $_index Variables',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    //LastVariablesText(variables: variables),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Events',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 90,
                          child: RaisedButton(
                            child: Text('Add Event',
                                style: TextStyle(
                                  fontSize: 11,
                                )),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 30,
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, int index) {
                          return Container(
                            height: 30,
                            child: ListTile(
                              title: Text('Event $_index'),
                              leading: Container(
                                width: 10,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Day(index: index),
                );
              }))
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

class Day extends StatelessWidget {
  const Day({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: SizedBox(
        width: 300,
        height: 100,
        child: Center(
          child: Text(
            "Day ${index + 1}",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.green[400],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
