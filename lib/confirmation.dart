import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lottie/flutter_lottie.dart';
import 'package:happiness_path/bottomSheetYolo.dart';
import 'package:happiness_path/colors.dart';
import 'package:happiness_path/notification.dart';
import 'package:happiness_path/operations.dart';

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
    if (!kIsWeb /*&& Platform.isAndroid || Platform.isIOS*/) {
      logo = LottieView.fromFile(
        filePath: "assets/success.json",
        autoPlay: true,
        loop: false,
        reverse: false,
        onViewCreated: onViewCreatedFile,
      );
    } else {
      logo = WebLoaderCheck();
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 100.0, 40.0, 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    showBottomSheetForPattern(
                        context, Pattern.KEEP_THEM_WAITING);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: NotificationTrends(),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: logo,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    showBottomSheetForPattern(context, Pattern.GRATIFICATION);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NotificationTrends(),
                  ),
                ),
                SendText(),
                Container(
                  width: 40,
                )
              ],
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/operations',
                    arguments: OperationsArguments(true),
                  );
                },
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
                            "Retour accueil",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: colorPrimaryDark),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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

class SendText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SendTextState();
  }
}

class _SendTextState extends State<SendText> {
  String _text = "Envoi en cours...";

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 2500), () {
      setState(() {
        _text = "Bravo ! Virement réussi !";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(color: Colors.white),
    );
  }
}

class WebLoaderCheck extends StatefulWidget {
  @override
  _WebLoaderCheckState createState() => _WebLoaderCheckState();
}

class _WebLoaderCheckState extends State<WebLoaderCheck> {
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 2500), () {
      setState(() {
        _isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoaded) {
      return IconTheme(
        data: new IconThemeData(color: alizouzGreen, size: 120),
        child: Icon(Icons.check_circle),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(alizouzGreen), strokeWidth: 5.0),
      );
    }
  }
}
