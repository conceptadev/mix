import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';

class SharedAttributes implements Attribute {
  final bool? hidden;
  //Animation
  final bool? animated;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final TextDirection? textDirection;

  const SharedAttributes({
    this.hidden,
    this.animated,
    this.animationDuration,
    this.animationCurve,
    this.textDirection,
  });

  SharedAttributes merge(SharedAttributes? other) {
    if (other == null) return this;

    return SharedAttributes(
      hidden: other.hidden ?? hidden,
      animated: other.animated ?? animated,
      animationDuration: other.animationDuration ?? animationDuration,
      animationCurve: other.animationCurve ?? animationCurve,
      textDirection: other.textDirection ?? textDirection,
    );
  }
}
