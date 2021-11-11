import 'package:flutter/material.dart';
import 'package:mix/src/attributes/animation/animation.attributes.dart';

class AnimationUtility {
  const AnimationUtility();

  AnimationAttributes animated({
    bool? animated = true,
    Curve? curve,
    Duration? duration,
  }) {
    return AnimationAttributes(
      animated: animated,
      animationCurve: curve,
      animationDuration: duration,
    );
  }

  AnimationAttributes animationDuration(int milliseconds) {
    return AnimationAttributes(
      animationDuration: Duration(
        milliseconds: milliseconds,
      ),
    );
  }

  AnimationAttributes animationCurve(Curve curve) {
    return AnimationAttributes(
      animationCurve: curve,
    );
  }
}
