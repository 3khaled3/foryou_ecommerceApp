import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.discreteCircle(
            color: Colors.black,
            size: 70,
            secondRingColor: Colors.green,
            thirdRingColor: Colors.purple),
      ),
    );
  }
}
