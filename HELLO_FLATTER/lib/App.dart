import 'package:HELLO_FLATTER/widgets/CreditCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
var integer;
var integuerOne;
class HolaMundo{
}
void Function(){
}
*/

class CreditCard {
  final String name;
  final num money;
  final num creditCardNumber;
  final num expirationDate;
  CreditCard(
      {this.name, this.creditCardNumber, this.expirationDate, this.money});
}

class User {
  //User es la pantalla entera y todo lo que es modificable
  final num userID;
  final String name;
  final num money;
  final num creditCardNumber;
  final num expirationDate;
  final CreditCard card;
  User(
      {this.userID,
      this.name,
      this.money,
      this.creditCardNumber,
      this.expirationDate,
      this.card});
}

final userHome = User(
  userID: 1,
  name: "juanito",
  money: 300,
  creditCardNumber: 1234,
  expirationDate: 2307,
  card: CreditCard(
      name: userHome.name,
      creditCardNumber: userHome.creditCardNumber,
      expirationDate: userHome.expirationDate,
      money: userHome.money),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello Fluuter",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 2,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Expanded(
              flex: 2,
              child: Container(color: Colors.blue.shade700),
            ),
            Expanded(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade700,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
