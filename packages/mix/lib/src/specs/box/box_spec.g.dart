// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_spec.dart';

// **************************************************************************
// Generator: SpecDefinitionBuilder
// **************************************************************************

base mixin _$BoxSpec on Spec<BoxSpec> {
  static BoxSpec from(MixData mix) {
    return mix.attributeOf<BoxSpecAttribute>()?.resolve(mix) ?? const BoxSpec();
  }

  static BoxSpec of(BuildContext context) {
    return _$BoxSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [BoxSpec] but with the given fields
  /// replaced with the new values.
  @override
  BoxSpec copyWith({
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxConstraints? constraints,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip? clipBehavior,
    double? width,
    double? height,
    AnimatedData? animated,
  }) {
    return BoxSpec(
      alignment: alignment ?? _$this.alignment,
      padding: padding ?? _$this.padding,
      margin: margin ?? _$this.margin,
      constraints: constraints ?? _$this.constraints,
      decoration: decoration ?? _$this.decoration,
      foregroundDecoration: foregroundDecoration ?? _$this.foregroundDecoration,
      transform: transform ?? _$this.transform,
      transformAlignment: transformAlignment ?? _$this.transformAlignment,
      clipBehavior: clipBehavior ?? _$this.clipBehavior,
      width: width ?? _$this.width,
      height: height ?? _$this.height,
      animated: animated ?? _$this.animated,
    );
  }

  @override
  BoxSpec lerp(BoxSpec? other, double t) {
    if (other == null) return _$this;

    return BoxSpec(
      alignment:
          AlignmentGeometry.lerp(_$this.alignment, other._$this.alignment, t),
      padding: EdgeInsetsGeometry.lerp(_$this.padding, other._$this.padding, t),
      margin: EdgeInsetsGeometry.lerp(_$this.margin, other._$this.margin, t),
      constraints:
          BoxConstraints.lerp(_$this.constraints, other._$this.constraints, t),
      decoration:
          Decoration.lerp(_$this.decoration, other._$this.decoration, t),
      foregroundDecoration: Decoration.lerp(
          _$this.foregroundDecoration, other._$this.foregroundDecoration, t),
      transform: _$lerpMatrix4(_$this.transform, other._$this.transform, t),
      transformAlignment: AlignmentGeometry.lerp(
          _$this.transformAlignment, other._$this.transformAlignment, t),
      clipBehavior: t < 0.5 ? _$this.clipBehavior : other._$this.clipBehavior,
      width: _$lerpDouble(_$this.width, other._$this.width, t),
      height: _$lerpDouble(_$this.height, other._$this.height, t),
      animated: t < 0.5 ? _$this.animated : other._$this.animated,
    );
  }

  /// The list of properties that constitute the state of this [BoxSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BoxSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.alignment,
        _$this.padding,
        _$this.margin,
        _$this.constraints,
        _$this.decoration,
        _$this.foregroundDecoration,
        _$this.transform,
        _$this.transformAlignment,
        _$this.clipBehavior,
        _$this.width,
        _$this.height,
        _$this.animated,
      ];

  BoxSpec get _$this => this as BoxSpec;
}

/// Represents the attributes of a [BoxSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [BoxSpec].
///
/// Use this class to configure the attributes of a [BoxSpec] and pass it to
/// the [BoxSpec] constructor.
final class BoxSpecAttribute extends SpecAttribute<BoxSpec> {
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

  @override
  BoxSpecAttribute merge(BoxSpecAttribute? other) {
    if (other == null) return this;

    return BoxSpecAttribute(
      alignment: other.alignment ?? alignment,
      padding: padding?.merge(other.padding) ?? other.padding,
      margin: margin?.merge(other.margin) ?? other.margin,
      constraints: constraints?.merge(other.constraints) ?? other.constraints,
      decoration: DecorationDto.tryToMerge(decoration, other.decoration),
      foregroundDecoration: DecorationDto.tryToMerge(
          foregroundDecoration, other.foregroundDecoration),
      transform: other.transform ?? transform,
      transformAlignment: other.transformAlignment ?? transformAlignment,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      width: other.width ?? width,
      height: other.height ?? height,
      animated: animated?.merge(other.animated) ?? other.animated,
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

/// Utility class for configuring [BoxSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [BoxSpecAttribute].
///
/// Use the methods of this class to configure specific properties of a [BoxSpecAttribute].
base class BoxSpecUtility<T extends Attribute>
    extends SpecUtility<T, BoxSpecAttribute> {
  /// Utility for defining [BoxSpecAttribute.alignment]
  late final alignment = AlignmentGeometryUtility((v) => only(alignment: v));

  /// Utility for defining [BoxSpecAttribute.padding]
  late final padding = SpacingUtility((v) => only(padding: v));

  /// Utility for defining [BoxSpecAttribute.margin]
  late final margin = SpacingUtility((v) => only(margin: v));

  /// Utility for defining [BoxSpecAttribute.constraints]
  late final constraints = BoxConstraintsUtility((v) => only(constraints: v));

  /// Utility for defining [BoxSpecAttribute.constraints.maxWidth]
  late final maxWidth = constraints.maxWidth;

  /// Utility for defining [BoxSpecAttribute.constraints.minWidth]
  late final minWidth = constraints.minWidth;

  /// Utility for defining [BoxSpecAttribute.constraints.maxHeight]
  late final maxHeight = constraints.maxHeight;

  /// Utility for defining [BoxSpecAttribute.constraints.minHeight]
  late final minHeight = constraints.minHeight;

  /// Utility for defining [BoxSpecAttribute.decoration]
  late final decoration = BoxDecorationUtility((v) => only(decoration: v));

  /// Utility for defining [BoxSpecAttribute.decoration]
  late final shapeDecoration =
      ShapeDecorationUtility((v) => only(decoration: v));

  /// Utility for defining [BoxSpecAttribute.decoration.color]
  late final color = decoration.color;

  /// Utility for defining [BoxSpecAttribute.decoration.border]
  late final border = decoration.border;

  /// Utility for defining [BoxSpecAttribute.decoration.borderDirectional]
  late final borderDirectional = decoration.borderDirectional;

  /// Utility for defining [BoxSpecAttribute.decoration.borderRadius]
  late final borderRadius = decoration.borderRadius;

  /// Utility for defining [BoxSpecAttribute.decoration.borderRadiusDirectional]
  late final borderRadiusDirectional = decoration.borderRadiusDirectional;

  /// Utility for defining [BoxSpecAttribute.decoration.gradient]
  late final gradient = decoration.gradient;

  /// Utility for defining [BoxSpecAttribute.decoration.gradient.radial]
  late final radialGradient = decoration.gradient.radial;

  /// Utility for defining [BoxSpecAttribute.decoration.gradient.linear]
  late final linearGradient = decoration.gradient.linear;

  /// Utility for defining [BoxSpecAttribute.decoration.boxShadows]
  late final shadows = decoration.boxShadows;

  /// Utility for defining [BoxSpecAttribute.decoration.boxShadow]
  late final shadow = decoration.boxShadow;

  /// Utility for defining [BoxSpecAttribute.decoration.elevation]
  late final elevation = decoration.elevation;

  /// Utility for defining [BoxSpecAttribute.foregroundDecoration]
  late final foregroundDecoration =
      BoxDecorationUtility((v) => only(foregroundDecoration: v));

  /// Utility for defining [BoxSpecAttribute.transform]
  late final transform = Matrix4Utility((v) => only(transform: v));

  /// Utility for defining [BoxSpecAttribute.transformAlignment]
  late final transformAlignment =
      AlignmentGeometryUtility((v) => only(transformAlignment: v));

  /// Utility for defining [BoxSpecAttribute.clipBehavior]
  late final clipBehavior = ClipUtility((v) => only(clipBehavior: v));

  /// Utility for defining [BoxSpecAttribute.width]
  late final width = DoubleUtility((v) => only(width: v));

  /// Utility for defining [BoxSpecAttribute.height]
  late final height = DoubleUtility((v) => only(height: v));

  /// Utility for defining [BoxSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  BoxSpecUtility(super.builder);

  static final self = BoxSpecUtility((v) => v);

  /// Returns a new [BoxSpecAttribute] with the specified properties.
  @override
  T only({
    AlignmentGeometry? alignment,
    SpacingDto? padding,
    SpacingDto? margin,
    BoxConstraintsDto? constraints,
    DecorationDto? decoration,
    DecorationDto? foregroundDecoration,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip? clipBehavior,
    double? width,
    double? height,
    AnimatedDataDto? animated,
  }) {
    return builder(BoxSpecAttribute(
      alignment: alignment,
      padding: padding,
      margin: margin,
      constraints: constraints,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      width: width,
      height: height,
      animated: animated,
    ));
  }
}

/// A tween that interpolates between two [BoxSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [BoxSpec] specifications.
class BoxSpecTween extends Tween<BoxSpec?> {
  BoxSpecTween({
    super.begin,
    super.end,
  });

  @override
  BoxSpec lerp(double t) {
    if (begin == null && end == null) return BoxSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}

double? _$lerpDouble(num? a, num? b, double t) {
  if (a == b || (a?.isNaN ?? false) && (b?.isNaN ?? false)) {
    return a?.toDouble();
  }
  a ??= 0.0;
  b ??= 0.0;
  return a * (1.0 - t) + b * t;
}

Matrix4? _$lerpMatrix4(Matrix4? a, Matrix4? b, double t) {
  if (a == null && b == null) return null;
  if (a == null) return b;
  if (b == null) return a;

  return Matrix4Tween(begin: a, end: b).lerp(t);
}
