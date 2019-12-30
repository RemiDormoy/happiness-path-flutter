import 'package:flutter/material.dart';
import 'colors.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _buildTheme(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  ThemeData _buildTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      primaryColor: colorPrimaryDark,
      backgroundColor: colorPrimaryDark,
      primaryColorDark: colorPrimaryDark,
      accentColor: colorAccent,
      scaffoldBackgroundColor: colorPrimaryDark
    );
  }
}

