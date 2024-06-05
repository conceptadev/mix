import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

import 'box_spec_spec.g.dart';

/// Represents the attributes of a [BoxTestSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [BoxTestSpec].
///
/// Use this class to configure the attributes of a [BoxTestSpec] and pass it to
/// the [BoxTestSpec] constructor.
class BoxTestSpecAttribute extends SpecAttribute<BoxTestSpec> {
  const BoxTestSpecAttribute({
    this.alignment,
    super.animated,
    this.clipBehavior,
    this.constraints,
    this.decoration,
    this.foregroundDecoration,
    this.height,
    this.mapTest,
    this.margin,
    this.padding,
    this.transform,
    this.transformAlignment,
    this.width,
  });

  final AlignmentGeometry? alignment;

  final Clip? clipBehavior;

  final BoxConstraintsDto? constraints;

  final DecorationDto? decoration;

  final DecorationDto? foregroundDecoration;

  final double? height;

  final Map<String, dynamic>? mapTest;

  final SpacingDto? margin;

  final SpacingDto? padding;

  final Matrix4? transform;

  final AlignmentGeometry? transformAlignment;

  final double? width;

  @override
  BoxTestSpec resolve(MixData mix) {
    return BoxTestSpec(
      alignment: alignment,
      animated: animated?.resolve(mix),
      clipBehavior: clipBehavior,
      constraints: constraints?.resolve(mix),
      decoration: decoration?.resolve(mix),
      foregroundDecoration: foregroundDecoration?.resolve(mix),
      height: height,
      mapTest: mapTest,
      margin: margin?.resolve(mix),
      padding: padding?.resolve(mix),
      transform: transform,
      transformAlignment: transformAlignment,
      width: width,
    );
  }

  @override
  BoxTestSpecAttribute merge(BoxTestSpecAttribute? other) {
    if (other == null) return this;

    return BoxTestSpecAttribute(
      alignment: other.alignment ?? alignment,
      animated: animated?.merge(other.animated) ?? other.animated,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      constraints: constraints?.merge(other.constraints) ?? other.constraints,
      decoration: decoration?.merge(other.decoration) ?? other.decoration,
      foregroundDecoration:
          foregroundDecoration?.merge(other.foregroundDecoration) ??
              other.foregroundDecoration,
      height: other.height ?? height,
      mapTest: other.mapTest ?? mapTest,
      margin: margin?.merge(other.margin) ?? other.margin,
      padding: padding?.merge(other.padding) ?? other.padding,
      transform: other.transform ?? transform,
      transformAlignment: other.transformAlignment ?? transformAlignment,
      width: other.width ?? width,
    );
  }

  /// The list of properties that constitute the state of this [BoxTestSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BoxTestSpecAttribute] instances for equality.
  @override
  List<Object?> get props {
    return [
      alignment,
      animated,
      clipBehavior,
      constraints,
      decoration,
      foregroundDecoration,
      height,
      mapTest,
      margin,
      padding,
      transform,
      transformAlignment,
      width,
    ];
  }
}
