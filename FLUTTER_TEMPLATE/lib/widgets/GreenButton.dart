import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../App.dart';

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
