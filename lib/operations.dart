import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happiness_path/OperationList.dart';

import 'OperationHeader.dart';

class OperationsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OperationsPageState();
}

class OperationsPageState extends State<OperationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          OperationHeader(),
          Expanded(child: OperationList()),
        ],
      ),
    );
  }
}
