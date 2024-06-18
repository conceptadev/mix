// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decoration_dto.dart';

// **************************************************************************
// Generator: DtoDefinitionBuilder
// **************************************************************************

base mixin _$BoxDecorationDto on Dto<BoxDecoration> {
  @override
  BoxDecoration resolve(MixData mix) {
    return BoxDecoration(
      color: _$this.color?.resolve(mix) ?? defaultValue.color,
      border: _$this.border?.resolve(mix) ?? defaultValue.border,
      borderRadius:
          _$this.borderRadius?.resolve(mix) ?? defaultValue.borderRadius,
      gradient: _$this.gradient?.resolve(mix) ?? defaultValue.gradient,
      boxShadow: _$this.boxShadow?.map((e) => e.resolve(mix)).toList() ??
          defaultValue.boxShadow,
      shape: _$this.shape ?? defaultValue.shape,
      backgroundBlendMode:
          _$this.backgroundBlendMode ?? defaultValue.backgroundBlendMode,
      image: _$this.image?.resolve(mix) ?? defaultValue.image,
    );
  }

  @override
  BoxDecorationDto merge(BoxDecorationDto? other) {
    if (other == null) return _$this;

    return BoxDecorationDto(
      color: _$this.color?.merge(other.color) ?? other.color,
      border: _$this.border?.merge(other.border) ?? other.border,
      borderRadius:
          _$this.borderRadius?.merge(other.borderRadius) ?? other.borderRadius,
      gradient: GradientDto.tryToMerge(_$this.gradient, other.gradient),
      boxShadow: MixHelpers.mergeList(_$this.boxShadow, other.boxShadow),
      shape: other.shape ?? _$this.shape,
      backgroundBlendMode:
          other.backgroundBlendMode ?? _$this.backgroundBlendMode,
      image: _$this.image?.merge(other.image) ?? other.image,
    );
  }

  /// The list of properties that constitute the state of this [BoxDecorationDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BoxDecorationDto] instances for equality.
  @override
  List<Object?> get props => [
        _$this.color,
        _$this.border,
        _$this.borderRadius,
        _$this.gradient,
        _$this.boxShadow,
        _$this.shape,
        _$this.backgroundBlendMode,
        _$this.image,
      ];

  BoxDecorationDto get _$this => this as BoxDecorationDto;
}

/// Utility class for configuring [BoxDecorationDto] properties.
///
/// This class provides methods to set individual properties of a [BoxDecorationDto].
///
/// Use the methods of this class to configure specific properties of a [BoxDecorationDto].
final class BoxDecorationUtility<T extends Attribute>
    extends DtoUtility<T, BoxDecorationDto, BoxDecoration> {
  /// Utility for defining [BoxDecorationDto.color]
  late final color = ColorUtility((v) => only(color: v));

  /// Utility for defining [BoxDecorationDto.border]
  late final border = BoxBorderUtility((v) => only(border: v));

  /// Utility for defining [BoxDecorationDto.border.directional]
  late final borderDirectional = border.directional;

  /// Utility for defining [BoxDecorationDto.borderRadius]
  late final borderRadius =
      BorderRadiusGeometryUtility((v) => only(borderRadius: v));

  /// Utility for defining [BoxDecorationDto.borderRadius.directional]
  late final borderRadiusDirectional = borderRadius.directional;

  /// Utility for defining [BoxDecorationDto.gradient]
  late final gradient = GradientUtility((v) => only(gradient: v));

  /// Utility for defining [BoxDecorationDto.boxShadow]
  late final boxShadows = BoxShadowListUtility((v) => only(boxShadow: v));

  /// Utility for defining [BoxDecorationDto.boxShadows.add]
  late final boxShadow = boxShadows.add;

  /// Utility for defining [BoxDecorationDto.boxShadow]
  late final elevation = ElevationUtility((v) => only(boxShadow: v));

  /// Utility for defining [BoxDecorationDto.shape]
  late final shape = BoxShapeUtility((v) => only(shape: v));

  /// Utility for defining [BoxDecorationDto.backgroundBlendMode]
  late final backgroundBlendMode =
      BlendModeUtility((v) => only(backgroundBlendMode: v));

  /// Utility for defining [BoxDecorationDto.image]
  late final image = DecorationImageUtility((v) => only(image: v));

  BoxDecorationUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [BoxDecorationDto] with the specified properties.
  @override
  T only({
    ColorDto? color,
    BoxBorderDto? border,
    BorderRadiusGeometryDto? borderRadius,
    GradientDto? gradient,
    List<BoxShadowDto>? boxShadow,
    BoxShape? shape,
    BlendMode? backgroundBlendMode,
    DecorationImageDto? image,
  }) {
    return builder(BoxDecorationDto(
      color: color,
      border: border,
      borderRadius: borderRadius,
      gradient: gradient,
      boxShadow: boxShadow,
      shape: shape,
      backgroundBlendMode: backgroundBlendMode,
      image: image,
    ));
  }

  T call({
    Color? color,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    Gradient? gradient,
    List<BoxShadow>? boxShadow,
    BoxShape? shape,
    BlendMode? backgroundBlendMode,
    DecorationImage? image,
  }) {
    return only(
      color: color?.toDto(),
      border: border?.toDto(),
      borderRadius: borderRadius?.toDto(),
      gradient: gradient?.toDto(),
      boxShadow: boxShadow?.map((e) => e.toDto()).toList(),
      shape: shape,
      backgroundBlendMode: backgroundBlendMode,
      image: image?.toDto(),
    );
  }
}

extension BoxDecorationMixExt on BoxDecoration {
  BoxDecorationDto toDto() {
    return BoxDecorationDto(
      color: color?.toDto(),
      border: border?.toDto(),
      borderRadius: borderRadius?.toDto(),
      gradient: gradient?.toDto(),
      boxShadow: boxShadow?.map((e) => e.toDto()).toList(),
      shape: shape,
      backgroundBlendMode: backgroundBlendMode,
      image: image?.toDto(),
    );
  }
}

base mixin _$ShapeDecorationDto on Dto<ShapeDecoration> {
  @override
  ShapeDecoration resolve(MixData mix) {
    return ShapeDecoration(
      color: _$this.color?.resolve(mix) ?? defaultValue.color,
      shape: _$this.shape?.resolve(mix) ?? defaultValue.shape,
      gradient: _$this.gradient?.resolve(mix) ?? defaultValue.gradient,
      shadows: _$this.shadows?.map((e) => e.resolve(mix)).toList() ??
          defaultValue.shadows,
    );
  }

  @override
  ShapeDecorationDto merge(ShapeDecorationDto? other) {
    if (other == null) return _$this;

    return ShapeDecorationDto(
      color: _$this.color?.merge(other.color) ?? other.color,
      shape: ShapeBorderDto.tryToMerge(_$this.shape, other.shape),
      gradient: GradientDto.tryToMerge(_$this.gradient, other.gradient),
      shadows: MixHelpers.mergeList(_$this.shadows, other.shadows),
    );
  }

  /// The list of properties that constitute the state of this [ShapeDecorationDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ShapeDecorationDto] instances for equality.
  @override
  List<Object?> get props => [
        _$this.color,
        _$this.shape,
        _$this.gradient,
        _$this.shadows,
      ];

  ShapeDecorationDto get _$this => this as ShapeDecorationDto;
}

/// Utility class for configuring [ShapeDecorationDto] properties.
///
/// This class provides methods to set individual properties of a [ShapeDecorationDto].
///
/// Use the methods of this class to configure specific properties of a [ShapeDecorationDto].
final class ShapeDecorationUtility<T extends Attribute>
    extends DtoUtility<T, ShapeDecorationDto, ShapeDecoration> {
  /// Utility for defining [ShapeDecorationDto.color]
  late final color = ColorUtility((v) => only(color: v));

  /// Utility for defining [ShapeDecorationDto.shape]
  late final shape = ShapeBorderUtility((v) => only(shape: v));

  /// Utility for defining [ShapeDecorationDto.gradient]
  late final gradient = GradientUtility((v) => only(gradient: v));

  /// Utility for defining [ShapeDecorationDto.shadows]
  late final shadows = BoxShadowListUtility((v) => only(shadows: v));

  ShapeDecorationUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [ShapeDecorationDto] with the specified properties.
  @override
  T only({
    ColorDto? color,
    ShapeBorderDto? shape,
    GradientDto? gradient,
    List<BoxShadowDto>? shadows,
  }) {
    return builder(ShapeDecorationDto(
      color: color,
      shape: shape,
      gradient: gradient,
      shadows: shadows,
    ));
  }

  T call({
    Color? color,
    ShapeBorder? shape,
    Gradient? gradient,
    List<BoxShadow>? shadows,
  }) {
    return only(
      color: color?.toDto(),
      shape: shape?.toDto(),
      gradient: gradient?.toDto(),
      shadows: shadows?.map((e) => e.toDto()).toList(),
    );
  }
}

extension ShapeDecorationMixExt on ShapeDecoration {
  ShapeDecorationDto toDto() {
    return ShapeDecorationDto(
      color: color?.toDto(),
      shape: shape.toDto(),
      gradient: gradient?.toDto(),
      shadows: shadows?.map((e) => e.toDto()).toList(),
    );
  }
}
