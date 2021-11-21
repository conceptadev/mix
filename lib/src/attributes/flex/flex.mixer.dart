import 'package:flutter/material.dart';
import 'package:mix/src/mixer/mixer.dart';

class FlexMixer {
  final Axis? direction;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final VerticalDirection verticalDirection;
  final double? gapSize;

  const FlexMixer({
    this.direction,
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
    required this.mainAxisSize,
    required this.verticalDirection,
    this.gapSize,
  });

  factory FlexMixer.fromContext(MixContext mixContext) {
    final flex = mixContext.mix.flexAttribute;
    return FlexMixer(
      direction: flex?.direction,
      mainAxisAlignment: flex?.mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: flex?.crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: flex?.mainAxisSize ?? MainAxisSize.max,
      verticalDirection: flex?.verticalDirection ?? VerticalDirection.down,
      gapSize: flex?.gapSize,
    );
  }
}
