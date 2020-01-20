import 'package:flutter/material.dart';
import 'package:happiness_path/AmountCardContent.dart';
import 'package:happiness_path/ValidationCardContent.dart';

import 'AmountCard.dart';
import 'ContactCard.dart';
import 'ValidationCard.dart';

class TransfersPage extends StatelessWidget {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
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
          ],
        )),
      ],
    ));
  }

  void _onContactValidateds(BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return FractionallySizedBox(
            heightFactor: 1.0,
            child: Container(
              margin: const EdgeInsets.only(top: 152),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 8.0,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: AmountCardContent(_onAmountValidated),
            ),
          );
        });
  }

  void _onAmountValidated(String amount, BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return FractionallySizedBox(
            heightFactor: 1.0,
            child: Container(
              margin: const EdgeInsets.only(top: 194),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 8.0,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: ValidationCardContent(),
            ),
          );
        });
  }
}
