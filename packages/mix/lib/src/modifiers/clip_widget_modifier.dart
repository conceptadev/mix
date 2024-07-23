// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../attributes/border/border_radius_dto.dart';
import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/factory/mix_provider.dart';
import '../core/modifier.dart';
import '../core/utility.dart';
import '../internal/diagnostic_properties_builder_ext.dart';

part 'clip_widget_modifier.g.dart';

@MixableSpec(prefix: 'ClipOvalModifier', skipUtility: true)
final class ClipOvalModifierSpec
    extends WidgetModifierSpec<ClipOvalModifierSpec>
    with _$ClipOvalModifierSpec {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipOvalModifierSpec({this.clipper, this.clipBehavior});

  @override
  Widget build(Widget child) {
    return ClipOval(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

@MixableSpec(prefix: 'ClipRectModifier', skipUtility: true)
final class ClipRectModifierSpec
    extends WidgetModifierSpec<ClipRectModifierSpec>
    with _$ClipRectModifierSpec {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipRectModifierSpec({this.clipper, this.clipBehavior});

  @override
  Widget build(Widget child) {
    return ClipRect(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.hardEdge,
      child: child,
    );
  }
}

@MixableSpec(prefix: 'ClipRRectModifier', skipUtility: true)
final class ClipRRectModifierSpec
    extends WidgetModifierSpec<ClipRRectModifierSpec>
    with _$ClipRRectModifierSpec {
  final BorderRadiusGeometry? borderRadius;
  final CustomClipper<RRect>? clipper;
  final Clip? clipBehavior;

  const ClipRRectModifierSpec({
    this.borderRadius,
    this.clipper,
    this.clipBehavior,
  });

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

@MixableSpec(prefix: 'ClipPathModifier', skipUtility: true)
final class ClipPathModifierSpec
    extends WidgetModifierSpec<ClipPathModifierSpec>
    with _$ClipPathModifierSpec {
  final CustomClipper<Path>? clipper;
  final Clip? clipBehavior;

  const ClipPathModifierSpec({this.clipper, this.clipBehavior});

  @override
  Widget build(Widget child) {
    return ClipPath(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

@MixableSpec(prefix: 'ClipTriangleModifier', skipUtility: true)
final class ClipTriangleModifierSpec
    extends WidgetModifierSpec<ClipTriangleModifierSpec>
    with _$ClipTriangleModifierSpec {
  final Clip? clipBehavior;

  const ClipTriangleModifierSpec({this.clipBehavior});

  @override
  Widget build(Widget child) {
    return ClipPath(
      clipper: const TriangleClipper(),
      clipBehavior: clipBehavior ?? Clip.antiAlias,
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

final class ClipPathUtility<T extends Attribute>
    extends MixUtility<T, ClipPathModifierAttribute> {
  const ClipPathUtility(super.builder);

  T call({CustomClipper<Path>? clipper, Clip? clipBehavior}) {
    return builder(
      ClipPathModifierAttribute(clipper: clipper, clipBehavior: clipBehavior),
    );
  }
}

final class ClipRRectUtility<T extends Attribute>
    extends MixUtility<T, ClipRRectModifierAttribute> {
  const ClipRRectUtility(super.builder);
  T call({
    BorderRadius? borderRadius,
    CustomClipper<RRect>? clipper,
    Clip? clipBehavior,
  }) {
    return builder(
      ClipRRectModifierAttribute(
        borderRadius: borderRadius?.toDto(),
        clipper: clipper,
        clipBehavior: clipBehavior,
      ),
    );
  }
}

final class ClipOvalUtility<T extends Attribute>
    extends MixUtility<T, ClipOvalModifierAttribute> {
  const ClipOvalUtility(super.builder);
  T call({CustomClipper<Rect>? clipper, Clip? clipBehavior}) {
    return builder(
      ClipOvalModifierAttribute(clipper: clipper, clipBehavior: clipBehavior),
    );
  }
}

final class ClipRectUtility<T extends Attribute>
    extends MixUtility<T, ClipRectModifierAttribute> {
  const ClipRectUtility(super.builder);
  T call({CustomClipper<Rect>? clipper, Clip? clipBehavior}) {
    return builder(
      ClipRectModifierAttribute(clipper: clipper, clipBehavior: clipBehavior),
    );
  }
}

final class ClipTriangleUtility<T extends Attribute>
    extends MixUtility<T, ClipTriangleModifierAttribute> {
  const ClipTriangleUtility(super.builder);
  T call({Clip? clipBehavior}) {
    return builder(ClipTriangleModifierAttribute(clipBehavior: clipBehavior));
  }
}
