import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditCardWidgetComplete extends StatelessWidget {
  //final User userHomeVar;
  double totalMoneyVar;
  String nameVar;
  String surnameVar;
  double creditCardNumberVar;
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
        height: 150,
        width: 216,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            bottomLeft: Radius.circular(18),
          ),
          border: Border.all(
            color: Colors.blue[700],
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(-5, 0),
              blurRadius: 10,
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: TopSectorCreditCard(
                      heightVar: 75.0,
                      widthVar: 216.0,
                      moneyVar: totalMoneyVar),
                ),
                Expanded(
                  flex: 2,
                  child: BotSectorCreditCard(
                    color: Colors.blue[700],
                    heightVar: 75.0,
                    widthVar: 216.0,
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
                height: 22,
                child: Image.asset(
                  'assets/images/chip.png',
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
  final double moneyVar;

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
            topLeft: Radius.circular(16),
          ),
        ),
        child: Row(
          children: [
            Column(
              //LEFT COLUMN
              children: [
                Spacer(flex: 10),
                Expanded(
                  flex: 15,
                  child: Container(
                    width: 50,
                    child: Image.asset(
                      'assets/images/visa.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Spacer(flex: 40)
              ],
            ),
            Column(
              //MIDLE COLUMN
              children: [
                Spacer(flex: 3),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 90,
                    child: AddNumber(
                      //money in credit card
                      numVar: moneyVar,
                      colorVar: Colors.blue,
                      fontSizeVar: 20,
                      boldVar: FontWeight.bold,
                      codificatedNumberVar: "",
                    ),
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
            Column(
              //RIGHT COLUMN
              //Here goes an image TODO
              children: [
                Spacer(flex: 10),
                Expanded(
                  flex: 50,
                  child: Container(
                    child: Image.asset(
                      'assets/images/cardimage.png',
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomLeft,
                    ),
                  ),
                ),
                Spacer(flex: 10),
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
  double firstNumbersVar;
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
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16))),
        child: Row(
          children: [
            Spacer(
              flex: 2,
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
                      fontSizeVar: 12,
                      boldVar: FontWeight.w500,
                      codificatedNumberVar: "**** **** ****",
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Card  Holder      Expires   CVV        ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      ' $nameVar $surnameVar          $expiresVar       $cvvVar        ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
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

  final double numVar;
  Color colorVar = Colors.black;
  double fontSizeVar = 13;
  FontWeight boldVar = FontWeight.normal;
  String codificatedNumberVar;
  @override
  Widget build(BuildContext context) {
    numVar.round();
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
