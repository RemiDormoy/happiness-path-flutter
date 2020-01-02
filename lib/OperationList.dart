import 'package:flutter/material.dart';
import 'package:happiness_path/colors.dart';
import 'package:happiness_path/shortcutList.dart';

import 'actionCell.dart';
import 'endOfListCell.dart';
import 'operationCell.dart';

class OperationList extends StatelessWidget {
  ScrollController _controller;

  OperationList(ScrollController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    var titleStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
    return ListView(
      controller: _controller,
      children: <Widget>[
        Container(
          height: 375,
          child: Text(''),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Raccourcis',
            style: titleStyle,
          ),
        ),
        ShortcutList(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Historique',
            style: titleStyle,
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: double.infinity),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                child: FlatButton(
                  color: colorPrimaryDark,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text('Tout'),
                  ),
                  onPressed: () => {},
                ),
                flex: 2,
              ),
              Flexible(
                child: FlatButton(
                  textColor: colorPrimaryDark,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: colorPrimaryDark),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text('Envoyé'),
                  ),
                  onPressed: () => {},
                ),
                flex: 2,
              ),
              Flexible(
                child: FlatButton(
                  textColor: colorPrimaryDark,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: colorPrimaryDark),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text('Reçu'),
                  ),
                  onPressed: () => {},
                ),
                flex: 2,
              ),
            ],
          ),
        ),
        OperationCell(200, 'Aniversaire Nicolas', '2019/09/08'),
        OperationCell(-40, 'Repas au Burger King', '2019/09/08'),
        ActionCell('Complétez votre profil !', Icons.card_giftcard),
        OperationCell(-40, 'Repas au Burger King', '2019/09/08'),
        OperationCell(-40, 'Repas au Burger King', '2019/09/08'),
        OperationCell(-40, 'Repas au Burger King', '2019/09/08'),
        ActionCell('Découvrez notre coach financier', Icons.favorite),
        OperationCell(-40, 'Repas au Burger King', '2019/09/08'),
        OperationCell(-40, 'Repas au Burger King', '2019/09/08'),
        OperationCell(-40, 'Repas au Burger King', '2019/09/08'),
        OperationCell(-40, 'Repas au Burger King', '2019/09/08'),
        ActionCell('Ajustez votre budget mensuel', Icons.check_box),
        OperationCell(-40, 'Repas au Burger King', '2019/09/08'),
        OperationCell(-40, 'Repas au Burger King', '2019/09/08'),
        OperationCell(-40, 'Repas au Burger King', '2019/09/08'),
        OperationCell(-40, 'Repas au Burger King', '2019/09/08'),
        ActionCell('Complétez votre profil !', Icons.card_giftcard),
        OperationCell(-40, 'Repas au Burger King', '2019/09/08'),
        OperationCell(-40, 'Repas au Burger King', '2019/09/08'),
        OperationCell(-40, 'Repas au Burger King', '2019/09/08'),
        EndOfListCell(),
      ],
    );
  }
}
