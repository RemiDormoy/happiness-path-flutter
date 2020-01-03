import 'package:flutter/material.dart';

import 'AmountCard.dart';
import 'ContactCard.dart';
import 'ValidationCard.dart';

class TransfersPage extends StatelessWidget {

  AmountCard _amountCard;
  ValidationCard _validationCard;

  @override
  Widget build(BuildContext context) {
    _amountCard = AmountCard(_onAmountValidated);
    _validationCard = ValidationCard();
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
            _amountCard,
            _validationCard
          ],
        )),
      ],
    ));
  }

  void _onContactValidateds(List<ContactYolo> contacts) {
    _amountCard.makeAppearance();
  }

  void _onAmountValidated(String amount) {
    _validationCard.makeAppearance();
  }
}
