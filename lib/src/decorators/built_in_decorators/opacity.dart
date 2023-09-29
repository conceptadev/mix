import 'package:flutter/material.dart';

import '../../attributes/shared/shared.descriptor.dart';
import '../../factory/mix_provider_data.dart';
import '../decorator.dart';

class OpacityDecorator extends WidgetDecorator<OpacityDecorator> {
  final double opacity;
  const OpacityDecorator({super.key, required this.opacity});

  @override
  OpacityDecorator merge(OpacityDecorator other) {
    return OpacityDecorator(opacity: other.opacity);
  }

  @override
  get props => [opacity];
  @override
  Widget build(Widget child, MixData mix) {
    final common = CommonDescriptor.fromContext(mix);

    return common.animated
        ? AnimatedOpacity(
            key: key,
            opacity: opacity,
            curve: common.animationCurve,
            duration: common.animationDuration,
            child: child,
          )
        : Opacity(key: key, opacity: opacity, child: child);
  }
}
