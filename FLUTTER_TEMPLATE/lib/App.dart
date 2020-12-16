import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      // bottomNavigationBar: BottomMenu(),
      body: BottomMenu(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class BottomMenu extends StatefulWidget {
  BottomMenu({Key key}) : super(key: key);

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

/// This is the private State class that goes with BottomMenu.
class _BottomMenuState extends State<BottomMenu> {
  // int _selectedIndex = 0;

  /*static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'Calendar',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'Forum',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  ];*/

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => HomeScreen(),
          ),
        );
      } else if (index == 1) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CalendarScreen(),
          ),
        );
      } else if (index == 2) {
        Navigator.of(context).push(
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
      appBar: AppBar(
        title: const Text('Welcome back!'),
      ),
      /* body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),*/
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

class GreenButton extends StatelessWidget {
  num radiusVar = 10;
  String buttonTextVar = "example text 1";
  Color colorVar = Colors.green;
  Color borderColorVar = Colors.black;
  num borderWidthVar = 2;

  GreenButton({
    @required this.radiusVar,
    @required this.borderColorVar,
    @required this.borderWidthVar,
    @required this.buttonTextVar,
    @required this.colorVar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: colorVar,
        border: Border.all(
          color: borderColorVar,
          width: borderWidthVar,
        ),
        borderRadius: BorderRadius.all(Radius.circular(radiusVar)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text("$buttonTextVar"),
              Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: 1,
                  )),
              FlatButton(
                child: Text(
                  ">",
                  style: TextStyle(fontSize: 30),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => HomeScreen(),
                    ),
                  );
                },
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 1,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Calendar"),
        backgroundColor: Colors.blue.shade200,
      ),
    );
  }
}

class ForumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forum"),
        backgroundColor: Colors.blue.shade200,
      ),
    );
  }
}
