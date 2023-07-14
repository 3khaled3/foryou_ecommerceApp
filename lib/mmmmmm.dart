import 'package:flutter/material.dart';

class PriceRangeSlider extends StatefulWidget {
  @override
  _PriceRangeSliderState createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  RangeValues _currentRangeValues = RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RangeSlider(
      values: _currentRangeValues,
      min: 0,
      max: 100,
      divisions: 10,
      labels: RangeLabels(
        _currentRangeValues.start.toString(),
        _currentRangeValues.end.toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
      },
    ),
      ),
    );
  }
}
