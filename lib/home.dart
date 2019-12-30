import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const double pi = 3.1415926535897932;

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Animation<double> _scale;
  Animation<double> _scalePageView;
  Animation<double> _angle;
  AnimationController _controller;
  AnimationController _controller2;
  AnimationController _controller3;
  AnimationController _controller4;
  AnimationController _controller5;
  AnimationController _currentController;
  bool _pagerVisible = false;

  @override
  void initState() {
    super.initState();
    initControllers();
    playPhase1();
  }

  void playPhase1() {
    _currentController = _controller;
    _scale = Tween<double>(
      begin: 1.00,
      end: 1.25,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          1000.0 / 1300,
          1300.0 / 1300,
          curve: Curves.easeIn,
        ),
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _playPhase2();
        }
      });
    _angle = Tween<double>(
      begin: 0,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          1000.0 / 1300,
          1300.0 / 1300,
          curve: Curves.easeIn,
        ),
      ),
    );
    _controller.forward();
  }

  void initControllers() {
    _controller = AnimationController(
      duration: new Duration(milliseconds: 1300),
      vsync: this,
    );
    _controller2 = AnimationController(
      duration: new Duration(milliseconds: 300),
      vsync: this,
    );
    _controller3 = AnimationController(
      duration: new Duration(milliseconds: 300),
      vsync: this,
    );
    _controller4 = AnimationController(
      duration: new Duration(milliseconds: 300),
      vsync: this,
    );
    _controller5 = AnimationController(
      duration: new Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    var body;
    if (_pagerVisible) {
      //print('le scale est à : ' + _scalePageView.value.toString());
      body = AnimatedBuilder(
        builder: _buildPagerAnimation,
        animation: _controller5,
      );
    } else {
      body = Center(
          child: Column(
            children: <Widget>[
              AnimatedBuilder(
                  animation: _currentController, builder: _buildAnimation),
              AnimatedBuilder(
                animation: _currentController,
                builder: _buildAnimationImage,
              ),
            ],
          ));
    }
    return Scaffold(
      body: body,
    );
  }

  Widget _buildPagerAnimation(BuildContext context, Widget child) {
    return Transform.scale(
      scale: _scalePageView.value,
      child: PageView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Image(image: AssetImage('assets/ic_loupe.png')),
              ),
              Text('Découvrez'),
              Text('Découvrez nos dix tendances de conception mobile en 2020, présentées  à travers un parcours bancaire.')
            ],
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: SvgPicture.asset(
                    'notification.svg',
                    semanticsLabel: 'Expérimentez'
                ),
              ),
              Text('Expérimentez'),
              Text('Promenez vous sur l’application et cliquez sur les pastilles pour en apprendre plus')
            ],
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: SvgPicture.asset(
                    'diamond.svg',
                    semanticsLabel: 'Lancez vous !'
                ),
              ),
              Text('Lancez vous !'),
              Text('Découvrez nos dix tendances de conception mobile en 2020, présentées  à travers un parcours bancaire.')
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnimationImage(BuildContext context, Widget child) {
    return Expanded(
      child: Transform.rotate(
        angle: _angle.value,
        child: Transform.scale(
          scale: _scale.value,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 0),
            child: Image(image: AssetImage('assets/splashpicture.png')),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Transform.rotate(
        angle: _angle.value,
        child: Transform.scale(
          scale: _scale.value,
          child: SizedBox(
            width: 100.0,
            height: 60.0,
            child: Image(image: AssetImage('assets/logo_octo_splash.png')),
          ),
        ),
      ),
    );
  }

  void _playPhase2() {
    _scale = Tween<double>(
      begin: 1.25,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Interval(
          0.0,
          1,
          curve: Curves.easeIn,
        ),
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _playPhase3();
        }
      });
    _angle = Tween<double>(
      begin: 0,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          1000.0 / 1300,
          1300.0 / 1300,
          curve: Curves.easeIn,
        ),
      ),
    );
    _controller2.forward();
    setState(() {
      _currentController = _controller2;
    });
  }

  void _playPhase3() {
    _scale = Tween<double>(
      begin: 1.00,
      end: 1.25,
    ).animate(
      CurvedAnimation(
        parent: _controller3,
        curve: Interval(
          0.0,
          1,
          curve: Curves.easeIn,
        ),
      ),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _playPhase4();
      }
    });
    _angle = Tween<double>(
      begin: 0,
      end: -pi / 6.0,
    ).animate(
      CurvedAnimation(
        parent: _controller3,
        curve: Interval(
          0,
          1,
          curve: Curves.easeIn,
        ),
      ),
    );
    _controller3.forward();
    setState(() {
      _currentController = _controller3;
    });
  }

  void _playPhase4() {
    _scale = Tween<double>(
      begin: 1.25,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller4,
        curve: Interval(
          0.0,
          1,
          curve: Curves.easeIn,
        ),
      ),
    );
    _angle = Tween<double>(
      begin: -pi / 6.0,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controller4,
        curve: Interval(
          0,
          1,
          curve: Curves.easeIn,
        ),
      ),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _playPhase5();
      }
    });
    _controller4.forward();
    setState(() {
      _currentController = _controller4;
    });
  }

  void _playPhase5() {
    _scalePageView = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller5,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    _controller5.forward();
    setState(() {
      _pagerVisible = true;
    });
  }
}
