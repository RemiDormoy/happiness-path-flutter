import 'package:flutter/material.dart';
import 'package:happiness_path/colors.dart';
import 'package:page_indicator/page_indicator.dart';

class SplashPager extends StatelessWidget {
  PageController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = PageController();
    var titleStyle =
        TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    var contentStyle = TextStyle(
      color: Colors.white,
    );
    var buttonStyle = TextStyle(
      color: colorPrimaryDark,
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 24.0),
      child: PageIndicatorContainer(
        child: PageView(
          controller: _controller,
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(80),
                    child: Image(image: AssetImage('assets/ic_loupe.png')),
                  ),
                ),
                Text(
                  'Découvrez',
                  style: titleStyle,
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    'Découvrez nos dix tendances de conception mobile en 2020, présentées  à travers un parcours bancaire.',
                    style: contentStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 24.0, 40, 24),
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(minWidth: double.infinity),
                    child: RaisedButton(
                      padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Suivant',
                        style: buttonStyle,
                      ),
                      onPressed: () {
                        _controller.animateToPage(1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(80),
                    child: Image(image: AssetImage('assets/notification.png')),
                  ),
                ),
                Text(
                  'Expérimentez',
                  style: titleStyle,
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                      'Promenez vous sur l’application et cliquez sur les pastilles pour en apprendre plus',
                      style: contentStyle,
                      textAlign: TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 24.0, 40, 24),
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(minWidth: double.infinity),
                    child: RaisedButton(
                      padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Suivant',
                        style: buttonStyle,
                      ),
                      onPressed: () {
                        _controller.animateToPage(2,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 24.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(80),
                      child: Image(image: AssetImage('assets/diamond.png')),
                    ),
                  ),
                  Text(
                    'Lancez vous !',
                    style: titleStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                        'Découvrez nos dix tendances de conception mobile en 2020, présentées  à travers un parcours bancaire.',
                        style: contentStyle,
                        textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 24.0, 40, 24),
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: double.infinity),
                      child: RaisedButton(
                        padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          "C'est parti !",
                          style: buttonStyle,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/operations');
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        align: IndicatorAlign.bottom,
        length: 3,
        indicatorSpace: 20.0,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        indicatorColor: alizouzGrey,
        indicatorSelectorColor: Colors.white,
        shape: IndicatorShape.circle(size: 12),
      ),
    );
  }
}
