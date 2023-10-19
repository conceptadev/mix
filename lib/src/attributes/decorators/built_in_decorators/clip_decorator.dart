import 'package:flutter/material.dart';

import '../../../factory/mix_provider_data.dart';
import '../../border_radius/border_radius.attribute.dart';
import '../../style_attribute.dart';
import '../decorator.dart';

const clipOval = _clipOval;
const clipTriangle = _clipTriangle;
const clipRounded = _clipRounded;

ClipDecorator _clipRounded(double radius) {
  return ClipDecorator(
    ClipDecoratorType.rounded,
    borderRadius: BorderRadiusAttribute.circular(radius),
  );
}

ClipDecorator _clipOval() => const ClipDecorator(ClipDecoratorType.oval);

ClipDecorator _clipTriangle() =>
    const ClipDecorator(ClipDecoratorType.triangle);

enum ClipDecoratorType {
  oval,
  rect,
  rounded,
  triangle,
}

class ClipDecorator extends Decorator<ClipDecoratorSpec> {
  final BorderRadiusAttribute? borderRadius;
  final ClipDecoratorType clipType;

  const ClipDecorator(this.clipType, {this.borderRadius, super.key});

  @override
  @override
  ClipDecorator merge(ClipDecorator other) {
    return ClipDecorator(
      other.clipType,
      borderRadius: other.borderRadius ?? borderRadius,
    );
  }

  @override
  ClipDecoratorSpec resolve(MixData mix) {
    return ClipDecoratorSpec(
      borderRadius: borderRadius?.resolve(mix) ?? BorderRadius.zero,
      clipType: clipType,
    );
  }

  @override
  get props => [borderRadius, clipType];

  @override
  Widget build(Widget child, MixData mix) {
    final spec = resolve(mix);

    switch (spec.clipType) {
      case ClipDecoratorType.triangle:
        return ClipPath(
          key: mergeKey,
          clipper: const TriangleClipper(),
          child: child,
        );

      case ClipDecoratorType.rect:
        return ClipRect(key: mergeKey, child: child);

      case ClipDecoratorType.rounded:
        final animation = mix.commonSpec.animation;

        return mix.animated
            ? AnimatedClipRRect(
                duration: animation.duration,
                curve: animation.curve,
                borderRadius: spec.borderRadius.resolve(mix.directionality),
                key: mergeKey,
                child: child,
              )
            : ClipRRect(
                key: mergeKey,
                borderRadius: spec.borderRadius,
                child: child,
              );

      case ClipDecoratorType.oval:
        return ClipOval(key: mergeKey, child: child);

      default:
        throw Exception('Unknown clip type: $clipType');
    }
  }
}

class ClipDecoratorSpec extends Spec {
  final BorderRadiusGeometry borderRadius;
  final ClipDecoratorType clipType;
  const ClipDecoratorSpec({
    required this.borderRadius,
    required this.clipType,
  });

  @override
  get props => [borderRadius, clipType];
}

class AnimatedClipRRect extends StatelessWidget {
  const AnimatedClipRRect({
    required this.duration,
    this.curve = Curves.linear,
    required this.borderRadius,
    required this.child,
    Key? key,
  }) : super(key: key);

  static Widget _builder(
    BuildContext context,
    BorderRadius radius,
    Widget? child,
  ) {
    return ClipRRect(borderRadius: radius, child: child);
  }

  final Duration duration;
  final Curve curve;
  final BorderRadius borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<BorderRadius>(
      tween: Tween(begin: BorderRadius.zero, end: borderRadius),
      duration: duration,
      curve: curve,
      builder: _builder,
      child: child,
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  const TriangleClipper();
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
