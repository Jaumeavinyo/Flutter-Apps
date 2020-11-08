import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditCardWidgetComplete extends StatelessWidget {
  //final User userHomeVar;
  num totalMoneyVar;
  String nameVar;
  String surnameVar;
  num creditCardNumberVar;
  String expirationDateVar;
  //const CreditCardWidgetComplete({this.userHomeVar});
  CreditCardWidgetComplete({
    @required this.totalMoneyVar,
    @required this.nameVar,
    @required this.surnameVar,
    @required this.creditCardNumberVar,
    @required this.expirationDateVar,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 300,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: TopSectorCreditCard(
                      heightVar: 100.0,
                      widthVar: 270.0,
                      moneyVar: totalMoneyVar),
                ),
                Expanded(
                  flex: 2,
                  child: BotSectorCreditCard(
                    color: Colors.blue[900],
                    heightVar: 100.0,
                    widthVar: 270.0,
                    firstNumbersVar: 1312,
                    nameVar: nameVar,
                    surnameVar: surnameVar,
                    expiresVar: expirationDateVar,
                    cvvVar: "311",
                  ),
                ),
              ],
            ),
            Spacer(
              flex: 2,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 40,
                height: 30,
                child: Image.asset(
                  "../assets/chip.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ));
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
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Column(
              //LEFT COLUMN
              children: [
                Expanded(
                  child: Container(
                    width: 10,
                    height: 90,
                  ),
                  flex: 10,
                ),
                Expanded(
                  flex: 15,
                  child: Container(
                    child: Image.asset(
                      "../assets/visa.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: Container(
                    width: 70,
                  ),
                )
              ],
            ),
            Column(
              //MIDLE COLUMN
              children: [
                Expanded(
                  child: Container(
                    width: 70,
                    height: 90,
                  ),
                  flex: 3,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: AddNumber(
                      //money in credit card
                      numVar: moneyVar,
                      colorVar: Colors.blue,
                      fontSizeVar: 20,
                      boldVar: FontWeight.bold,
                      codificatedNumberVar: ",0",
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 90,
                  ),
                )
              ],
            ),
            Column(
              //RIGHT COLUMN
              //Here goes an image TODO
              children: [
                Expanded(
                  child: Container(
                    width: 90,
                    height: 90,
                  ),
                  flex: 10,
                ),
                Expanded(
                  flex: 30,
                  child: Container(
                    child: Image.asset(
                      "../assets/cardimage.png",
                      fit: BoxFit.fill,
                      alignment: Alignment.bottomLeft,
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    width: 90,
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

//______________________________________________________________________________

class BotSectorCreditCard extends StatelessWidget {
  final double heightVar;
  final double widthVar;
  num firstNumbersVar;
  String nameVar;
  String surnameVar;
  String expiresVar;
  String cvvVar;
  Color color;
  BotSectorCreditCard({
    @required this.heightVar,
    @required this.widthVar,
    @required this.firstNumbersVar,
    @required this.nameVar,
    @required this.surnameVar,
    @required this.expiresVar,
    @required this.cvvVar,
    @required this.color,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: heightVar,
        width: widthVar,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
        child: Row(
          children: [
            Spacer(
              flex: 1,
            ),
            Column(
              //MIDLE COLUMN
              children: [
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: AddNumber(
                      //money in credit card
                      numVar: firstNumbersVar,
                      colorVar: Colors.white,
                      fontSizeVar: 15,
                      boldVar: FontWeight.bold,
                      codificatedNumberVar: "**** **** ****",
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Card  Holder   expires   CVV      ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      ' $nameVar $surnameVar        $expiresVar     $cvvVar       ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ));
  }
}

//______________________________________________________________________________

class AddNumber extends StatelessWidget {
  //DONE
  AddNumber(
      {@required this.numVar,
      this.colorVar,
      this.fontSizeVar,
      this.boldVar,
      @required this.codificatedNumberVar});

  final num numVar;
  Color colorVar = Colors.black;
  num fontSizeVar = 13;
  FontWeight boldVar = FontWeight.normal;
  String codificatedNumberVar;
  @override
  Widget build(BuildContext context) {
    return Text(
      '\$ $numVar $codificatedNumberVar',
      style: TextStyle(
        color: colorVar,
        fontSize: fontSizeVar,
        fontWeight: boldVar,
      ),
    );
  }
}
