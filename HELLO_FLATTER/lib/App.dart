import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bank Layout",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BankScreen(),
    );
  }
}

class BankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 2,
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 24,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          color: Colors.blue.shade800,
                          width: 170,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 75,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 76,
                          left: 10,
                          right: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Title(),
                            Spacer(flex: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AddWallet(),
                                Spacer(flex: 1),
                                Wallet(),
                                Spacer(flex: 2),
                                Wallet(),
                              ],
                            ),
                            Spacer(flex: 14),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TransactionButton(),
                                TransactionButton(),
                              ],
                            ),
                            Spacer(flex: 12),
                            Title(),
                            Spacer(flex: 5),
                            Expanded(
                              flex: 32,
                              child: Transaction(),
                            ),
                            Spacer(flex: 50),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade700,
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
                      BarButton(),
                      Spacer(flex: 3),
                      BarButton(),
                      Spacer(flex: 3),
                      BarButton(),
                      Spacer(flex: 3),
                      BarButton(),
                      Spacer(flex: 3),
                      BarButton(),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//_____________________________________________________________________________

class BarButton extends StatelessWidget {
  const BarButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Spacer(flex: 200),
        Icon(
          Icons.account_balance_wallet,
          size: 22,
          color: Colors.white,
        ),
        Spacer(),
        Text(
          'Wallet',
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
        ),
        Spacer(),
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
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
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
                  color: Colors.blueGrey.shade900,
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
                  color: Colors.blueGrey.shade200,
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
            color: Colors.blueGrey.shade900,
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
  const TransactionButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 125,
      decoration: BoxDecoration(
        color: Colors.pinkAccent.shade200,
        borderRadius: BorderRadius.all(
          Radius.circular(17),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.pinkAccent.shade100,
            spreadRadius: 1,
            offset: Offset(0, 3),
            blurRadius: 9,
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
              Icons.shopping_cart,
              size: 18,
              color: Colors.pinkAccent.shade200,
            ),
          ),
          Spacer(flex: 15),
          Text(
            'Buy now',
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
  const Wallet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106,
      width: 86,
      decoration: BoxDecoration(
        color: Colors.orangeAccent.shade700,
        borderRadius: BorderRadius.all(
          Radius.circular(17),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.shade800,
            offset: Offset(1, 0),
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
              'Ethereum',
              style: TextStyle(
                color: Colors.grey.shade100,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(flex: 5),
            Text(
              '0.23456 BTC',
              style: TextStyle(
                color: Colors.grey.shade100,
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
                  '+ 2.5%',
                  style: TextStyle(
                    color: Colors.orangeAccent.shade700,
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
            color: Colors.tealAccent.shade700,
          ),
          Spacer(flex: 20),
          Text(
            'Add Wallet',
            style: TextStyle(
              color: Colors.tealAccent.shade700,
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

class Title extends StatelessWidget {
  const Title({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'My Wallets',
          style: TextStyle(
            color: Colors.blueGrey.shade900,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
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
                color: Colors.blueGrey.shade900,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
