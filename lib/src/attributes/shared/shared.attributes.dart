import 'package:flutter/material.dart';

import '../attribute.dart';

class SharedWidgetAttributes extends WidgetAttributes {
  final bool? visible;
  //Animation
  final bool? animated;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final TextDirection? textDirection;

  const SharedWidgetAttributes({
    this.visible,
    this.animated,
    this.animationDuration,
    this.animationCurve,
    this.textDirection,
  });

  @override
  SharedWidgetAttributes merge(SharedWidgetAttributes? other) {
    if (other == null) return this;

    return SharedWidgetAttributes(
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
