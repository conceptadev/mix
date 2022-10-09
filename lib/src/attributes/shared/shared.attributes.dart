import 'package:flutter/material.dart';
import 'package:mix/src/attributes/attribute.dart';

/// ## Widget:
/// - [(all)](/topics/Mixable%20Widgets-topic.html)
///
/// {@category Attributes}
class SharedAttributes extends InheritedAttribute {
  final bool? visible;
  //Animation
  final bool? animated;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final TextDirection? textDirection;

  const SharedAttributes({
    this.visible,
    this.animated,
    this.animationDuration,
    this.animationCurve,
    this.textDirection,
  });

  @override
  SharedAttributes merge(SharedAttributes? other) {
    if (other == null) return this;

    return SharedAttributes(
      visible: other.visible ?? visible,
      animated: other.animated ?? animated,
      animationDuration: other.animationDuration ?? animationDuration,
      animationCurve: other.animationCurve ?? animationCurve,
      textDirection: other.textDirection ?? textDirection,
    );
  }
}
