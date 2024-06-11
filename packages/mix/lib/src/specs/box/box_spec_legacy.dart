import 'package:flutter/material.dart';

import '../../attributes/animated/animated_data_dto.dart';
import '../../attributes/constraints/constraints_dto.dart';
import '../../attributes/constraints/constraints_util.dart';
import '../../attributes/decoration/decoration_dto.dart';
import '../../attributes/decoration/decoration_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/spacing/spacing_dto.dart';
import '../../attributes/spacing/spacing_util.dart';
import '../../core/attribute.dart';
import '../../core/models/animated_data.dart';
import '../../core/models/mix_data.dart';
import '../../core/spec.dart';
import '../../factory/mix_provider.dart';
import '../../internal/lerp_helpers.dart';

/// A specification class that defines layout and styling attributes for a box.
///
/// Use [BoxSpecLegacy] to configure various properties such as alignment, padding,
/// margin, width, height, decoration, and more for a box.
///
/// To retrieve an instance of [BoxSpecLegacy], use the [BoxSpecLegacy.of] method with a
/// [BuildContext], or the [BoxSpecLegacy.from] method with [MixData].
class BoxSpecLegacy extends Spec<BoxSpecLegacy> {
  /// Aligns the child within the box.
  final AlignmentGeometry? alignment;

  /// Adds empty space inside the box.
  final EdgeInsetsGeometry? padding;

  /// Adds empty space around the box.
  final EdgeInsetsGeometry? margin;

  /// Applies additional constraints to the child.
  final BoxConstraints? constraints;

  /// Paints a decoration behind the child.
  final Decoration? decoration;

  /// Paints a decoration in front of the child.
  final Decoration? foregroundDecoration;

  /// Applies a transformation matrix before painting the box.
  final Matrix4? transform;

  /// Aligns the origin of the coordinate system for the [transform].
  final AlignmentGeometry? transformAlignment;

  /// Defines the clip behavior for the box when [BoxConstraints] has a negative
  /// minimum extent.
  final Clip? clipBehavior;

  /// Specifies the width of the box.
  final double? width;

  /// Specifies the height of the box.
  final double? height;

  /// Creates a [BoxSpecLegacy] with the given properties.
  ///
  /// All parameters are required to ensure explicit configuration of each
  /// attribute.
  const BoxSpecLegacy({
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

  /// Creates a [BoxSpecLegacy] with all properties required
  ///
  /// All parameters are required to ensure explicit configuration of each
  /// attribute.
  const BoxSpecLegacy.exhaustive({
    required this.alignment,
    required this.padding,
    required this.margin,
    required this.constraints,
    required this.decoration,
    required this.foregroundDecoration,
    required this.transform,
    required this.transformAlignment,
    required this.clipBehavior,
    required this.width,
    required this.height,
    required super.animated,
  });

  /// Retrieves the [BoxSpecLegacy] from the nearest [Mix] ancestor.
  ///
  /// If no ancestor is found, returns [BoxSpecLegacy.empty].
  static BoxSpecLegacy of(BuildContext context) {
    final mix = Mix.of(context);

    return BoxSpecLegacy.from(mix);
  }

  /// Retrieves the [BoxSpecLegacy] from the given [MixData].
  ///
  /// If not found, returns [BoxSpecLegacy.empty].
  static BoxSpecLegacy from(MixData mix) {
    return mix.attributeOf<BoxSpecLegacyAttribute>()?.resolve(mix) ??
        const BoxSpecLegacy();
  }

  /// Returns a new [BoxSpecLegacy] with the specified properties replaced.
  ///
  /// This method is useful for creating modified copies of an existing
  /// [BoxSpecLegacy] with some attributes changed.
  @override
  BoxSpecLegacy copyWith({
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxConstraints? constraints,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip? clipBehavior,
    AnimatedData? animated,
  }) {
    return BoxSpecLegacy(
      alignment: alignment ?? this.alignment,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      constraints: constraints ?? this.constraints,
      decoration: decoration ?? this.decoration,
      foregroundDecoration: foregroundDecoration ?? this.foregroundDecoration,
      transform: transform ?? this.transform,
      transformAlignment: transformAlignment ?? this.transformAlignment,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      width: width ?? this.width,
      height: height ?? this.height,
      animated: animated ?? this.animated,
    );
  }

  /// Linearly interpolates between two [BoxSpecLegacy] instances.
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging
  /// from 0.0 to 1.0.
  @override
  BoxSpecLegacy lerp(BoxSpecLegacy? other, double t) {
    if (other == null) return this;

    return BoxSpecLegacy(
      alignment: AlignmentGeometry.lerp(alignment, other.alignment, t),
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t),
      margin: EdgeInsetsGeometry.lerp(margin, other.margin, t),
      constraints: BoxConstraints.lerp(constraints, other.constraints, t),
      decoration: Decoration.lerp(decoration, other.decoration, t),
      foregroundDecoration: Decoration.lerp(
        foregroundDecoration,
        other.foregroundDecoration,
        t,
      ),
      transform: lerpMatrix4(transform, other.transform, t),
      transformAlignment: AlignmentGeometry.lerp(
        transformAlignment,
        other.transformAlignment,
        t,
      ),
      clipBehavior: lerpSnap(clipBehavior, other.clipBehavior, t),
      width: lerpDouble(width, other.width, t),
      height: lerpDouble(height, other.height, t),
      // Animated data does not have to be lerped
      animated: lerpSnap(animated, other.animated, t),
    );
  }

  /// Returns a list of properties that constitute this [BoxSpecLegacy].
  ///
  /// This is typically used for equality comparisons.
  @override
  List<Object?> get props => [
        alignment,
        width,
        height,
        padding,
        margin,
        constraints,
        decoration,
        foregroundDecoration,
        transform,
        transformAlignment,
        clipBehavior,
        animated,
      ];
}

/// A tween that interpolates between two [BoxSpecLegacy] instances.
///
/// This class can be used in animations to smoothly transition between
/// different box specifications.
class BoxSpecLegacyTween extends Tween<BoxSpecLegacy?> {
  /// Creates a [BoxSpecLegacyTween] with the optional [begin] and [end] values.
  BoxSpecLegacyTween({super.begin, super.end});

  /// Returns the interpolated [BoxSpecLegacy] at the given progress [t].
  ///
  /// The parameter [t] typically ranges from 0.0 to 1.0.
  @override
  BoxSpecLegacy lerp(double t) {
    if (begin == null && end == null) return const BoxSpecLegacy();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}

/// Provides utility methods for configuring [BoxSpecLegacyAttribute]s.
///
/// Use this class to define reusable styling and layout configurations
/// for [BoxSpecLegacy]s.
class BoxSpecLegacyUtility<T extends Attribute>
    extends SpecUtility<T, BoxSpecLegacyAttribute> {
  /// Utilities for configuring the [BoxSpecLegacyAttribute.decoration].
  late final decoration = BoxDecorationUtility((v) => only(decoration: v));

  /// Utilities for configuring the [BoxSpecLegacyAttribute.foregroundDecoration].
  late final foregroundDecoration =
      BoxDecorationUtility((v) => only(foregroundDecoration: v));

  /// Utilities for configuring the [BoxSpecLegacyAttribute.alignment].
  late final alignment = AlignmentUtility((v) => only(alignment: v));

  /// Utilities for configuring the [BoxSpecLegacyAttribute.padding].
  late final padding = SpacingUtility((v) => only(padding: v));

  /// Utilities for configuring the [BoxSpecLegacyAttribute.margin].
  late final margin = SpacingUtility((v) => only(margin: v));

  /// Utilities for configuring the [BoxSpecLegacyAttribute.constraints].
  late final constraints = BoxConstraintsUtility((v) => only(constraints: v));

  /// Utilities for configuring the [BoxSpecLegacyAttribute.transform].
  late final transform = Matrix4Utility((v) => only(transform: v));

  /// Utilities for configuring the [BoxSpecLegacyAttribute.transformAlignment].
  late final transformAlignment = AlignmentUtility((v) => only(alignment: v));

  /// Utilities for configuring the [BoxSpecLegacyAttribute.clipBehavior].
  late final clipBehavior = ClipUtility((v) => only(clipBehavior: v));

  /// Utilities for configuring the [BoxSpecLegacyAttribute.width].
  late final width = DoubleUtility((v) => only(width: v));

  /// Utilities for configuring the [BoxSpecLegacyAttribute.height].
  late final height = DoubleUtility((v) => only(height: v));

  /// Utilities for configuring various properties of the [BoxSpecLegacyAttribute.decoration].
  late final color = decoration.color;
  late final elevation = decoration.elevation;
  late final radialGradient = gradient.radial;
  late final linearGradient = gradient.linear;
  late final shapeDecoration =
      ShapeDecorationUtility((v) => only(decoration: v));
  late final borderRadius = decoration.borderRadius;
  late final gradient = decoration.gradient;
  late final borderRadiusDirectional = decoration.borderRadiusDirectional;
  late final border = decoration.border;
  late final borderDirectional = decoration.borderDirectional;
  late final shadows = decoration.boxShadows;
  late final shadow = decoration.boxShadow;

  /// Utilities for configuring various properties of the [BoxSpecLegacyAttribute.constraints].
  late final maxWidth = constraints.maxWidth;
  late final minWidth = constraints.minWidth;
  late final maxHeight = constraints.maxHeight;
  late final minHeight = constraints.minHeight;

  /// Creates a new [BoxSpecLegacyUtility] with the given [builder].
  BoxSpecLegacyUtility(super.builder);

  /// Returns a new [BoxSpecLegacyAttribute] with the specified properties.
  @override
  T only({
    AlignmentGeometry? alignment,
    SpacingDto? padding,
    SpacingDto? margin,
    DecorationDto? decoration,
    DecorationDto? foregroundDecoration,
    BoxConstraintsDto? constraints,
    double? width,
    double? height,
    Matrix4? transform,
    Clip? clipBehavior,
    AnimatedDataDto? animated,
  }) {
    return builder(
      BoxSpecLegacyAttribute(
        alignment: alignment,
        padding: padding,
        margin: margin,
        constraints: constraints,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        transform: transform,
        clipBehavior: clipBehavior,
        width: width,
        height: height,
        animated: animated,
      ),
    );
  }
}

/// Represents the attributes of a [BoxSpecLegacy].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [BoxSpecLegacy].
///
/// Use this class to configure the attributes of a [BoxSpecLegacy] and pass it to
/// the [BoxSpecLegacy] constructor.
class BoxSpecLegacyAttribute extends SpecAttribute<BoxSpecLegacy> {
  /// Aligns the child within the box.
  final AlignmentGeometry? alignment;

  /// Adds empty space inside the box.
  final SpacingDto? padding;

  /// Adds empty space around the box.
  final SpacingDto? margin;

  /// Applies additional constraints to the child.
  final BoxConstraintsDto? constraints;

  /// Paints a decoration behind the child.
  final DecorationDto? decoration;

  /// Paints a decoration in front of the child.
  final DecorationDto? foregroundDecoration;

  /// Applies a transformation matrix before painting the box.
  final Matrix4? transform;

  /// Aligns the origin of the coordinate system for the [transform].
  final AlignmentGeometry? transformAlignment;

  /// Defines the clip behavior for the box when [BoxConstraints] has a negative
  /// minimum extent.
  final Clip? clipBehavior;

  /// Specifies the width of the box.
  final double? width;

  /// Specifies the height of the box.
  final double? height;

  const BoxSpecLegacyAttribute({
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

  @override
  BoxSpecLegacy resolve(MixData mix) {
    return BoxSpecLegacy(
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
  BoxSpecLegacyAttribute merge(BoxSpecLegacyAttribute? other) {
    if (other == null) return this;

    return BoxSpecLegacyAttribute(
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

  /// The list of properties that constitute the state of this [BoxSpecLegacyAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BoxSpecLegacyAttribute] instances for equality.
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
