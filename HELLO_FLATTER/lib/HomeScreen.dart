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
        child: Stack(
          children: [
            CreditCardWidgetComplete(
                nameVar: userHomeVar.card.name,
                surnameVar: userHomeVar.card.surname,
                creditCardNumberVar: userHomeVar.card.creditCardNumber,
                totalMoneyVar: userHomeVar.card.money,
                expirationDateVar: userHomeVar.card.expirationDate)
          ],
        ),
      ),
    );
  }
}
