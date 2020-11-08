import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BankScreen.dart';

/*
var integer;
var integerOne;
class HolaMundo{
}
void Function(){
}
*/

class CreditCard {
  final String name;
  final String surname;
  final double money;
  final double creditCardNumber;
  final String expirationDate;
  CreditCard(
      {this.surname,
      this.name,
      this.creditCardNumber,
      this.expirationDate,
      this.money});
}

class User {
  //User es la pantalla entera y todo lo que es modificable

  final String name;
  final String surname;
  final double money;
  final double creditCardNumber;
  final String expirationDate;
  final CreditCard card;
  User(
      {this.surname,
      this.name,
      this.money,
      this.creditCardNumber,
      this.expirationDate,
      this.card});
}

final userHome = User(
  card: CreditCard(
      surname: "Cena",
      name: "jhon",
      creditCardNumber: 1312,
      expirationDate: "8/11",
      money: 2567),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bank Layout",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BankScreen(userHomeVar: userHome),
    );
  }
}
