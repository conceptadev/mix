import 'package:flutter/material.dart';
import 'package:mix/src/attributes/animation/animation.props.dart';
import 'package:mix/src/attributes/attribute.dart';

class AnimationAttributes implements AttributeWithBuilder<AnimationProps> {
  final bool? animated;

  //Animation
  final Duration? animationDuration;
  final Curve? animationCurve;

  const AnimationAttributes({
    this.animationDuration = const Duration(milliseconds: 0),
    this.animationCurve = Curves.linear,
    this.animated,
  });

  AnimationAttributes merge(AnimationAttributes other) {
    return AnimationAttributes(
      animationDuration: other.animationDuration ?? animationDuration,
      animationCurve: other.animationCurve ?? animationCurve,
      animated: other.animated ?? animated,
    );
  }

  @override
  AnimationProps build() {
    return AnimationProps(
      animated: animated ?? false,
      animationDuration: animationDuration ?? const Duration(milliseconds: 100),
      animationCurve: animationCurve ?? Curves.linear,
    );
  }
}
