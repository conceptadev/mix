// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_spec.dart';

// **************************************************************************
// Generator: SpecDefinitionBuilder
// **************************************************************************

base mixin _$ImageSpec on Spec<ImageSpec> {
  static ImageSpec from(MixData mix) {
    return mix.attributeOf<ImageSpecAttribute>()?.resolve(mix) ??
        const ImageSpec();
  }

  static ImageSpec of(BuildContext context) {
    return _$ImageSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [ImageSpec] but with the given fields
  /// replaced with the new values.
  @override
  ImageSpec copyWith({
    double? width,
    double? height,
    Color? color,
    ImageRepeat? repeat,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    Rect? centerSlice,
    FilterQuality? filterQuality,
    BlendMode? colorBlendMode,
    AnimatedData? animated,
  }) {
    return ImageSpec(
      width: width ?? _$this.width,
      height: height ?? _$this.height,
      color: color ?? _$this.color,
      repeat: repeat ?? _$this.repeat,
      fit: fit ?? _$this.fit,
      alignment: alignment ?? _$this.alignment,
      centerSlice: centerSlice ?? _$this.centerSlice,
      filterQuality: filterQuality ?? _$this.filterQuality,
      colorBlendMode: colorBlendMode ?? _$this.colorBlendMode,
      animated: animated ?? _$this.animated,
    );
  }

  @override
  ImageSpec lerp(ImageSpec? other, double t) {
    if (other == null) return _$this;

    return ImageSpec(
      width: _$lerpDouble(_$this.width, other._$this.width, t),
      height: _$lerpDouble(_$this.height, other._$this.height, t),
      color: Color.lerp(_$this.color, other._$this.color, t),
      repeat: t < 0.5 ? _$this.repeat : other._$this.repeat,
      fit: t < 0.5 ? _$this.fit : other._$this.fit,
      alignment:
          AlignmentGeometry.lerp(_$this.alignment, other._$this.alignment, t),
      centerSlice: Rect.lerp(_$this.centerSlice, other._$this.centerSlice, t),
      filterQuality:
          t < 0.5 ? _$this.filterQuality : other._$this.filterQuality,
      colorBlendMode:
          t < 0.5 ? _$this.colorBlendMode : other._$this.colorBlendMode,
      animated: t < 0.5 ? _$this.animated : other._$this.animated,
    );
  }

  /// The list of properties that constitute the state of this [ImageSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ImageSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.width,
        _$this.height,
        _$this.color,
        _$this.repeat,
        _$this.fit,
        _$this.alignment,
        _$this.centerSlice,
        _$this.filterQuality,
        _$this.colorBlendMode,
        _$this.animated,
      ];

  ImageSpec get _$this => this as ImageSpec;
}

/// Represents the attributes of a [ImageSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [ImageSpec].
///
/// Use this class to configure the attributes of a [ImageSpec] and pass it to
/// the [ImageSpec] constructor.
final class ImageSpecAttribute extends SpecAttribute<ImageSpec> {
  final double? width;
  final double? height;
  final ColorDto? color;
  final ImageRepeat? repeat;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final Rect? centerSlice;
  final FilterQuality? filterQuality;
  final BlendMode? colorBlendMode;

  const ImageSpecAttribute({
    this.width,
    this.height,
    this.color,
    this.repeat,
    this.fit,
    this.alignment,
    this.centerSlice,
    this.filterQuality,
    this.colorBlendMode,
    super.animated,
  });

  @override
  ImageSpec resolve(MixData mix) {
    return ImageSpec(
      width: width,
      height: height,
      color: color?.resolve(mix),
      repeat: repeat,
      fit: fit,
      alignment: alignment,
      centerSlice: centerSlice,
      filterQuality: filterQuality,
      colorBlendMode: colorBlendMode,
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  @override
  ImageSpecAttribute merge(ImageSpecAttribute? other) {
    if (other == null) return this;

    return ImageSpecAttribute(
      width: other.width ?? width,
      height: other.height ?? height,
      color: color?.merge(other.color) ?? other.color,
      repeat: other.repeat ?? repeat,
      fit: other.fit ?? fit,
      alignment: other.alignment ?? alignment,
      centerSlice: other.centerSlice ?? centerSlice,
      filterQuality: other.filterQuality ?? filterQuality,
      colorBlendMode: other.colorBlendMode ?? colorBlendMode,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [ImageSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ImageSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        width,
        height,
        color,
        repeat,
        fit,
        alignment,
        centerSlice,
        filterQuality,
        colorBlendMode,
        animated,
      ];
}

/// Utility class for configuring [ImageSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [ImageSpecAttribute].
///
/// Use the methods of this class to configure specific properties of a [ImageSpecAttribute].
base class ImageSpecUtility<T extends Attribute>
    extends SpecUtility<T, ImageSpecAttribute> {
  /// Utility for defining [ImageSpecAttribute.width]
  late final width = DoubleUtility((v) => only(width: v));

  /// Utility for defining [ImageSpecAttribute.height]
  late final height = DoubleUtility((v) => only(height: v));

  /// Utility for defining [ImageSpecAttribute.color]
  late final color = ColorUtility((v) => only(color: v));

  /// Utility for defining [ImageSpecAttribute.repeat]
  late final repeat = ImageRepeatUtility((v) => only(repeat: v));

  /// Utility for defining [ImageSpecAttribute.fit]
  late final fit = BoxFitUtility((v) => only(fit: v));

  /// Utility for defining [ImageSpecAttribute.alignment]
  late final alignment = AlignmentGeometryUtility((v) => only(alignment: v));

  /// Utility for defining [ImageSpecAttribute.centerSlice]
  late final centerSlice = RectUtility((v) => only(centerSlice: v));

  /// Utility for defining [ImageSpecAttribute.filterQuality]
  late final filterQuality =
      FilterQualityUtility((v) => only(filterQuality: v));

  /// Utility for defining [ImageSpecAttribute.colorBlendMode]
  late final colorBlendMode = BlendModeUtility((v) => only(colorBlendMode: v));

  /// Utility for defining [ImageSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  ImageSpecUtility(super.builder);

  static final self = ImageSpecUtility((v) => v);

  /// Returns a new [ImageSpecAttribute] with the specified properties.
  @override
  T only({
    double? width,
    double? height,
    ColorDto? color,
    ImageRepeat? repeat,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    Rect? centerSlice,
    FilterQuality? filterQuality,
    BlendMode? colorBlendMode,
    AnimatedDataDto? animated,
  }) {
    return builder(ImageSpecAttribute(
      width: width,
      height: height,
      color: color,
      repeat: repeat,
      fit: fit,
      alignment: alignment,
      centerSlice: centerSlice,
      filterQuality: filterQuality,
      colorBlendMode: colorBlendMode,
      animated: animated,
    ));
  }
}

/// A tween that interpolates between two [ImageSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [ImageSpec] specifications.
class ImageSpecTween extends Tween<ImageSpec?> {
  ImageSpecTween({
    super.begin,
    super.end,
  });

  @override
  ImageSpec lerp(double t) {
    if (begin == null && end == null) return const ImageSpec();
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
