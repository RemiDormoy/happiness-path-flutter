import 'package:flutter/material.dart';
import 'package:happiness_path/colors.dart';

class Contact extends StatefulWidget {
  String _name;
  String _image;
  ContactSelectedCallback _onContactSelected;

  Contact(this._name, this._image, this._onContactSelected);

  @override
  State<StatefulWidget> createState() =>
      ContactState(_name, _image, _onContactSelected);
}

class ContactState extends State<Contact> with TickerProviderStateMixin {
  String _name;
  String _image;
  ContactSelectedCallback _onContactSelected;
  bool _isSelected = false;
  AnimationController _controller;
  AnimationController _controller2;
  AnimationController _currentController;
  Animation<double> _scale;

  ContactState(this._name, this._image, this._onContactSelected);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: new Duration(milliseconds: 500),
      vsync: this,
    );
    _controller2 = AnimationController(
      duration: new Duration(milliseconds: 500),
      vsync: this,
    );
    _currentController = _controller;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _animateChange();
        },
        child: Padding(
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
            AnimatedBuilder(
              animation: _currentController,
              builder: _buildAnimationButton,
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildAnimationButton(BuildContext context, Widget child) {
    var scaleButton;
    if (_scale == null) {
      scaleButton = 1;
    } else {
      scaleButton = _scale.value;
    }
    var iconButton;
    if (_isSelected) {
      iconButton = IconButton(
        icon: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: colorPrimaryDark),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconTheme(
              data: new IconThemeData(color: colorPrimaryDark),
              child: Icon(Icons.remove),
            ),
          ),
        ),
      );
    } else {
      iconButton = IconButton(
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
      );
    }
    return Transform.scale(
      scale: scaleButton,
      child: iconButton,
    );
  }

  void _animateChange() {
    _currentController = _controller;
    _scale = Tween<double>(
      begin: 1.00,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _currentController,
        curve: Interval(
          0,
          1,
          curve: Curves.easeIn,
        ),
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _isSelected = !_isSelected;
          });
          _onContactSelected(_isSelected, _name, _image);
          _playPhase2();
        }
      });
    _currentController.forward();
  }

  void _playPhase2() {
    _currentController = _controller2;
    _scale = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _currentController,
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
          _controller2 = AnimationController(
            duration: new Duration(milliseconds: 300),
            vsync: this,
          );
          setState(() {
            _currentController = _controller;
          });
        }
      });
    _currentController.forward();
  }
}

typedef ContactSelectedCallback = void Function(
    bool isSelected, String name, String image);
