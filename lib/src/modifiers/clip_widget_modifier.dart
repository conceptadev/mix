// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/modifier.dart';
import '../factory/mix_provider_data.dart';
import '../helpers/lerp_helpers.dart';

class ClipOvalDecoratorSpec extends DecoratorSpec<ClipOvalDecoratorSpec> {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipOvalDecoratorSpec({this.clipper, this.clipBehavior});

  @override
  ClipOvalDecoratorSpec lerp(ClipOvalDecoratorSpec? other, double t) {
    return ClipOvalDecoratorSpec(
      clipper: lerpSnap(clipper, other?.clipper, t),
      clipBehavior:
          lerpSnap(clipBehavior, other?.clipBehavior, t) ?? clipBehavior,
    );
  }

  @override
  ClipOvalDecoratorSpec copyWith({
    CustomClipper<Rect>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipOvalDecoratorSpec(
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

class ClipOvalDecoratorAttribute extends DecoratorAttribute<
    ClipOvalDecoratorAttribute, ClipOvalDecoratorSpec> {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipOvalDecoratorAttribute({this.clipper, this.clipBehavior});

  @override
  ClipOvalDecoratorAttribute merge(ClipOvalDecoratorAttribute? other) {
    return ClipOvalDecoratorAttribute(
      clipper: other?.clipper ?? clipper,
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipOvalDecoratorSpec resolve(MixData mix) {
    return ClipOvalDecoratorSpec(clipper: clipper, clipBehavior: clipBehavior);
  }

  @override
  get props => [clipper, clipBehavior];
}

class ClipRectDecoratorSpec extends DecoratorSpec<ClipRectDecoratorSpec> {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipRectDecoratorSpec({this.clipper, this.clipBehavior});

  @override
  ClipRectDecoratorSpec lerp(ClipRectDecoratorSpec? other, double t) {
    return ClipRectDecoratorSpec(
      clipper: lerpSnap(clipper, other?.clipper, t),
      clipBehavior:
          lerpSnap(clipBehavior, other?.clipBehavior, t) ?? clipBehavior,
    );
  }

  @override
  ClipRectDecoratorSpec copyWith({
    CustomClipper<Rect>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipRectDecoratorSpec(
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

/// A modifier that wraps a widget with a [ClipRect] widget.
///
/// The [ClipRect] widget is used to clip a widget to a rectangle.
class ClipRectDecoratorAttribute extends DecoratorAttribute<
    ClipRectDecoratorAttribute, ClipRectDecoratorSpec> {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipRectDecoratorAttribute({this.clipper, this.clipBehavior});

  @override
  ClipRectDecoratorAttribute merge(ClipRectDecoratorAttribute? other) {
    return ClipRectDecoratorAttribute(
      clipper: other?.clipper ?? clipper,
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipRectDecoratorSpec resolve(MixData mix) {
    return ClipRectDecoratorSpec(clipper: clipper, clipBehavior: clipBehavior);
  }

  @override
  get props => [clipper, clipBehavior];
}

class ClipRRectDecoratorSpec extends DecoratorSpec<ClipRRectDecoratorSpec> {
  final BorderRadiusGeometry? borderRadius;
  final CustomClipper<RRect>? clipper;
  final Clip? clipBehavior;

  const ClipRRectDecoratorSpec({
    this.borderRadius,
    this.clipper,
    this.clipBehavior,
  });

  @override
  ClipRRectDecoratorSpec lerp(ClipRRectDecoratorSpec? other, double t) {
    return ClipRRectDecoratorSpec(
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other?.borderRadius, t),
      clipper: lerpSnap(clipper, other?.clipper, t),
      clipBehavior:
          lerpSnap(clipBehavior, other?.clipBehavior, t) ?? clipBehavior,
    );
  }

  @override
  ClipRRectDecoratorSpec copyWith({
    BorderRadiusGeometry? borderRadius,
    CustomClipper<RRect>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipRRectDecoratorSpec(
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

class ClipRRectDecoratorAttribute extends DecoratorAttribute<
    ClipRRectDecoratorAttribute, ClipRRectDecoratorSpec> {
  final BorderRadiusGeometry? borderRadius;
  final CustomClipper<RRect>? clipper;
  final Clip? clipBehavior;

  const ClipRRectDecoratorAttribute({
    this.borderRadius,
    this.clipper,
    this.clipBehavior,
  });

  @override
  ClipRRectDecoratorAttribute merge(ClipRRectDecoratorAttribute? other) {
    return ClipRRectDecoratorAttribute(
      borderRadius: other?.borderRadius ?? borderRadius,
      clipper: other?.clipper ?? clipper,
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipRRectDecoratorSpec resolve(MixData mix) {
    return ClipRRectDecoratorSpec(
      borderRadius: borderRadius,
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
    );
  }

  @override
  get props => [borderRadius, clipper, clipBehavior];
}

@immutable
class ClipPathDecoratorSpec extends DecoratorSpec<ClipPathDecoratorSpec> {
  final CustomClipper<Path>? clipper;
  final Clip? clipBehavior;

  const ClipPathDecoratorSpec({this.clipper, this.clipBehavior});

  @override
  ClipPathDecoratorSpec lerp(ClipPathDecoratorSpec? other, double t) {
    return ClipPathDecoratorSpec(
      clipper: lerpSnap(clipper, other?.clipper, t),
      clipBehavior:
          lerpSnap(clipBehavior, other?.clipBehavior, t) ?? clipBehavior,
    );
  }

  @override
  ClipPathDecoratorSpec copyWith({
    CustomClipper<Path>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipPathDecoratorSpec(
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

/// A modifier that wraps a widget with a [ClipPath] widget.
///
/// The [ClipPath] widget is used to clip a widget using a custom clipper.
class ClipPathDecoratorAttribute extends DecoratorAttribute<
    ClipPathDecoratorAttribute, ClipPathDecoratorSpec> {
  final CustomClipper<Path>? clipper;
  final Clip? clipBehavior;

  const ClipPathDecoratorAttribute({this.clipper, this.clipBehavior});

  @override
  ClipPathDecoratorAttribute merge(ClipPathDecoratorAttribute? other) {
    return ClipPathDecoratorAttribute(
      clipper: other?.clipper ?? clipper,
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipPathDecoratorSpec resolve(MixData mix) {
    return ClipPathDecoratorSpec(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
    );
  }

  @override
  get props => [clipper, clipBehavior];
}

@immutable
class ClipTriangleDecoratorSpec
    extends DecoratorSpec<ClipTriangleDecoratorSpec> {
  final Clip? clipBehavior;

  const ClipTriangleDecoratorSpec({this.clipBehavior});

  @override
  ClipTriangleDecoratorSpec lerp(ClipTriangleDecoratorSpec? other, double t) {
    return ClipTriangleDecoratorSpec(
      clipBehavior:
          lerpSnap(clipBehavior, other?.clipBehavior, t) ?? clipBehavior,
    );
  }

  @override
  ClipTriangleDecoratorSpec copyWith({Clip? clipBehavior}) {
    return ClipTriangleDecoratorSpec(
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

/// A modifier that wraps a widget with a custom [ClipPath] widget with a [TriangleClipper].
///
/// The [TriangleClipper] is used to clip a widget to a triangle shape.
class ClipTriangleDecoratorAttribute extends DecoratorAttribute<
    ClipTriangleDecoratorAttribute, ClipTriangleDecoratorSpec> {
  final Clip? clipBehavior;

  const ClipTriangleDecoratorAttribute({this.clipBehavior});

  @override
  ClipTriangleDecoratorAttribute merge(ClipTriangleDecoratorAttribute? other) {
    return ClipTriangleDecoratorAttribute(
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipTriangleDecoratorSpec resolve(MixData mix) {
    return ClipTriangleDecoratorSpec(clipBehavior: clipBehavior);
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

class ClipPathUtility<T extends Attribute>
    extends MixUtility<T, ClipPathDecoratorAttribute> {
  const ClipPathUtility(super.builder);

  T call({CustomClipper<Path>? clipper, Clip? clipBehavior}) {
    return builder(
      ClipPathDecoratorAttribute(clipper: clipper, clipBehavior: clipBehavior),
    );
  }
}

class ClipRRectUtility<T extends Attribute>
    extends MixUtility<T, ClipRRectDecoratorAttribute> {
  const ClipRRectUtility(super.builder);
  T call({
    BorderRadius? borderRadius,
    CustomClipper<RRect>? clipper,
    Clip? clipBehavior,
  }) {
    return builder(
      ClipRRectDecoratorAttribute(
        borderRadius: borderRadius,
        clipper: clipper,
        clipBehavior: clipBehavior,
      ),
    );
  }
}

class ClipOvalUtility<T extends Attribute>
    extends MixUtility<T, ClipOvalDecoratorAttribute> {
  const ClipOvalUtility(super.builder);
  T call({CustomClipper<Rect>? clipper, Clip? clipBehavior}) {
    return builder(
      ClipOvalDecoratorAttribute(clipper: clipper, clipBehavior: clipBehavior),
    );
  }
}

class ClipRectUtility<T extends Attribute>
    extends MixUtility<T, ClipRectDecoratorAttribute> {
  const ClipRectUtility(super.builder);
  T call({CustomClipper<Rect>? clipper, Clip? clipBehavior}) {
    return builder(
      ClipRectDecoratorAttribute(clipper: clipper, clipBehavior: clipBehavior),
    );
  }
}

class ClipTriangleUtility<T extends Attribute>
    extends MixUtility<T, ClipTriangleDecoratorAttribute> {
  const ClipTriangleUtility(super.builder);
  T call({Clip? clipBehavior}) {
    return builder(ClipTriangleDecoratorAttribute(clipBehavior: clipBehavior));
  }
}
