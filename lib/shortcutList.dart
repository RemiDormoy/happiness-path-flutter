import 'package:flutter/material.dart';

import 'colors.dart';

class ShortcutList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 141,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/transfers');
                },
                child:
                    Shortcut('Virement', alizouzBlue, Icons.compare_arrows)),
            Shortcut('Mes comptes', actionCardColor, Icons.lock),
            Shortcut('Dashboards', actionCardColor, Icons.lock),
            Shortcut('Mes cartes', actionCardColor, Icons.lock),
          ],
        ));
  }
}

class Shortcut extends StatelessWidget {
  String _label;
  Color _color;
  IconData _icon;

  Shortcut(this._label, this._color, this._icon);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 125,
        width: 140,
        decoration: BoxDecoration(
            color: _color,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16.0, 0, 0),
              child: IconTheme(
                data: new IconThemeData(color: Colors.white),
                child: Icon(_icon),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 16),
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(minWidth: double.infinity),
                    child: Text(_label,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
