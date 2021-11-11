import 'package:flutter/material.dart';
import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/attributes/common/common.props.dart';

class CommonAttributes implements AttributeWithBuilder<CommonProps> {
  final bool? hidden;
  //Animation
  final bool? animated;
  final Duration? animationDuration;
  final Curve? animationCurve;

  const CommonAttributes({
    this.hidden,
    this.animated,
    this.animationDuration,
    this.animationCurve,
  });

  CommonAttributes merge(CommonAttributes other) {
    return CommonAttributes(
      hidden: other.hidden ?? hidden,
      animated: other.animated ?? animated,
      animationDuration: other.animationDuration ?? animationDuration,
      animationCurve: other.animationCurve ?? animationCurve,
    );
  }

  @override
  CommonProps build() {
    return CommonProps(
      hidden: hidden ?? false,
      animated: animated ?? false,
      animationDuration: animationDuration ?? const Duration(milliseconds: 100),
      animationCurve: animationCurve ?? Curves.linear,
    );
  }
}
