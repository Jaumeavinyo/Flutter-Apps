import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade50,
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
                        child: GreenButton(
                          //FIRST MAIN BUTTON
                          radiusVar: 10,
                          borderColorVar: Colors.black,
                          borderWidthVar: 2,
                          buttonTextVar: "Calendar",
                          colorVar: Colors.blue.shade200,
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
                        child: GreenButton(
                          //FIRST MAIN BUTTON
                          radiusVar: 10,
                          borderColorVar: Colors.black,
                          borderWidthVar: 2,
                          buttonTextVar: "Aquarium",
                          colorVar: Colors.green.shade200,
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
                        child: GreenButton(
                          //FIRST MAIN BUTTON
                          radiusVar: 10,
                          borderColorVar: Colors.black,
                          borderWidthVar: 2,
                          buttonTextVar: "Forum",
                          colorVar: Colors.purple.shade200,
                        ),
                      )
                    ],
                  )),
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
