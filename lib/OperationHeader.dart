import 'package:flutter/material.dart';
import 'package:happiness_path/colors.dart';

class OperationHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  iconSize: 30,
                  icon: IconTheme(
                    data: new IconThemeData(color: Colors.white),
                    child: Icon(Icons.menu),
                  ),
                ),
                Expanded(
                  child: Text(''),
                ),
                IconButton(
                  iconSize: 30,
                  icon: Image(image: AssetImage('assets/logo_app_yolo.png')),
                )
              ],
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 0, 0),
                child: Text('Votre solde', textAlign: TextAlign.left, style: TextStyle(color: Colors.white),),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
                child: Text('€ 1673,00', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 10.0),
              child: Container(
                width: 40,
                height: 2,
                decoration: BoxDecoration(
                    color: Colors.white
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: colorPrimaryDark,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
        ),
      ),
    );
  }


}