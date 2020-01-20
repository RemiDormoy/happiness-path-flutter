import 'package:flutter/material.dart';
import 'package:happiness_path/bottomSheetYolo.dart';
import 'package:happiness_path/colors.dart';

class ActionCell extends StatelessWidget {
  String _label;
  IconData _icon;

  ActionCell(String label, IconData icon) {
    _label = label;
    _icon = icon;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            showBottomSheetForPattern(context, Pattern.AUGMENTED_LIST);
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28.0, 4, 16, 4),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: actionCardColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 0),
                          child: Text(_label, style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: IconTheme(
                          data: new IconThemeData(color: Colors.white),
                          child: new Icon(Icons.arrow_forward, size: 20,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconTheme(
                data: new IconThemeData(color: actionCardColor),
                child: new Icon(_icon, size: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
