import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ChangeCounter extends StatefulWidget {
  const ChangeCounter({Key? key, required this.isLevel, required this.isOn})
      : super(key: key);
  final bool isLevel;
  final bool isOn;

  @override
  State<ChangeCounter> createState() => _ChangeCounterState();
}

class _ChangeCounterState extends State<ChangeCounter> {
  double levelValue = 0.0;
  double preValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          width: 200,
          child: SfRadialGauge(
            axes: [
              RadialAxis(
                startAngle: 180,
                endAngle: 270,
                minimum: 0,
                maximum: 100,
                canScaleToFit: true,
                showAxisLine: true,
                interval: 10,
                //labelFormat: '20 m',
                labelsPosition: ElementsPosition.outside,
                minorTickStyle: const MinorTickStyle(
                  length: 0.05,
                  lengthUnit: GaugeSizeUnit.factor,
                ),
                minorTicksPerInterval: 5,
                pointers: [
                  NeedlePointer(
                    value: widget.isLevel == false
                        ? widget.isOn == true
                            ? preValue
                            : 0
                        : widget.isOn == true
                            ? levelValue
                            : 0,
                    needleEndWidth: 3,
                    needleLength: 0.9,
                    knobStyle: const KnobStyle(
                      borderWidth: 3,
                      sizeUnit: GaugeSizeUnit.logicalPixel,
                    ),
                  ),
                ],
                axisLabelStyle: const GaugeTextStyle(
                  fontWeight: FontWeight.w500,
                ),
                axisLineStyle: const AxisLineStyle(
                  thickness: 3,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        Material(
          elevation: 10.0,
          color: Colors.grey[300],
          child: SizedBox(
            height: 200.0,
            width: 100.0,
            child: SfSlider.vertical(
              min: 0.0,
              max: 100.0,
              value: widget.isLevel == false ? preValue : levelValue,
              interval: 20,
              showTicks: true,
              showLabels: true,
              enableTooltip: false,
              activeColor: Colors.black,
              minorTicksPerInterval: 1,
              onChanged: (dynamic value) {
                if (widget.isLevel == false) {
                  setState(() {
                    preValue = value;
                  });
                } else {
                  setState(() {
                    levelValue = value;
                  });
                }
              },
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
