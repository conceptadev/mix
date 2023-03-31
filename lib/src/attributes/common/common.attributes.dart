import 'package:flutter/material.dart';

import '../attribute.dart';

class CommonAttributes extends WidgetAttributes {
  final bool? visible;
  //Animation
  final bool? animated;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final TextDirection? textDirection;

  const CommonAttributes({
    this.visible,
    this.animated,
    this.animationDuration,
    this.animationCurve,
    this.textDirection,
  });

  @override
  CommonAttributes merge(CommonAttributes? other) {
    if (other == null) return this;

    return CommonAttributes(
      visible: other.visible ?? visible,
      animated: other.animated ?? animated,
      animationDuration: other.animationDuration ?? animationDuration,
      animationCurve: other.animationCurve ?? animationCurve,
      textDirection: other.textDirection ?? textDirection,
    );
  }

  @override
  get props => [
        visible,
        animated,
        animationDuration,
        animationCurve,
        textDirection,
      ];
}
