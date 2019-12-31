import 'package:flutter/material.dart';

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
    return ListView(
      controller: _controller,
      children: <Widget>[
        Container(
          height: 400,
          child: Text(''),
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