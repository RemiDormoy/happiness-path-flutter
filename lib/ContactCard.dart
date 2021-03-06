import 'package:flutter/material.dart';
import 'package:happiness_path/colors.dart';

import 'Contact.dart';

class ContactCard extends StatefulWidget {
  ContactValidatedCallback _callback;

  ContactCard(this._callback);

  @override
  State<StatefulWidget> createState() => ContactCardState(_callback);
}

typedef ContactValidatedCallback = void Function(BuildContext context);

class ContactCardState extends State<ContactCard>
    with TickerProviderStateMixin {
  List<ContactYolo> _zobyLaMouche = [];
  List<ContactYolo> _yoloBis = [];

  ContactValidatedCallback _callback;

  AnimationController _controller;

  Animation<double> _scale;

  ContactCardState(this._callback);

  @override
  void initState() {
    _controller = AnimationController(
      duration: new Duration(milliseconds: 300),
      vsync: this,
    );
    _scale = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0,
          1,
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 2),
                      child: Text(
                        'Destinataires',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 42,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: _yoloBis
                                .map((yolo) => Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image:
                                                      AssetImage(yolo.image)))),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            color: Colors.blueGrey, width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                    )))
                                .toList()),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 2, 16, 16),
                  child: Text(
                    'Selectionnez les destinataires de votre virement',
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Contact('Raf', 'assets/rafaelle.jpg', _onContactSelected),
                      Contact(
                          'Alizouz', 'assets/alizee.jpg', _onContactSelected),
                      Contact('Brandone', 'assets/brm.jpg', _onContactSelected),
                      Contact('Bénoit', 'assets/bej.jpg', _onContactSelected),
                      Contact(
                          'Juju', 'assets/juliette.jpg', _onContactSelected),
                      Contact('Benoit', 'assets/bme.jpg', _onContactSelected),
                      Contact(
                          'Maribibi', 'assets/marie.jpg', _onContactSelected),
                      Contact(
                          'Danyboy', 'assets/danyboy.jpg', _onContactSelected),
                      Contact('Cyril', 'assets/cyril.jpg', _onContactSelected),
                    ],
                  ),
                )
              ],
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: _buildButtonAnimation,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButtonAnimation(BuildContext context, Widget child) {
    return ScaleTransition(
      scale: _scale,
      alignment: Alignment.bottomCenter,
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                _callback(context);
                setState(() {
                  _yoloBis = _zobyLaMouche.toSet().toList();
                });
              },
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
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: _zobyLaMouche
                                .map((yolo) => Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image:
                                                      AssetImage(yolo.image)))),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            color: Colors.white, width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                    )))
                                .toList()),
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
    );
  }

  void _onContactSelected(bool isSelected, String name, String image) {
    setState(() {
      if (isSelected) {
        if (_zobyLaMouche.length == 0) {
          _animateAppearance(true);
        }
        _zobyLaMouche.add(ContactYolo(name, image));
      } else {
        _zobyLaMouche.removeWhere((yolo) => yolo.name == name);
        if (_zobyLaMouche.length == 0) {
          _animateAppearance(false);
        }
      }
    });
  }

  void _animateAppearance(bool isVisible) {
    if (isVisible) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }
}

class ContactYolo {
  String name;
  String image;

  ContactYolo(this.name, this.image);
}
