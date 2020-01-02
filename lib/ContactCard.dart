import 'package:flutter/material.dart';
import 'package:happiness_path/colors.dart';

import 'Contact.dart';

class ContactCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ContactCardState();
}

class ContactCardState extends State<ContactCard>
    with TickerProviderStateMixin {
  List<ContactYolo> _zobyLaMouche = [];

  AnimationController _controller;

  Animation<double> _scale;

  @override
  void initState() {
    _controller = AnimationController(
      duration: new Duration(milliseconds: 500),
      vsync: this,
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 2),
                  child: Text(
                    'Destinataires',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
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
    var scaleButton;
    if (_scale == null) {
      scaleButton = 0;
    } else {
      scaleButton = _scale.value;
    }
    return Transform.scale(
      scale: scaleButton,
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
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
                                              image: AssetImage(yolo.image)))),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border:
                                        Border.all(color: Colors.white, width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
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
    );
  }

  void _onContactSelected(bool isSelected, String name, String image) {
    setState(() {
      if (isSelected) {
        _zobyLaMouche.add(ContactYolo(name, image));
        if (_zobyLaMouche.length == 1) {
          _animateAppearance(true);
        }
      } else {
        _zobyLaMouche.removeWhere((yolo) => yolo.name == name);
        if (_zobyLaMouche.length == 0) {
          _animateAppearance(false);
        }
      }
    });
  }

  void _animateAppearance(bool isVisible) {
    var end;
    var begin;
    if (isVisible) {
      end = 1;
      begin = 0;
    } else {
      end = 0;
      begin = 1;
    }
    _scale = Tween<double>(
      begin: begin,
      end: end,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0,
          1,
          curve: Curves.easeIn,
        ),
      ),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller = AnimationController(
          duration: new Duration(milliseconds: 300),
          vsync: this,
        );
      }
    });
    _controller.forward();
  }
}

class ContactYolo {
  String name;
  String image;

  ContactYolo(this.name, this.image);
}
