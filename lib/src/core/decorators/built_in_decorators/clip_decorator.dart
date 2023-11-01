import 'package:flutter/material.dart';

import '../../../attributes/data_attributes.dart';
import '../../../factory/mix_provider_data.dart';
import '../../attribute.dart';
import '../../dto/border_dto.dart';
import '../decorator.dart';

const clipOval = _clipOval;
const clipTriangle = _clipTriangle;
const clipRounded = _clipRounded;

ClipDecorator _clipRounded(double radius) {
  return ClipDecorator(
    ClipDecoratorType.rounded,
    borderRadius: BorderRadiusGeometryAttribute(
      BorderRadiusGeometryData.circular(radius),
    ),
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

class ClipDecorator extends ParentDecorator<ClipDecoratorSpec> {
  final BorderRadiusGeometryAttribute? borderRadius;
  final ClipDecoratorType clipType;

  const ClipDecorator(this.clipType, {this.borderRadius});

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
  Widget build(Widget child, ClipDecoratorSpec value) {
    switch (value.clipType) {
      case ClipDecoratorType.triangle:
        return ClipPath(clipper: const TriangleClipper(), child: child);

      case ClipDecoratorType.rect:
        return ClipRect(child: child);

      case ClipDecoratorType.rounded:
        return ClipRRect(borderRadius: value.borderRadius, child: child);

      case ClipDecoratorType.oval:
        return ClipOval(child: child);

      default:
        throw Exception('Unknown clip type: $clipType');
    }
  }
}

class ClipDecoratorSpec extends MixExtension<ClipDecoratorSpec> {
  final BorderRadiusGeometry borderRadius;
  final ClipDecoratorType clipType;
  const ClipDecoratorSpec({
    required this.borderRadius,
    required this.clipType,
  });

  @override
  ClipDecoratorSpec lerp(ClipDecoratorSpec other, double t) {
    // Define a helper method for snapping
    T snap<T>(T from, T to) => t < 0.5 ? from : to;

    return ClipDecoratorSpec(
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t) ??
              BorderRadius.zero,
      clipType: snap(clipType, other.clipType),
    );
  }

  @override
  ClipDecoratorSpec copyWith({
    BorderRadiusGeometry? borderRadius,
    ClipDecoratorType? clipType,
  }) {
    return ClipDecoratorSpec(
      borderRadius: borderRadius ?? this.borderRadius,
      clipType: clipType ?? this.clipType,
    );
  }

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
