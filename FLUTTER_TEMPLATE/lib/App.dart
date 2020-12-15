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
                height: 40,
                child: RaisedButton(
                  child: Text("hello"),
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
          ),
        ));
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
