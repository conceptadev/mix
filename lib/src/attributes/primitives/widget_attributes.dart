import 'package:flutter/material.dart';
import 'package:mix/src/attributes/base_attribute.dart';

class WidgetUtility {
  const WidgetUtility();
  WidgetProperties hidden(bool condition) {
    return WidgetProperties(hidden: condition);
  }

  WidgetProperties animated(
    Curve? curve,
    Duration? duration,
  ) {
    return WidgetProperties(
      animated: true,
      animationCurve: curve,
      animationDuration: duration,
    );
  }
}

class WidgetProperties implements Properties<WidgetAttributes> {
  final bool? animated;
  final bool? hidden;
  //Animation
  final Duration? animationDuration;
  final Curve? animationCurve;

  const WidgetProperties({
    this.hidden,
    this.animationDuration = const Duration(milliseconds: 0),
    this.animationCurve = Curves.linear,
    this.animated,
    Key? key,
  });

  WidgetProperties merge(WidgetProperties other) {
    return WidgetProperties(
      hidden: hidden ?? other.hidden,
      animationDuration: animationDuration ?? other.animationDuration,
      animationCurve: animationCurve ?? other.animationCurve,
      animated: animated ?? other.animated,
    );
  }

  @override
  WidgetAttributes build() {
    return WidgetAttributes(
      hidden: hidden ?? false,
      animated: animated ?? false,
      animationDuration: animationDuration ?? const Duration(milliseconds: 100),
      animationCurve: animationCurve ?? Curves.linear,
    );
  }
}

class WidgetAttributes {
  final bool animated;
  final bool hidden;
  //Animation
  final Duration animationDuration;
  final Curve animationCurve;

  const WidgetAttributes({
    required this.hidden,
    required this.animationDuration,
    required this.animationCurve,
    required this.animated,
    Key? key,
  });
}
