import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../attributes/border/border_radius_attribute.dart';
import '../factory/mix_provider_data.dart';
import '../utils/border_radius_util.dart';
import 'decorator.dart';

AspectRatioDecorator aspectRatio(double aspectRatio) =>
    AspectRatioDecorator(aspectRatio: aspectRatio);

FlexibleDecorator expanded({int? flex}) =>
    FlexibleDecorator(flex: flex, flexFit: FlexFit.tight);

FlexibleDecorator flexible({int? flex}) =>
    FlexibleDecorator(flex: flex, flexFit: FlexFit.loose);

ClipDecorator clipRounded(double radius) => ClipDecorator(
      ClipDecoratorType.rounded,
      borderRadius: rounded(radius),
    );

ClipDecorator clipOval() => const ClipDecorator(ClipDecoratorType.oval);

ClipDecorator clipTriangle() => const ClipDecorator(ClipDecoratorType.triangle);

OpacityDecorator opacity(double opacity) => OpacityDecorator(opacity);

RotateDecorator rotate(int quarterTurns) =>
    RotateDecorator(value: quarterTurns);

RotateDecorator rotate90() => rotate(1);
RotateDecorator rotate180() => rotate(2);
RotateDecorator rotate270() => rotate(3);

ScaleDecorator scale(double scale) => ScaleDecorator(scale);

class AspectRatioDecorator extends ParentDecorator<double> {
  final double aspectRatio;
  const AspectRatioDecorator({required this.aspectRatio});

  @override
  AspectRatioDecorator merge(AspectRatioDecorator other) {
    return AspectRatioDecorator(aspectRatio: other.aspectRatio);
  }

  @override
  double resolve(MixData mix) => aspectRatio;

  @override
  get props => [aspectRatio];

  @override
  Widget build(Widget child, double value) {
    return AspectRatio(aspectRatio: value, child: child);
  }
}

enum ClipDecoratorType {
  oval,
  rect,
  rounded,
  triangle,
}

class ClipDecorator extends ParentDecorator<ClipDecoratorSpec> {
  final BorderRadiusAttribute? borderRadius;
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

class FlexibleDecorator extends ParentDecorator<FlexibleDecoratorSpec> {
  final int? _flex;
  final FlexFit? _flexFit;
  const FlexibleDecorator({int? flex, FlexFit? flexFit})
      : _flex = flex,
        _flexFit = flexFit;

  @override
  FlexibleDecorator merge(FlexibleDecorator other) {
    return FlexibleDecorator(
      flex: other._flex ?? _flex,
      flexFit: other._flexFit ?? _flexFit,
    );
  }

  @override
  FlexibleDecoratorSpec resolve(MixData mix) {
    return FlexibleDecoratorSpec(flex: _flex, flexFit: _flexFit);
  }

  @override
  get props => [_flexFit, _flex];

  @override
  Widget build(child, value) {
    return Flexible(flex: value.flex, fit: value.flexFit, child: child);
  }
}

class FlexibleDecoratorSpec {
  final int flex;
  final FlexFit flexFit;
  const FlexibleDecoratorSpec({int? flex, FlexFit? flexFit})
      : flex = flex ?? 1,
        flexFit = flexFit ?? FlexFit.loose;
}

class OpacityDecorator extends ParentDecorator<double> {
  final double value;
  const OpacityDecorator(this.value);

  @override
  OpacityDecorator merge(OpacityDecorator? other) {
    return OpacityDecorator(other?.value ?? value);
  }

  @override
  double resolve(MixData mix) => value;

  @override
  get props => [value];

  @override
  Widget build(child, value) {
    return Opacity(opacity: value, child: child);
  }
}

class RotateDecorator extends ParentDecorator<int> {
  final int value;
  const RotateDecorator({required this.value});

  @override
  RotateDecorator merge(RotateDecorator other) {
    return RotateDecorator(value: other.value);
  }

  @override
  int resolve(MixData mix) => value;

  @override
  get props => [value];

  @override
  Widget build(child, value) {
    return RotatedBox(quarterTurns: value, child: child);
  }
}

class ScaleDecorator extends ParentDecorator<double> {
  final double _scale;
  const ScaleDecorator(this._scale);

  @override
  ScaleDecorator merge(ScaleDecorator? other) {
    return ScaleDecorator(other?._scale ?? _scale);
  }

  @override
  double resolve(MixData mix) => _scale;

  @override
  get props => [_scale];

  @override
  Widget build(child, value) {
    return Transform.scale(scale: value, child: child);
  }
}
