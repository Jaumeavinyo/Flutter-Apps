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
        child: Stack(
          children: [CreditCardWidgetComplete()],
        ),
      ),
    );
  }
}

//______________________________________________________________________________

class CreditCardWidgetComplete extends StatelessWidget {
  //final User userHomeVar;
  num money = 3000; //this should be taken from userHomeVar
  //const CreditCardWidgetComplete({this.userHomeVar});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: TopSectorCreditCard(
                heightVar: 100.0, widthVar: 250.0, moneyVar: money),
          ),
          Expanded(
            flex: 2,
            child: BotSectorCreditCard(heightVar: 100.0, widthVar: 250.0),
          ),
        ],
      ),
    );
  }
}

//______________________________________________________________________________

class TopSectorCreditCard extends StatelessWidget {
  final double heightVar;
  final double widthVar;
  final num moneyVar;

  TopSectorCreditCard({
    @required this.heightVar,
    @required this.widthVar,
    @required this.moneyVar,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: heightVar,
        width: widthVar,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
        child: Row(
          children: [
            Column(),
            Column(
              children: [
                Spacer(flex: 3),
                AddNumber(
                    numVar: moneyVar,
                    colorVar: Colors.blue,
                    fontSizeVar: 25,
                    boldVar: FontWeight.bold),
                Spacer(flex: 1),
              ],
            ),
            Column()
          ],
        ));
  }
}

//______________________________________________________________________________

class BotSectorCreditCard extends StatelessWidget {
  final double heightVar;
  final double widthVar;

  BotSectorCreditCard({
    @required this.heightVar,
    @required this.widthVar,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: heightVar,
      width: widthVar,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
    );
  }
}

//______________________________________________________________________________

class AddNumber extends StatelessWidget {
  //DONE
  AddNumber(
      {@required this.numVar, this.colorVar, this.fontSizeVar, this.boldVar});

  final num numVar;
  Color colorVar = Colors.black;
  num fontSizeVar = 15;
  FontWeight boldVar = FontWeight.normal;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$numVar',
      style: TextStyle(
        color: colorVar,
        fontSize: fontSizeVar,
        fontWeight: boldVar,
      ),
    );
  }
}
