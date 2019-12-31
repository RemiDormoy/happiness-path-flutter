import 'package:flutter/material.dart';

class OperationCurve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: Text(
              '1500',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: const MySeparator(color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: Text(
              '1000',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: const MySeparator(color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: Text(
              '500',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: const MySeparator(color: Colors.white),
        ),
      ]),
    );
  }
}

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({this.height = 1, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}