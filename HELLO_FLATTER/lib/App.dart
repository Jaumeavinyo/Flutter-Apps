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
  final num user_id;
  final String name;
  final num money;
  final num creditCardNumber;
  final num expirationDate;
  final CreditCard card;
  User(
      {this.user_id,
      this.name,
      this.money,
      this.creditCardNumber,
      this.expirationDate,
      this.card});
}

final userHome = User(
  user_id: 1,
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
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Hello World"),
      ),
    );
  }
}
