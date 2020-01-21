import 'package:flutter/material.dart';
import 'package:happiness_path/colors.dart';
import 'package:happiness_path/bottomSheetYolo.dart';

class PatternsDrawer extends StatelessWidget {
  final List<Pattern> patterns = Pattern.values;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: alizouzBlack,
      ),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 8, 0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                iconSize: 30,
                icon: IconTheme(
                  data: new IconThemeData(color: Colors.white),
                  child: Icon(Icons.close),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
            child: Text(
              'OCTO Mobile Trends',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 35),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: patterns.length,
              itemBuilder: (BuildContext context, int position) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      patterns[position].open(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: patterns[position].color,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: IconTheme(
                                data: new IconThemeData(color: Colors.white),
                                child: Icon(Icons.assignment),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Pattern #${patterns[position].number.toString()}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  patterns[position].title,
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
