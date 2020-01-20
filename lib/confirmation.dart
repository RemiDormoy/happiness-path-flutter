import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_lottie/flutter_lottie.dart';
import 'package:happiness_path/colors.dart';

class ConfirmationPage extends StatefulWidget {
  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  LottieController _controller;
  StreamController<double> _newProgressStream;

  @override
  void initState() {
    super.initState();
    _newProgressStream = StreamController<double>();
  }

  @override
  Widget build(BuildContext context) {
    Widget logo;
    if (Platform.isAndroid || Platform.isIOS) {
      logo = LottieView.fromFile(
        filePath: "assets/success.json",
        autoPlay: true,
        loop: false,
        reverse: false,
        onViewCreated: onViewCreatedFile,
      );
    } else {
      logo = IconTheme(
        data: new IconThemeData(color: alizouzGreen),
        child: Icon(Icons.check_circle),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 100.0, 40.0, 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: logo,
            ),
            Material(
              color: Colors.transparent,
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 4, 16, 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Retour acceuil",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: colorPrimaryDark),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onViewCreatedFile(LottieController controller) {
    _newProgressStream.stream.listen((double progress) {
      _controller.setAnimationProgress(progress);
    });
  }

  void dispose() {
    super.dispose();
    _newProgressStream.close();
  }
}
