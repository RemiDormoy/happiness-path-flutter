import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happiness_path/colors.dart';

class Contact extends StatelessWidget {

  String _name;
  String _image;

  Contact(this._name, this._image);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Row(children: <Widget>[
        Container(
            width: 45,
            height: 45,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(_image)))),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
          child: Text(_name),
        )),
        IconButton(
          icon: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorPrimaryDark,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconTheme(
                data: new IconThemeData(color: Colors.white),
                child: Icon(Icons.add),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
