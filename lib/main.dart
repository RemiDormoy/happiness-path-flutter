import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happiness_path/operations.dart';
import 'package:happiness_path/transfers.dart';
import 'colors.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OCTO Mob Trends',
      theme: _buildTheme(context),
      home: MyHomePage(title: 'OCTO Mob trends'),
      routes: {
        '/operations' : (context) => OperationsPage(),
        '/transfers' : (context) => TransfersPage(),
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
