import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade700,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Welcome back Jaume",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 120,
              ),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: GreenButton(),
                        /*
                        child: RaisedButton(
                          child: Text("example text"),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => SecondScreen(),
                              ),
                            );
                          },
                        ),*/
                      )
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          child: Text("example text"),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => SecondScreen(),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          child: Text("example text"),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => SecondScreen(),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ))
              /*RaisedButton(
                child: Text("Calendar"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => SecondScreen(),
                    ),
                  );
                },
              ),
              RaisedButton(
                child: Text("Your aquarium"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => SecondScreen(),
                    ),
                  );
                },
              ),
              RaisedButton(
                child: Text("Forum"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => SecondScreen(),
                    ),
                  );
                },
              ),*/
            ],
          ),
        ));
  }
}

class GreenButton extends StatelessWidget {
  num radiusVar = 10;
  String buttonTextVar = "example text 1";
  Color colorVar = Colors.green;
  Color borderColorVar = Colors.black;
  num borderWidthVar = 2;
  num textLeftSpaceVar = 20;
  GreenButton({
    Key key,
  }) : super(key: key);

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
                width: textLeftSpaceVar,
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
                      builder: (_) => SecondScreen(),
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

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("choose a color"),
      ),
    );
  }
}
