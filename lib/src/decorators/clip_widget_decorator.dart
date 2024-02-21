// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';
import '../helpers/lerp_helpers.dart';

class ClipOvalWidgetSpec extends DecoratorSpec<ClipOvalWidgetSpec> {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipOvalWidgetSpec({this.clipper, this.clipBehavior});

  @override
  ClipOvalWidgetSpec lerp(ClipOvalWidgetSpec? other, double t) {
    return ClipOvalWidgetSpec(
      clipper: lerpSnap(clipper, other?.clipper, t),
      clipBehavior:
          lerpSnap(clipBehavior, other?.clipBehavior, t) ?? clipBehavior,
    );
  }

  @override
  ClipOvalWidgetSpec copyWith({
    CustomClipper<Rect>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipOvalWidgetSpec(
      clipper: clipper ?? this.clipper,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  get props => [clipper, clipBehavior];

  @override
  Widget build(Widget child) {
    return ClipOval(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

class ClipOvalWidgetDecorator
    extends WidgetDecorator<ClipOvalWidgetDecorator, ClipOvalWidgetSpec> {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipOvalWidgetDecorator({this.clipper, this.clipBehavior});

  @override
  ClipOvalWidgetDecorator merge(ClipOvalWidgetDecorator? other) {
    return ClipOvalWidgetDecorator(
      clipper: other?.clipper ?? clipper,
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipOvalWidgetSpec resolve(MixData mix) {
    return ClipOvalWidgetSpec(clipper: clipper, clipBehavior: clipBehavior);
  }

  @override
  get props => [clipper, clipBehavior];
}

class ClipRectWidgetSpec extends DecoratorSpec<ClipRectWidgetSpec> {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipRectWidgetSpec({this.clipper, this.clipBehavior});

  @override
  ClipRectWidgetSpec lerp(ClipRectWidgetSpec? other, double t) {
    return ClipRectWidgetSpec(
      clipper: lerpSnap(clipper, other?.clipper, t),
      clipBehavior:
          lerpSnap(clipBehavior, other?.clipBehavior, t) ?? clipBehavior,
    );
  }

  @override
  ClipRectWidgetSpec copyWith({
    CustomClipper<Rect>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipRectWidgetSpec(
      clipper: clipper ?? this.clipper,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  get props => [clipper, clipBehavior];

  @override
  Widget build(Widget child) {
    return ClipRect(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.hardEdge,
      child: child,
    );
  }
}

/// A decorator that wraps a widget with a [ClipRect] widget.
///
/// The [ClipRect] widget is used to clip a widget to a rectangle.
class ClipRectWidgetDecorator
    extends WidgetDecorator<ClipRectWidgetDecorator, ClipRectWidgetSpec> {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipRectWidgetDecorator({this.clipper, this.clipBehavior});

  @override
  ClipRectWidgetDecorator merge(ClipRectWidgetDecorator? other) {
    return ClipRectWidgetDecorator(
      clipper: other?.clipper ?? clipper,
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipRectWidgetSpec resolve(MixData mix) {
    return ClipRectWidgetSpec(clipper: clipper, clipBehavior: clipBehavior);
  }

  @override
  get props => [clipper, clipBehavior];
}

class ClipRRectWidgetSpec extends DecoratorSpec<ClipRRectWidgetSpec> {
  final BorderRadiusGeometry? borderRadius;
  final CustomClipper<RRect>? clipper;
  final Clip? clipBehavior;

  const ClipRRectWidgetSpec({
    this.borderRadius,
    this.clipper,
    this.clipBehavior,
  });

  @override
  ClipRRectWidgetSpec lerp(ClipRRectWidgetSpec? other, double t) {
    return ClipRRectWidgetSpec(
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other?.borderRadius, t),
      clipper: lerpSnap(clipper, other?.clipper, t),
      clipBehavior:
          lerpSnap(clipBehavior, other?.clipBehavior, t) ?? clipBehavior,
    );
  }

  @override
  ClipRRectWidgetSpec copyWith({
    BorderRadiusGeometry? borderRadius,
    CustomClipper<RRect>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipRRectWidgetSpec(
      borderRadius: borderRadius ?? this.borderRadius,
      clipper: clipper ?? this.clipper,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  get props => [borderRadius, clipper, clipBehavior];

  @override
  Widget build(Widget child) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

class ClipRRectWidgetDecorator
    extends WidgetDecorator<ClipRRectWidgetDecorator, ClipRRectWidgetSpec> {
  final BorderRadiusGeometry? borderRadius;
  final CustomClipper<RRect>? clipper;
  final Clip? clipBehavior;

  const ClipRRectWidgetDecorator({
    this.borderRadius,
    this.clipper,
    this.clipBehavior,
  });

  @override
  ClipRRectWidgetDecorator merge(ClipRRectWidgetDecorator? other) {
    return ClipRRectWidgetDecorator(
      borderRadius: other?.borderRadius ?? borderRadius,
      clipper: other?.clipper ?? clipper,
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipRRectWidgetSpec resolve(MixData mix) {
    return ClipRRectWidgetSpec(
      borderRadius: borderRadius,
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
    );
  }

  @override
  get props => [borderRadius, clipper, clipBehavior];
}

@immutable
class ClipPathWidgetSpec extends DecoratorSpec<ClipPathWidgetSpec> {
  final CustomClipper<Path>? clipper;
  final Clip? clipBehavior;

  const ClipPathWidgetSpec({this.clipper, this.clipBehavior});

  @override
  ClipPathWidgetSpec lerp(ClipPathWidgetSpec? other, double t) {
    return ClipPathWidgetSpec(
      clipper: lerpSnap(clipper, other?.clipper, t),
      clipBehavior:
          lerpSnap(clipBehavior, other?.clipBehavior, t) ?? clipBehavior,
    );
  }

  @override
  ClipPathWidgetSpec copyWith({
    CustomClipper<Path>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipPathWidgetSpec(
      clipper: clipper ?? this.clipper,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  get props => [clipper, clipBehavior];

  @override
  Widget build(Widget child) {
    return ClipPath(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

/// A decorator that wraps a widget with a [ClipPath] widget.
///
/// The [ClipPath] widget is used to clip a widget using a custom clipper.
class ClipPathWidgetDecorator
    extends WidgetDecorator<ClipPathWidgetDecorator, ClipPathWidgetSpec> {
  final CustomClipper<Path>? clipper;
  final Clip? clipBehavior;

  const ClipPathWidgetDecorator({this.clipper, this.clipBehavior});

  @override
  ClipPathWidgetDecorator merge(ClipPathWidgetDecorator? other) {
    return ClipPathWidgetDecorator(
      clipper: other?.clipper ?? clipper,
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipPathWidgetSpec resolve(MixData mix) {
    return ClipPathWidgetSpec(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
    );
  }

  @override
  get props => [clipper, clipBehavior];
}

@immutable
class ClipTriangleWidgetSpec extends DecoratorSpec<ClipTriangleWidgetSpec> {
  final Clip? clipBehavior;

  const ClipTriangleWidgetSpec({this.clipBehavior});

  @override
  ClipTriangleWidgetSpec lerp(ClipTriangleWidgetSpec? other, double t) {
    return ClipTriangleWidgetSpec(
      clipBehavior:
          lerpSnap(clipBehavior, other?.clipBehavior, t) ?? clipBehavior,
    );
  }

  @override
  ClipTriangleWidgetSpec copyWith({Clip? clipBehavior}) {
    return ClipTriangleWidgetSpec(
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  get props => [clipBehavior];

  @override
  Widget build(Widget child) {
    return ClipPath(
      clipper: const TriangleClipper(),
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

/// A decorator that wraps a widget with a custom [ClipPath] widget with a [TriangleClipper].
///
/// The [TriangleClipper] is used to clip a widget to a triangle shape.
class ClipTriangleWidgetDecorator extends WidgetDecorator<
    ClipTriangleWidgetDecorator, ClipTriangleWidgetSpec> {
  final Clip? clipBehavior;

  const ClipTriangleWidgetDecorator({this.clipBehavior});

  @override
  ClipTriangleWidgetDecorator merge(ClipTriangleWidgetDecorator? other) {
    return ClipTriangleWidgetDecorator(
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipTriangleWidgetSpec resolve(MixData mix) {
    return ClipTriangleWidgetSpec(clipBehavior: clipBehavior);
  }

  @override
  get props => [clipBehavior];
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

class ClipPathUtility<T extends StyleAttribute>
    extends MixUtility<T, ClipPathWidgetDecorator> {
  const ClipPathUtility(super.builder);

  T call({CustomClipper<Path>? clipper, Clip? clipBehavior}) {
    return builder(
      ClipPathWidgetDecorator(clipper: clipper, clipBehavior: clipBehavior),
    );
  }
}

class ClipRRectUtility<T extends StyleAttribute>
    extends MixUtility<T, ClipRRectWidgetDecorator> {
  const ClipRRectUtility(super.builder);
  T call({
    BorderRadius? borderRadius,
    CustomClipper<RRect>? clipper,
    Clip? clipBehavior,
  }) {
    return builder(
      ClipRRectWidgetDecorator(
        borderRadius: borderRadius,
        clipper: clipper,
        clipBehavior: clipBehavior,
      ),
    );
  }
}

class ClipOvalUtility<T extends StyleAttribute>
    extends MixUtility<T, ClipOvalWidgetDecorator> {
  const ClipOvalUtility(super.builder);
  T call({CustomClipper<Rect>? clipper, Clip? clipBehavior}) {
    return builder(
      ClipOvalWidgetDecorator(clipper: clipper, clipBehavior: clipBehavior),
    );
  }
}

class ClipRectUtility<T extends StyleAttribute>
    extends MixUtility<T, ClipRectWidgetDecorator> {
  const ClipRectUtility(super.builder);
  T call({CustomClipper<Rect>? clipper, Clip? clipBehavior}) {
    return builder(
      ClipRectWidgetDecorator(clipper: clipper, clipBehavior: clipBehavior),
    );
  }
}

class ClipTriangleUtility<T extends StyleAttribute>
    extends MixUtility<T, ClipTriangleWidgetDecorator> {
  const ClipTriangleUtility(super.builder);
  T call({Clip? clipBehavior}) {
    return builder(ClipTriangleWidgetDecorator(clipBehavior: clipBehavior));
  }
}
