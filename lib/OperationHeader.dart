import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_lottie/flutter_lottie.dart';
import 'package:happiness_path/colors.dart';

import 'OperationCurve.dart';

class OperationHeader extends StatefulWidget {
  ScrollController _controller;

  OperationHeader(ScrollController controller) {
    _controller = controller;
  }

  @override
  State<StatefulWidget> createState() => OperationHeaderState(_controller);
}

class OperationHeaderState extends State<OperationHeader> {
  ScrollController _controller;
  double _height = 200;

  OperationHeaderState(ScrollController controller) {
    _controller = controller;
  }

  @override
  void initState() {
    super.initState();
    _controller..addListener(_scrollListener);
  }

  void _scrollListener() {
    var offset = _controller.offset;
    setState(() {
      _height = max(0, 200 - offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Wrap(
        children: <Widget>[
          Container(
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
                      icon:
                          Image(image: AssetImage('assets/logo_app_yolo.png')),
                    )
                  ],
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 0, 0),
                    child: Text(
                      'Votre solde',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
                    child: Text(
                      '€ 1673,00',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                ),
                Container(
                    height: _height,
                    child: Opacity(
                      opacity: _height / 200,
                      child: ConstrainedBox(
                          constraints:
                              const BoxConstraints(minWidth: double.infinity),
                          child: OperationCurve()),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 10.0),
                  child: Container(
                    width: 40,
                    height: 2,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: colorPrimaryDark,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            ),
          ),
        ],
      ),
    );
  }
}
