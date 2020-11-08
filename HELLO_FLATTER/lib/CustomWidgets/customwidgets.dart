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

//############################# ENRIC CODE

class WindowBar extends StatelessWidget {
  const WindowBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: Colors.blue[700],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -4),
                  blurRadius: 3,
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            BarButton(
              icon: Icons.account_balance_wallet,
              text: "Wallet",
              selected: false,
            ),
            Spacer(flex: 3),
            BarButton(
              icon: Icons.data_usage,
              text: "Statistik",
              selected: false,
            ),
            Spacer(flex: 3),
            BarButton(
              icon: Icons.compare_arrows,
              text: "Transactions",
              selected: true,
            ),
            Spacer(flex: 3),
            BarButton(
              icon: Icons.mail,
              text: "Message",
              selected: false,
            ),
            Spacer(flex: 3),
            BarButton(
              icon: Icons.person,
              text: "Profile",
              selected: false,
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

//_____________________________________________________________________________

class BarButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool selected;

  BarButton({
    @required this.icon,
    @required this.text,
    @required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    if (!selected)
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Spacer(flex: 200),
          Icon(
            icon,
            size: 22,
            color: Colors.white,
          ),
          Spacer(),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(),
        ],
      );
    else if (selected)
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Spacer(flex: 200),
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(
                Radius.circular(9),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, -2),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 32,
              color: Colors.blue[700],
            ),
          ),
          Spacer(flex: 3),
          Container(
            height: 3,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
          Spacer(flex: 3),
        ],
      );
  }
}

//_____________________________________________________________________________

class Transaction extends StatelessWidget {
  const Transaction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Spacer(flex: 1),
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            border: Border.all(
              color: Colors.orange[50],
              width: 1,
            ),
          ),
          child: Center(
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
        ),
        Spacer(flex: 5),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Buy',
                style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '24 Sept 2020',
                style: TextStyle(
                  color: Colors.blueGrey[200],
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        Spacer(flex: 45),
        Text(
          '+336,5',
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

//_____________________________________________________________________________

class TransactionButton extends StatelessWidget {
  final Color color;
  final String action;
  final IconData icon;

  const TransactionButton({
    @required this.color,
    @required this.action,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Color shadowcolor = color.withAlpha(150);

    return Container(
      height: 33,
      width: 125,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(17),
        ),
        boxShadow: [
          BoxShadow(
            color: shadowcolor,
            offset: Offset(0, 3),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacer(flex: 3),
          Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              size: 18,
              color: color,
            ),
          ),
          Spacer(flex: 15),
          Text(
            '$action now',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(flex: 25),
        ],
      ),
    );
  }
}

//_____________________________________________________________________________

class Wallet extends StatelessWidget {
  final Color color;
  final String currency;
  final double quantity;
  final double percentage;
  final bool isPositive;
  final bool isShadowRight;
  final bool isShadowLeft;

  const Wallet({
    @required this.color,
    @required this.currency,
    @required this.quantity,
    @required this.percentage,
    @required this.isPositive,
    @required this.isShadowRight,
    @required this.isShadowLeft,
  });

  @override
  Widget build(BuildContext context) {
    String sign = '-';
    if (isPositive) {
      sign = '+';
    }
    double dxshadow = 0;
    if (isShadowRight) {
      dxshadow = 1;
    } else if (isShadowLeft) {
      dxshadow = -1;
    }
    return Container(
      height: 106,
      width: 86,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(17),
        ),
        boxShadow: [
          BoxShadow(
            color: color,
            offset: Offset(dxshadow, 0),
            blurRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 40),
            Text(
              currency,
              style: TextStyle(
                color: Colors.grey[100],
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(flex: 5),
            Text(
              '$quantity BTC',
              style: TextStyle(
                color: Colors.grey[100],
                fontSize: 9,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(flex: 2),
            Container(
              height: 13,
              width: 32,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.all(
                  Radius.circular(17),
                ),
              ),
              child: Center(
                child: Text(
                  '$sign $percentage%',
                  style: TextStyle(
                    color: color,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Spacer(flex: 15),
          ],
        ),
      ),
    );
  }
}

//_____________________________________________________________________________

class AddWallet extends StatelessWidget {
  const AddWallet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 79,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacer(flex: 18),
          Icon(
            Icons.add,
            size: 30,
            color: Colors.tealAccent[700],
          ),
          Spacer(flex: 20),
          Text(
            'Add Wallet',
            style: TextStyle(
              color: Colors.tealAccent[700],
              fontSize: 9,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(flex: 25),
        ],
      ),
    );
  }
}

//_____________________________________________________________________________

class CustomTitle extends StatelessWidget {
  final String text;
  final bool hasViewAll;

  const CustomTitle({
    @required this.text,
    this.hasViewAll = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (hasViewAll)
          Container(
            height: 18,
            width: 52,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Center(
              child: Text(
                'view all',
                style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
