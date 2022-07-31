import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MouseOperationsPage extends StatefulWidget {
  const MouseOperationsPage({Key? key}) : super(key: key);

  @override
  State<MouseOperationsPage> createState() => _MouseOperationsPageState();
}

class _MouseOperationsPageState extends State<MouseOperationsPage> {
  late final double _xStart;
  late final double _yStart;
  double _xEnd = 0.0;
  double _yEnd = 0.0;
  Timer? _timer;
  double _time = 0.0;
  double _velocity = 0.0;
  double calcVelocity() {
    _velocity =
        sqrt(pow((_xStart - _xEnd), 2) + pow((_yStart - _yEnd), 2)) / _time;
    return _velocity;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (PointerEvent details) {
        setState(() {
          _xEnd = details.position.dx;
          _yEnd = details.position.dy;
          calcVelocity();
        });
      },
      onEnter: (PointerEvent details) {
        _xStart = details.position.dx;
        _yStart = details.position.dy;
        debugPrint('$_xStart,$_yStart');
        _timer = Timer.periodic(
          const Duration(seconds: 1),
          (_) {
            _time++;
          },
        );
      },
      child: Scaffold(
        body: Center(
          child: Text(
            'Mouse movement velocity = $_velocity \n Mouse is here ($_xEnd , $_yEnd) \n Time = $_time',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
