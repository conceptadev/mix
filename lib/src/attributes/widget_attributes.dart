import 'package:flutter/material.dart';
import 'package:mix/src/attributes/attribute.dart';

class WidgetUtility {
  const WidgetUtility();
  WidgetAttributes hidden(bool condition) {
    return WidgetAttributes(hidden: condition);
  }

  WidgetAttributes animated(
    Curve? curve,
    Duration? duration,
  ) {
    return WidgetAttributes(
      animated: true,
      animationCurve: curve,
      animationDuration: duration,
    );
  }
}

class WidgetAttributes implements AttributeWithBuilder<WidgetProps> {
  final bool? animated;
  final bool? hidden;
  //Animation
  final Duration? animationDuration;
  final Curve? animationCurve;

  const WidgetAttributes({
    this.hidden,
    this.animationDuration = const Duration(milliseconds: 0),
    this.animationCurve = Curves.linear,
    this.animated,
    Key? key,
  });

  WidgetAttributes merge(WidgetAttributes other) {
    return WidgetAttributes(
      hidden: hidden ?? other.hidden,
      animationDuration: animationDuration ?? other.animationDuration,
      animationCurve: animationCurve ?? other.animationCurve,
      animated: animated ?? other.animated,
    );
  }

  @override
  WidgetProps build() {
    return WidgetProps(
      hidden: hidden ?? false,
      animated: animated ?? false,
      animationDuration: animationDuration ?? const Duration(milliseconds: 100),
      animationCurve: animationCurve ?? Curves.linear,
    );
  }
}

class WidgetProps {
  final bool animated;
  final bool hidden;
  //Animation
  final Duration animationDuration;
  final Curve animationCurve;

  const WidgetProps({
    required this.hidden,
    required this.animationDuration,
    required this.animationCurve,
    required this.animated,
    Key? key,
  });
}
