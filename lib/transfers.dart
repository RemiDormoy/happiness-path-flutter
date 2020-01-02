import 'package:flutter/material.dart';

import 'ContactCard.dart';

class TransfersPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 45, 16, 40),
          child: Text('Virement', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
        ),
        Expanded(child: ContactCard()),
      ],
    ));
  }
}