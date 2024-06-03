import 'package:flutter/material.dart';

import '../../attributes/constraints/constraints_dto.dart';
import '../../attributes/decoration/decoration_dto.dart';
import '../../attributes/spacing/spacing_dto.dart';
import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'box_spec.dart';

/// Represents the attributes of a [BoxSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [BoxSpec], such as alignment, padding, margin, constraints,
/// decoration, and more.
///
/// Use this class to configure the attributes of a [BoxSpec] and pass it to
/// the [BoxSpec] constructor.
class BoxSpecAttribute extends SpecAttribute<BoxSpec> {
  /// The alignment of the child within the box.
  final AlignmentGeometry? alignment;

  /// The alignment of the origin of the coordinate system used to paint the box's
  /// contents with respect to the box's bounds.
  final AlignmentGeometry? transformAlignment;

  /// The padding to apply inside the box.
  final SpacingDto? padding;

  /// The margin to apply outside the box.
  final SpacingDto? margin;

  /// The constraints to apply to the box.
  final BoxConstraintsDto? constraints;

  /// The decoration to paint behind the box's child.
  final DecorationDto? decoration;

  /// The decoration to paint in front of the box's child.
  final DecorationDto? foregroundDecoration;

  /// The transformation matrix to apply to the box.
  final Matrix4? transform;

  /// The clipping behavior to apply to the box.
  final Clip? clipBehavior;

  /// The width of the box.
  final double? width;

  /// The height of the box.
  final double? height;

  /// Creates a new [BoxSpecAttribute] with the specified properties.
  const BoxSpecAttribute({
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

  /// Resolves this [BoxSpecAttribute] into a [BoxSpec] using the provided [MixData].
  ///
  /// This method creates a new [BoxSpec] instance with the resolved values of
  /// this attribute's properties.
  @override
  BoxSpec resolve(MixData mix) {
    return BoxSpec(
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
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  /// Merges this [BoxSpecAttribute] with another [BoxSpecAttribute].
  ///
  /// This method creates a new [BoxSpecAttribute] instance with the merged
  /// values of this attribute and the [other] attribute. If a property is
  /// defined in [other], it takes precedence over the corresponding property
  /// in this attribute.
  @override
  BoxSpecAttribute merge(BoxSpecAttribute? other) {
    if (other == null) return this;

    return BoxSpecAttribute(
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
      animated: other.animated ?? animated,
    );
  }

  /// The list of properties that constitute the state of this [BoxSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BoxSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
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
