import 'package:flutter/material.dart';
import 'package:happiness_path/colors.dart';

class AmountCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 2),
          child: Text(
            'Montant',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 8, 24, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: new BorderSide(color: alizouzBlack)),
                        hintText: '0 €'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: double.infinity),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 52,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: alizouzBlack,
                              borderRadius: BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16.0, 4, 16, 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'Suivant',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                IconTheme(
                                  data: new IconThemeData(color: Colors.white),
                                  child: Icon(Icons.arrow_forward),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
