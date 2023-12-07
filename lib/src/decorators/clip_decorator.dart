import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import '../helpers/lerp_helpers.dart';
import 'decorator.dart';

class ClipPathDecorator extends BoxDecorator<ClipPathDecorator> {
  final Clip? clipBehavior;
  final CustomClipper<Path>? clipper;

  const ClipPathDecorator({this.clipBehavior, this.clipper, super.key});

  @override
  ClipPathDecorator lerp(ClipPathDecorator? other, double t) {
    return ClipPathDecorator(
      clipBehavior: lerpSnap(clipBehavior, other?.clipBehavior, t),
      clipper: lerpSnap(clipper, other?.clipper, t),
    );
  }

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

class ClipOvalDecorator extends BoxDecorator<ClipOvalDecorator> {
  final Clip? clipBehavior;
  final CustomClipper<Rect>? clipper;

  const ClipOvalDecorator({this.clipper, this.clipBehavior, super.key});

  @override
  ClipOvalDecorator lerp(ClipOvalDecorator? other, double t) {
    return ClipOvalDecorator(
      clipper: lerpSnap(clipper, other?.clipper, t),
      clipBehavior: lerpSnap(clipBehavior, other?.clipBehavior, t),
    );
  }

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

class ClipRectDecorator extends BoxDecorator<ClipRectDecorator> {
  final Clip? clipBehavior;
  final CustomClipper<Rect>? clipper;

  const ClipRectDecorator({this.clipBehavior, this.clipper, super.key});

  @override
  ClipRectDecorator lerp(ClipRectDecorator? other, double t) {
    return ClipRectDecorator(
      clipBehavior: lerpSnap(clipBehavior, other?.clipBehavior, t),
      clipper: lerpSnap(clipper, other?.clipper, t),
    );
  }

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

class ClipRRectDecorator extends BoxDecorator<ClipRRectDecorator> {
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
  ClipRRectDecorator lerp(ClipRRectDecorator? other, double t) {
    return ClipRRectDecorator(
      clipBehavior: lerpSnap(clipBehavior, other?.clipBehavior, t),
      borderRadius: BorderRadius.lerp(borderRadius, other?.borderRadius, t),
      clipper: lerpSnap(clipper, other?.clipper, t),
    );
  }

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

//

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
