import 'package:flutter/material.dart';
import 'package:happiness_path/bottomSheetYolo.dart';
import 'package:happiness_path/colors.dart';
import 'package:happiness_path/notification.dart';

class AmountCardContent extends StatefulWidget {
  AmountChosenCallback _callback;

  AmountCardContent(this._callback);

  @override
  State<StatefulWidget> createState() => AmountCardContentState(_callback);
}

class AmountCardContentState extends State<AmountCardContent>
    with WidgetsBindingObserver {
  AmountChosenCallback _callback;

  AmountCardContentState(this._callback);

  @override
  Widget build(BuildContext context) {
    return NotScrollableAmountCardContent(_callback);
  }
}

class NotScrollableAmountCardContent extends StatefulWidget {
  AmountChosenCallback _callback;

  NotScrollableAmountCardContent(this._callback);

  @override
  _NotScrollableAmountCardContentState createState() =>
      _NotScrollableAmountCardContentState(_callback);
}

class _NotScrollableAmountCardContentState
    extends State<NotScrollableAmountCardContent> {
  String _amountValidated = '';

  TextEditingController _controller;
  AmountChosenCallback _callback;

  _NotScrollableAmountCardContentState(this._callback);

  @override
  void initState() {
    _controller = TextEditingController();
    _controller
      ..addListener(() {
        var amount = _controller.text.replaceAll(' €', '');
        if (amount.length == 0) {
          if (_controller.text != '') {
            _controller.text = '';
          }
        } else {
          var newYolo = amount + ' €';
          if (newYolo != _controller.text) {
            var top = MediaQuery.of(context).viewInsets.top;
            var bottom = MediaQuery.of(context).viewInsets.bottom;
            var height = MediaQuery.of(context).size.height;
            print(
                'la top est de $top et le bottom : $bottom et la height $height');
            _controller.text = newYolo;
            _controller.selection =
                TextSelection.fromPosition(TextPosition(offset: amount.length));
          }
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height - 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16, 2, 2),
                child: Text(
                  'Montant',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 16, 2),
                  child: Text(
                    _amountValidated,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 8, 24, 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints(minWidth: double.infinity),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            showBottomSheetForPattern(
                                context, Pattern.INFINITE_NAV);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: NotificationTrends(),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: alizouzBlack)),
                                hintText: '0 €'),
                          ),
                        ),
                        Container(
                          width: 56,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: double.infinity),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            var value = _controller.text;
                            _callback(value, context);
                            setState(() {
                              _amountValidated = ' : ' + value;
                            });
                          },
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: alizouzBlack,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16.0, 4, 16, 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      showBottomSheetForPattern(
                                          context, Pattern.BOTTOM);
                                    },
                                    child: NotificationTrends(),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Suivant',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  IconTheme(
                                    data:
                                        new IconThemeData(color: Colors.white),
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
          ),
        ],
      ),
    );
  }
}

typedef AmountChosenCallback = void Function(String, BuildContext);
