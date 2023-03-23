import 'package:flutter/material.dart';

import '../attribute.dart';

class CommonAttributes extends InheritedAttributes {
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
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommonAttributes &&
        other.visible == visible &&
        other.animated == animated &&
        other.animationDuration == animationDuration &&
        other.animationCurve == animationCurve &&
        other.textDirection == textDirection;
  }

  @override
  int get hashCode {
    return visible.hashCode ^
        animated.hashCode ^
        animationDuration.hashCode ^
        animationCurve.hashCode ^
        textDirection.hashCode;
  }
}
