import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'decorator.dart';

class ClipPathDecorator extends WrapDecorator {
  final Clip? clipBehavior;
  final CustomClipper<Path>? clipper;

  const ClipPathDecorator({this.clipBehavior, this.clipper, super.key});

  @override
  ClipPathDecorator merge(covariant ClipPathDecorator? other) {
    return ClipPathDecorator(
      clipBehavior: other?.clipBehavior ?? clipBehavior,
      clipper: other?.clipper ?? clipper,
    );
  }

  @override
  get props => [clipBehavior, clipper];

  @override
  Widget build(Widget child, MixData mix) {
    return ClipPath(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

class ClipOvalDecorator extends WrapDecorator {
  final Clip? clipBehavior;
  final CustomClipper<Rect>? clipper;

  const ClipOvalDecorator({this.clipper, this.clipBehavior, super.key});

  @override
  ClipOvalDecorator merge(covariant ClipOvalDecorator? other) {
    return ClipOvalDecorator(
      clipper: other?.clipper ?? clipper,
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  get props => [clipBehavior, clipper];

  @override
  Widget build(Widget child, MixData mix) {
    return ClipOval(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

class ClipRectDecorator extends WrapDecorator {
  final Clip? clipBehavior;
  final CustomClipper<Rect>? clipper;

  const ClipRectDecorator({this.clipBehavior, this.clipper, super.key});

  @override
  ClipRectDecorator merge(covariant ClipRectDecorator? other) {
    return ClipRectDecorator(
      clipBehavior: other?.clipBehavior ?? clipBehavior,
      clipper: other?.clipper ?? clipper,
    );
  }

  @override
  get props => [clipBehavior, clipper];

  @override
  Widget build(Widget child, MixData mix) {
    return ClipRect(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

class ClipRRectDecorator extends WrapDecorator {
  final Clip? clipBehavior;
  final BorderRadius? borderRadius;
  final CustomClipper<RRect>? clipper;

  const ClipRRectDecorator({
    this.clipBehavior,
    this.borderRadius,
    this.clipper,
    super.key,
  });

  @override
  ClipRRectDecorator merge(covariant ClipRRectDecorator? other) {
    return ClipRRectDecorator(
      clipBehavior: other?.clipBehavior ?? clipBehavior,
      borderRadius: other?.borderRadius ?? borderRadius,
      clipper: other?.clipper ?? clipper,
    );
  }

  @override
  get props => [clipBehavior, borderRadius, clipper];

  @override
  Widget build(Widget child, MixData mix) {
    return ClipRRect(
      key: key,
      borderRadius: borderRadius ?? BorderRadius.zero,
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
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
