import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

import 'box_spec.g.dart';

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
    this.padding,
    this.margin,
    this.constraints,
    this.decoration,
    this.foregroundDecoration,
    this.transform,
    this.transformAlignment,
    this.clipBehavior,
    this.width,
    this.height,
    super.animated,
  });

  final AlignmentGeometry? alignment;

  final SpacingDto? padding;

  final SpacingDto? margin;

  final BoxConstraintsDto? constraints;

  final DecorationDto? decoration;

  final DecorationDto? foregroundDecoration;

  final Matrix4? transform;

  final AlignmentGeometry? transformAlignment;

  final Clip? clipBehavior;

  final double? width;

  final double? height;

  @override
  BoxTestSpec resolve(MixData mix) {
    return BoxTestSpec(
      alignment: alignment,
      padding: padding?.resolve(mix),
      margin: margin?.resolve(mix),
      constraints: constraints?.resolve(mix),
      decoration: decoration?.resolve(mix),
      foregroundDecoration: foregroundDecoration?.resolve(mix),
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      width: width,
      height: height,
      animated: animated?.resolve(mix),
    );
  }

  @override
  BoxTestSpecAttribute merge(BoxTestSpecAttribute? other) {
    if (other == null) return this;

    return BoxTestSpecAttribute(
      alignment: other.alignment ?? alignment,
      padding: padding?.merge(other.padding) ?? other.padding,
      margin: margin?.merge(other.margin) ?? other.margin,
      constraints: constraints?.merge(other.constraints) ?? other.constraints,
      decoration: decoration?.merge(other.decoration) ?? other.decoration,
      foregroundDecoration:
          foregroundDecoration?.merge(other.foregroundDecoration) ??
              other.foregroundDecoration,
      transform: other.transform ?? transform,
      transformAlignment: other.transformAlignment ?? transformAlignment,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      width: other.width ?? width,
      height: other.height ?? height,
      animated: animated?.merge(other.animated) ?? other.animated,
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
      padding,
      margin,
      constraints,
      decoration,
      foregroundDecoration,
      transform,
      transformAlignment,
      clipBehavior,
      width,
      height,
      animated,
    ];
  }
}
