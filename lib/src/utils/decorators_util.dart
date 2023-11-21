import 'package:flutter/material.dart';

import '../decorators/clip_decorator.dart';
import '../decorators/default_decorators.dart';
import 'scalar_util.dart';

const aspectRatio = AspectRatioDecorator.new;

const opacity = OpacityDecorator.new;
const flexible = FlexibleDecoratorUtility(FlexibleDecorator.new);

const rotate = RotateUtility(RotateDecorator.new);

class FlexibleDecoratorUtility
    extends MixUtility<FlexibleDecorator, FlexibleDto> {
  const FlexibleDecoratorUtility(super.builder);

  FlexibleDecorator flexFit(FlexFit fit) => call(fit: fit);
  FlexibleDecorator flex(int flex) => call(flex: flex);

  FlexibleDecorator tight([int? flex]) => call(flex: flex, fit: FlexFit.tight);
  FlexibleDecorator loose([int? flex]) => call(flex: flex, fit: FlexFit.loose);

  FlexibleDecorator expanded([int? flex]) => tight(flex);

  FlexibleDecorator call({int? flex, FlexFit? fit}) {
    return builder(FlexibleDto(flex: flex, flexFit: fit));
  }
}

class RotateUtility<T> extends ScalarUtility<T, int> {
  const RotateUtility(super.builder);
  T get d90 => call(1);
  T get d180 => call(2);
  T get d270 => call(3);
}

const scale = ScaleDecorator.new;

const clipRounded = clipRRect;
const clipOval = ClipOvalDecorator.new;
const clipPath = ClipPathDecorator.new;

ClipRRectDecorator clipRRect(
  double radius, {
  CustomClipper<RRect>? clipper,
  Clip? clipBehavior,
}) {
  return ClipRRectDecorator(
    clipper: clipper,
    clipBehavior: clipBehavior,
    borderRadius: BorderRadius.circular(radius),
  );
}

// ClipDecorator clipOval() => const ClipDecorator(ClipDecoratorType.oval);

ClipDecorator clipTriangle({Clip? clipBehavior}) {
  return ClipPathDecorator(
    clipper: const TriangleClipper(),
    clipBehavior: clipBehavior,
  );
}
