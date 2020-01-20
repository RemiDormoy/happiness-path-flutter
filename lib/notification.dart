import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationTrends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Center(
        child: Text(
          '?',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
