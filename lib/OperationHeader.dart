import 'package:flutter/material.dart';
import 'package:happiness_path/colors.dart';

class OperationHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Container(
        height: 200,
        child: Text('je suis le header'),
        decoration: BoxDecoration(
          color: colorPrimaryDark,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
        ),
      ),
    );
  }


}