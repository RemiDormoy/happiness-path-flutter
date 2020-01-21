import 'package:flutter/material.dart';
import 'package:happiness_path/AmountCardContent.dart';
import 'package:happiness_path/ValidationCardContent.dart';
import 'package:happiness_path/patternsDrawer.dart';

import 'ContactCard.dart';
import 'bottomSheetYolo.dart';
import 'myCustomBottomSheetModal.dart';

class TransfersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TransfertsArguments args = ModalRoute.of(context).settings.arguments;
    if (args != null && args.patternToLaunch != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        showBottomSheetForPattern(context, args.patternToLaunch);
        args.patternToLaunch = null;
      });
    }
    return Scaffold(
        drawer: FractionallySizedBox(
          widthFactor: 0.8,
          child: PatternsDrawer(),
        ),
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
    showModalBottomSheetWithoutBarreer<dynamic>(
        isScrollControlled: true,
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
    showModalBottomSheetWithoutBarreer<dynamic>(
        isScrollControlled: true,
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

class TransfertsArguments {
  Pattern patternToLaunch;

  TransfertsArguments([this.patternToLaunch]);
}

