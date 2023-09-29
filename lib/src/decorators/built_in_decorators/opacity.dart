import 'package:flutter/material.dart';

import '../../attributes/shared/shared.descriptor.dart';
import '../../factory/mix_provider_data.dart';
import '../decorator.dart';

class OpacityDecorator extends WidgetDecorator<OpacityDecorator> {
  final double opacity;
  const OpacityDecorator({required this.opacity, super.key});

  @override
  get props => [opacity];
  @override
  OpacityDecorator merge(OpacityDecorator other) {
    return OpacityDecorator(opacity: other.opacity);
  }

  @override
  Widget build(MixData mix, Widget child) {
    final common = CommonDescriptor.fromContext(mix);

    return common.animated
        ? AnimatedOpacity(
            key: key,
            child: child,
            opacity: opacity,
            curve: common.animationCurve,
            duration: common.animationDuration,
          )
        : Opacity(key: key, opacity: opacity, child: child);
  }
}
