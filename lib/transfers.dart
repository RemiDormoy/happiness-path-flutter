import 'package:flutter/material.dart';

import 'AmountCard.dart';
import 'ContactCard.dart';

class TransfersPage extends StatelessWidget {

  AmountCard _amountCard;

  @override
  Widget build(BuildContext context) {
    _amountCard = AmountCard();
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 45, 16, 40),
          child: Text(
            'Virement',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Expanded(
            child: Stack(
          children: <Widget>[
            ContactCard(_onContactValidateds),
            _amountCard
          ],
        )),
      ],
    ));
  }

  void _onContactValidateds() {
    _amountCard.makeAppearance();
  }
}
