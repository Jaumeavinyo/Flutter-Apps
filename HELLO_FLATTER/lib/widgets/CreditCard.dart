import 'package:HELLO_FLATTER/App.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditCard_W extends StatelessWidget {
  final CreditCard card;
  CreditCard_W({@required this.card});

  @override
  Widget build(BuildContext context) {
    num radius = 30;
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.red[400],
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
