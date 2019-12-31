import 'package:flutter/material.dart';
import 'package:happiness_path/colors.dart';

class EndOfListCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 40,
            height: 2,
            decoration: BoxDecoration(
              color: alizouzGrey
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Vous avez atteint la fin de la liste', textAlign: TextAlign.center,),
            ),
          ),
          Container(
            width: 40,
            height: 2,
            decoration: BoxDecoration(
                color: alizouzGrey
            ),
          ),
        ],
      ),
    );
  }


}