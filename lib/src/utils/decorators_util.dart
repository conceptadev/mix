import 'package:flutter/material.dart';

import '../decorators/clip_decorator.dart';
import '../decorators/default_decorators.dart';

const aspectRatio = AspectRatioDecorator.new;

const expanded = FlexibleDecorator.tight;
const flexible = FlexibleDecorator.loose;

const opacity = OpacityDecorator.new;

const rotate = RotateUtility();

class RotateUtility {
  const RotateUtility();
  RotateDecorator get d90 => call(1);
  RotateDecorator get d180 => call(2);
  RotateDecorator get d270 => call(3);
  RotateDecorator call(int quarterTurns) => RotateDecorator(quarterTurns);
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
