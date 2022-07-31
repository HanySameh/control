import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 500,
                  ranges: <GaugeRange>[
                    GaugeRange(
                        startValue: 0, endValue: 150, color: Colors.green),
                    GaugeRange(
                        startValue: 150, endValue: 300, color: Colors.orange),
                    GaugeRange(
                        startValue: 300, endValue: 500, color: Colors.red)
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(value: _velocity),
                  ],
                  annotations: const <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Text(
                          'Velocity',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        angle: 90,
                        positionFactor: 0.5)
                  ],
                )
              ],
            ),
            Text(
              'Mouse movement velocity = $_velocity \n Mouse is here ($_xEnd , $_yEnd) \n Time = $_time',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
