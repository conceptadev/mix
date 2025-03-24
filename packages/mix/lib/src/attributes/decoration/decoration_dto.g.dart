// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decoration_dto.dart';

// **************************************************************************
// MixGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

/// A mixin that provides DTO functionality for [BoxDecorationMix].
mixin _$BoxDecorationMix on Mixable<BoxDecoration> {
  /// Resolves to [BoxDecoration] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final boxDecoration = BoxDecorationMix(...).resolve(mix);
  /// ```
  @override
  BoxDecoration resolve(MixData mix) {
    return BoxDecoration(
      border: _$this.border?.resolve(mix),
      borderRadius: _$this.borderRadius?.resolve(mix),
      shape: _$this.shape ?? BoxShape.rectangle,
      backgroundBlendMode: _$this.backgroundBlendMode,
      color: _$this.color?.resolve(mix),
      image: _$this.image?.resolve(mix),
      gradient: _$this.gradient?.resolve(mix),
      boxShadow: _$this.boxShadow?.map((e) => e.resolve(mix)).toList(),
    );
  }

  /// Merges the properties of this [BoxDecorationMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [BoxDecorationMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  BoxDecorationMix merge(BoxDecorationMix? other) {
    if (other == null) return _$this;

    return BoxDecorationMix(
      border: _$this.border?.merge(other.border) ?? other.border,
      borderRadius:
          _$this.borderRadius?.merge(other.borderRadius) ?? other.borderRadius,
      shape: other.shape ?? _$this.shape,
      backgroundBlendMode:
          other.backgroundBlendMode ?? _$this.backgroundBlendMode,
      color: _$this.color?.merge(other.color) ?? other.color,
      image: _$this.image?.merge(other.image) ?? other.image,
      gradient: GradientDto.tryToMerge(_$this.gradient, other.gradient),
      boxShadow: MixHelpers.mergeList(_$this.boxShadow, other.boxShadow),
    );
  }

  /// The list of properties that constitute the state of this [BoxDecorationMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BoxDecorationMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.border,
        _$this.borderRadius,
        _$this.shape,
        _$this.backgroundBlendMode,
        _$this.color,
        _$this.image,
        _$this.gradient,
        _$this.boxShadow,
      ];

  /// Returns this instance as a [BoxDecorationMix].
  BoxDecorationMix get _$this => this as BoxDecorationMix;
}

/// Utility class for configuring [BoxDecoration] properties.
///
/// This class provides methods to set individual properties of a [BoxDecoration].
/// Use the methods of this class to configure specific properties of a [BoxDecoration].
class BoxDecorationMixUtility<T extends Attribute>
    extends DtoUtility<T, BoxDecorationMix, BoxDecoration> {
  /// Utility for defining [BoxDecorationMix.border]
  late final border = BoxBorderMixUtility((v) => only(border: v));

  /// Utility for defining [BoxDecorationMix.border.directional]
  late final borderDirectional = border.directional;

  /// Utility for defining [BoxDecorationMix.borderRadius]
  late final borderRadius =
      BorderRadiusGeometryMixUtility((v) => only(borderRadius: v));

  /// Utility for defining [BoxDecorationMix.borderRadius.directional]
  late final borderRadiusDirectional = borderRadius.directional;

  /// Utility for defining [BoxDecorationMix.shape]
  late final shape = BoxShapeUtility((v) => only(shape: v));

  /// Utility for defining [BoxDecorationMix.backgroundBlendMode]
  late final backgroundBlendMode =
      BlendModeUtility((v) => only(backgroundBlendMode: v));

  /// Utility for defining [BoxDecorationMix.color]
  late final color = ColorUtility((v) => only(color: v));

  /// Utility for defining [BoxDecorationMix.image]
  late final image = DecorationImageMixUtility((v) => only(image: v));

  /// Utility for defining [BoxDecorationMix.gradient]
  late final gradient = GradientUtility((v) => only(gradient: v));

  /// Utility for defining [BoxDecorationMix.boxShadow]
  late final boxShadows = BoxShadowListUtility((v) => only(boxShadow: v));

  /// Utility for defining [BoxDecorationMix.boxShadows.add]
  late final boxShadow = boxShadows.add;

  /// Utility for defining [BoxDecorationMix.boxShadow]
  late final elevation = ElevationUtility((v) => only(boxShadow: v));

  BoxDecorationMixUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [BoxDecorationMix] with the specified properties.
  @override
  T only({
    BoxBorderMix? border,
    BorderRadiusGeometryMix? borderRadius,
    BoxShape? shape,
    BlendMode? backgroundBlendMode,
    ColorDto? color,
    DecorationImageMix? image,
    GradientDto? gradient,
    List<BoxShadowMix>? boxShadow,
  }) {
    return builder(BoxDecorationMix(
      border: border,
      borderRadius: borderRadius,
      shape: shape,
      backgroundBlendMode: backgroundBlendMode,
      color: color,
      image: image,
      gradient: gradient,
      boxShadow: boxShadow,
    ));
  }

  T call({
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    BoxShape? shape,
    BlendMode? backgroundBlendMode,
    Color? color,
    DecorationImage? image,
    Gradient? gradient,
    List<BoxShadow>? boxShadow,
  }) {
    return only(
      border: border?.toDto(),
      borderRadius: borderRadius?.toDto(),
      shape: shape,
      backgroundBlendMode: backgroundBlendMode,
      color: color?.toDto(),
      image: image?.toDto(),
      gradient: gradient?.toDto(),
      boxShadow: boxShadow?.map((e) => e.toDto()).toList(),
    );
  }
}

/// Extension methods to convert [BoxDecoration] to [BoxDecorationMix].
extension BoxDecorationMixExt on BoxDecoration {
  /// Converts this [BoxDecoration] to a [BoxDecorationMix].
  BoxDecorationMix toDto() {
    return BoxDecorationMix(
      border: border?.toDto(),
      borderRadius: borderRadius?.toDto(),
      shape: shape,
      backgroundBlendMode: backgroundBlendMode,
      color: color?.toDto(),
      image: image?.toDto(),
      gradient: gradient?.toDto(),
      boxShadow: boxShadow?.map((e) => e.toDto()).toList(),
    );
  }
}

/// Extension methods to convert List<[BoxDecoration]> to List<[BoxDecorationMix]>.
extension ListBoxDecorationMixExt on List<BoxDecoration> {
  /// Converts this List<[BoxDecoration]> to a List<[BoxDecorationMix]>.
  List<BoxDecorationMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

/// A mixin that provides DTO functionality for [ShapeDecorationMix].
mixin _$ShapeDecorationMix
    on Mixable<ShapeDecoration>, HasDefaultValue<ShapeDecoration> {
  /// Resolves to [ShapeDecoration] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final shapeDecoration = ShapeDecorationMix(...).resolve(mix);
  /// ```
  @override
  ShapeDecoration resolve(MixData mix) {
    return ShapeDecoration(
      shape: _$this.shape?.resolve(mix) ?? defaultValue.shape,
      color: _$this.color?.resolve(mix) ?? defaultValue.color,
      image: _$this.image?.resolve(mix) ?? defaultValue.image,
      gradient: _$this.gradient?.resolve(mix) ?? defaultValue.gradient,
      shadows: _$this.shadows?.map((e) => e.resolve(mix)).toList() ??
          defaultValue.shadows,
    );
  }

  /// Merges the properties of this [ShapeDecorationMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [ShapeDecorationMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  ShapeDecorationMix merge(ShapeDecorationMix? other) {
    if (other == null) return _$this;

    return ShapeDecorationMix(
      shape: ShapeBorderMix.tryToMerge(_$this.shape, other.shape),
      color: _$this.color?.merge(other.color) ?? other.color,
      image: _$this.image?.merge(other.image) ?? other.image,
      gradient: GradientDto.tryToMerge(_$this.gradient, other.gradient),
      shadows: MixHelpers.mergeList(_$this.shadows, other.shadows),
    );
  }

  /// The list of properties that constitute the state of this [ShapeDecorationMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ShapeDecorationMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.shape,
        _$this.color,
        _$this.image,
        _$this.gradient,
        _$this.shadows,
      ];

  /// Returns this instance as a [ShapeDecorationMix].
  ShapeDecorationMix get _$this => this as ShapeDecorationMix;
}

/// Utility class for configuring [ShapeDecoration] properties.
///
/// This class provides methods to set individual properties of a [ShapeDecoration].
/// Use the methods of this class to configure specific properties of a [ShapeDecoration].
class ShapeDecorationUtility<T extends Attribute>
    extends DtoUtility<T, ShapeDecorationMix, ShapeDecoration> {
  /// Utility for defining [ShapeDecorationMix.shape]
  late final shape = ShapeBorderMixUtility((v) => only(shape: v));

  /// Utility for defining [ShapeDecorationMix.color]
  late final color = ColorUtility((v) => only(color: v));

  /// Utility for defining [ShapeDecorationMix.image]
  late final image = DecorationImageMixUtility((v) => only(image: v));

  /// Utility for defining [ShapeDecorationMix.gradient]
  late final gradient = GradientUtility((v) => only(gradient: v));

  /// Utility for defining [ShapeDecorationMix.shadows]
  late final shadows = BoxShadowListUtility((v) => only(shadows: v));

  ShapeDecorationUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [ShapeDecorationMix] with the specified properties.
  @override
  T only({
    ShapeBorderMix? shape,
    ColorDto? color,
    DecorationImageMix? image,
    GradientDto? gradient,
    List<BoxShadowMix>? shadows,
  }) {
    return builder(ShapeDecorationMix(
      shape: shape,
      color: color,
      image: image,
      gradient: gradient,
      shadows: shadows,
    ));
  }

  T call({
    ShapeBorder? shape,
    Color? color,
    DecorationImage? image,
    Gradient? gradient,
    List<BoxShadow>? shadows,
  }) {
    return only(
      shape: shape?.toDto(),
      color: color?.toDto(),
      image: image?.toDto(),
      gradient: gradient?.toDto(),
      shadows: shadows?.map((e) => e.toDto()).toList(),
    );
  }
}

/// Extension methods to convert [ShapeDecoration] to [ShapeDecorationMix].
extension ShapeDecorationMixExt on ShapeDecoration {
  /// Converts this [ShapeDecoration] to a [ShapeDecorationMix].
  ShapeDecorationMix toDto() {
    return ShapeDecorationMix(
      shape: shape.toDto(),
      color: color?.toDto(),
      image: image?.toDto(),
      gradient: gradient?.toDto(),
      shadows: shadows?.map((e) => e.toDto()).toList(),
    );
  }
}

/// Extension methods to convert List<[ShapeDecoration]> to List<[ShapeDecorationMix]>.
extension ListShapeDecorationMixExt on List<ShapeDecoration> {
  /// Converts this List<[ShapeDecoration]> to a List<[ShapeDecorationMix]>.
  List<ShapeDecorationMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
