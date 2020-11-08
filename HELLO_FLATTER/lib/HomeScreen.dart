import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'App.dart';
import 'CustomWidgets/customwidgets.dart';

class HomeScreen extends StatelessWidget {
  final User userHomeVar;

  HomeScreen({@required this.userHomeVar});

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
                        Expanded(
                          flex: 5,
                          child: Container(
                            color: Colors.blue[700],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            color: Colors.blue[800],
                          ),
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
                            CustomTitle(text: "My Wallets"),
                            Spacer(flex: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AddWallet(),
                                Spacer(flex: 1),
                                Wallet(
                                  color: Colors.orangeAccent[700],
                                  currency: "Bitcoin",
                                  quantity: 0.23456,
                                  percentage: 2.5,
                                  isPositive: true,
                                  isShadowLeft: true,
                                  isShadowRight: false,
                                ),
                                Spacer(flex: 2),
                                Wallet(
                                  color: Colors.purple[900],
                                  currency: "Ethereum",
                                  quantity: 0.23456,
                                  percentage: 0.5,
                                  isPositive: true,
                                  isShadowLeft: false,
                                  isShadowRight: true,
                                ),
                              ],
                            ),
                            Spacer(flex: 14),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TransactionButton(
                                  color: Colors.tealAccent[400],
                                  action: 'Buy',
                                  icon: Icons.shopping_cart,
                                ),
                                TransactionButton(
                                  color: Colors.pinkAccent[200],
                                  action: 'Sell',
                                  icon: Icons.shopping_basket,
                                ),
                              ],
                            ),
                            Spacer(flex: 12),
                            CustomTitle(
                              text: "Transaction",
                              hasViewAll: false,
                            ),
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
              WindowBar(),
              Align(
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Spacer(flex: 12),
                    CreditCardWidgetComplete(
                        nameVar: userHomeVar.card.name,
                        surnameVar: userHomeVar.card.surname,
                        creditCardNumberVar: userHomeVar.card.creditCardNumber,
                        totalMoneyVar: userHomeVar.card.money,
                        expirationDateVar: userHomeVar.card.expirationDate),
                    Spacer(flex: 80),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
