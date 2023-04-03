import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import 'shared.attributes.dart';

class CommonDescriptor {
  final bool visible;
  //Animation
  final bool animated;
  final Duration animationDuration;
  final Curve animationCurve;
  final TextDirection? textDirection;

  const CommonDescriptor({
    required this.visible,
    required this.animated,
    required this.animationDuration,
    required this.animationCurve,
    this.textDirection,
  });

  factory CommonDescriptor.fromContext(MixData mix) {
    final common = mix.attributesOfType<SharedWidgetAttributes>();

    return CommonDescriptor(
      visible: common?.visible ?? true,
      animated: common?.animated ?? false,
      animationDuration: common?.animationDuration ??
          const Duration(
            milliseconds: 100,
          ),
      animationCurve: common?.animationCurve ?? Curves.linear,
      textDirection: common?.textDirection,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommonDescriptor &&
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
