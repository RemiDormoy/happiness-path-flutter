import 'package:flutter/material.dart';
import 'package:happiness_path/OperationList.dart';
import 'package:happiness_path/bottomSheetYolo.dart';
import 'package:happiness_path/patternsDrawer.dart';

import 'ContactDialog.dart';
import 'OperationHeader.dart';

class OperationsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OperationsPageState();
}

class OperationsPageState extends State<OperationsPage> {
  ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    final OperationsArguments args = ModalRoute.of(context).settings.arguments;
    if (args != null && args.showPopUpOnLaunch) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        args.showPopUpOnLaunch = false;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ContactDialog();
          },
        );
      });
      print('yolo la pop up');
    } else if (args != null && args.patternToLaunch != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        showBottomSheetForPattern(context, args.patternToLaunch);
        args.patternToLaunch = null;
      });
    }
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
      drawer: FractionallySizedBox(
        widthFactor: 0.8,
        child: PatternsDrawer(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }
}

class OperationsArguments {
  bool showPopUpOnLaunch;
  Pattern patternToLaunch;

  OperationsArguments([this.showPopUpOnLaunch = false, this.patternToLaunch]);
}
