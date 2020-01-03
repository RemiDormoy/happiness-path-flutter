import 'package:flutter/material.dart';

import 'AmountCardContent.dart';

class AmountCard extends StatefulWidget {
  AmountCardState _amountCardState;

  AmountChosenCallback _callback;

  AmountCard(this._callback);

  @override
  State<StatefulWidget> createState() {
    _amountCardState = AmountCardState(_callback);
    return _amountCardState;
  }

  void makeAppearance() {
    _amountCardState.makeAppearance();
  }
}

class AmountCardState extends State<AmountCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  AmountChosenCallback _callback;

  AmountCardState(this._callback);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      value: 1.0,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size layerSize = MediaQuery.of(context).size;
    final double layerTop = layerSize.height - 102;

    Animation<RelativeRect> layerAnimation = RelativeRectTween(
      end: RelativeRect.fromLTRB(
          0.0, layerTop, 0.0, layerTop - layerSize.height),
      begin: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(_controller.view);
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Stack(
        children: <Widget>[
          PositionedTransition(
            rect: layerAnimation,
            child: Container(
              margin: const EdgeInsets.only(top: 42),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 8.0,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: GestureDetector(
                onVerticalDragEnd: _onCardDragged,
                child: AmountCardContent(_callback),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onCardDragged(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dy > 300) {
      makeAppearance();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _cardVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void makeAppearance() {
    _controller.fling(velocity: _cardVisible ? -2.0 : 2.0);
  }
}
