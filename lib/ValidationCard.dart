import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AmountCard.dart';
import 'ValidationCardContent.dart';

class ValidationCard extends StatefulWidget {
  ValidationCardState _validationCardState;

  ValidationCard();

  @override
  State<StatefulWidget> createState() {
    _validationCardState = ValidationCardState();
    return _validationCardState;
  }

  void makeAppearance() {
    _validationCardState.makeAppearance();
  }
}

class ValidationCardState extends State<ValidationCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  ValidationCardState();

  IsOpenModel _model = IsOpenModel();

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
    final double layerTop = layerSize.height - 144;

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
              margin: const EdgeInsets.only(top: 84),
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
                child: ChangeNotifierProvider(
                  create: (_) => _model,
                  child: ValidationCardContent(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onCardDragged(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dy > 100) {
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
    if (_model.isOpen) {
      _model.switchStatus();
    } else {
      Timer(Duration(milliseconds: 500), () {
        _model.switchStatus();
      });
    }
  }
}
