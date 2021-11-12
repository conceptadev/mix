import 'package:flutter/material.dart';
import 'package:mix/src/attributes/attribute.dart';

class CommonAttributes implements Attribute {
  final bool? hidden;
  //Animation
  final bool? animated;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final TextDirection? textDirection;

  const CommonAttributes({
    this.hidden,
    this.animated,
    this.animationDuration,
    this.animationCurve,
    this.textDirection,
  });

  CommonAttributes merge(CommonAttributes other) {
    return CommonAttributes(
      hidden: other.hidden ?? hidden,
      animated: other.animated ?? animated,
      animationDuration: other.animationDuration ?? animationDuration,
      animationCurve: other.animationCurve ?? animationCurve,
      textDirection: other.textDirection ?? textDirection,
    );
  }
}
