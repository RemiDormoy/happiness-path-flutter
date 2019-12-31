import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happiness_path/colors.dart';

class OperationCell extends StatelessWidget {
  double _amount;
  String _label;
  String _date;
  bool _isPositive;

  OperationCell(double amount, String label, String date) {
    _amount = amount;
    _label = label;
    _date = date;
    _isPositive = amount >= 0;
  }

  @override
  Widget build(BuildContext context) {
    var cardColor;
    var image;
    var textStyle;
    if (_isPositive) {
      cardColor = octoBlue;
      image = IconTheme(
        data: new IconThemeData(color: Colors.white),
        child: new Icon(Icons.arrow_downward),
      );
      textStyle = TextStyle(color: octoBlue);
    } else {
      cardColor = negativeCardColor;
      image = IconTheme(
        data: new IconThemeData(color: Colors.grey),
        child: new Icon(Icons.arrow_downward),
      );
      textStyle = TextStyle(color: Colors.grey);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: cardColor,
                boxShadow: [BoxShadow(
                  color: alizouzGrey,
                  blurRadius: 10.0,
                ),]
            ),
            child: image,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(_label),
                Text(_date, style: TextStyle(color: alizouzGrey)),
              ],
            ),
          ),
          Text(
            _amount.toString() + '€',
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
