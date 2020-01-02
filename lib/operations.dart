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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(''),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  child: OperationList(_controller),
                  decoration: BoxDecoration(color: Colors.white),
                ),
                OperationHeader(_controller),
              ],
            ),
          ),
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
