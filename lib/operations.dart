import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happiness_path/OperationList.dart';

import 'OperationHeader.dart';

class OperationsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OperationsPageState();
}

class OperationsPageState extends State<OperationsPage> {

  ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          OperationList(_controller),
          OperationHeader(_controller),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }
}
