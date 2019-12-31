import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happiness_path/operations.dart';
import 'colors.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _buildTheme(context),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/operations' : (context) => OperationsPage(),
      },
    );
  }

  ThemeData _buildTheme(BuildContext context) {
    final ThemeData base = ThemeData(
      brightness: Brightness.light,
      textTheme: GoogleFonts.dMSansTextTheme(Theme.of(context).textTheme)
    );
    return base.copyWith(
      primaryColor: colorPrimaryDark,
      backgroundColor: colorPrimaryDark,
      primaryColorDark: colorPrimaryDark,
      accentColor: colorAccent,
      scaffoldBackgroundColor: colorPrimaryDark,
    );
  }
}

