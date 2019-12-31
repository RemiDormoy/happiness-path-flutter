import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happiness_path/actionCell.dart';
import 'package:happiness_path/endOfListCell.dart';
import 'package:happiness_path/operationCell.dart';

class OperationsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OperationsPageState();
}

class OperationsPageState extends State<OperationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
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
      ),
    );
  }
}
