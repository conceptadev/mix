import 'package:flutter/material.dart';

import '../attribute.dart';

class SharedStyleAttributes extends StyledWidgetAttributes {
  final bool? visible;
  // Animation.
  final bool? animated;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final TextDirection? textDirection;

  const SharedStyleAttributes({
    this.visible,
    this.animated,
    this.animationDuration,
    this.animationCurve,
    this.textDirection,
  });

  @override
  SharedStyleAttributes copyWith({
    bool? visible,
    bool? animated,
    Duration? animationDuration,
    Curve? animationCurve,
    TextDirection? textDirection,
  }) {
    return SharedStyleAttributes(
      visible: visible ?? this.visible,
      animated: animated ?? this.animated,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      textDirection: textDirection ?? this.textDirection,
    );
  }

  @override
  SharedStyleAttributes merge(SharedStyleAttributes? other) {
    if (other == null) return this;

    return copyWith(
      visible: other.visible,
      animated: other.animated,
      animationDuration: other.animationDuration,
      animationCurve: other.animationCurve,
      textDirection: other.textDirection,
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
