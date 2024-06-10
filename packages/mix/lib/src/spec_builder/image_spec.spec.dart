// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_spec.dart';

// **************************************************************************
// Generator: SpecDefinitionBuilder
// **************************************************************************

/// Utility class for configuring [ImageDefAttribute] properties.
///
/// This class provides methods to set individual properties of a [ImageDefAttribute].
///
/// Use the methods of this class to configure specific properties of a [ImageDefAttribute].
class ImageDefUtility<T extends Attribute>
    extends SpecUtility<T, ImageDefAttribute> {
  ImageDefUtility(super.builder);

  /// Utility for defining [ImageDefAttribute.width]
  late final width = DoubleUtility((v) => only(width: v));

  /// Utility for defining [ImageDefAttribute.height]
  late final height = DoubleUtility((v) => only(height: v));

  /// Utility for defining [ImageDefAttribute.color]
  late final color = ColorUtility((v) => only(color: v));

  /// Utility for defining [ImageDefAttribute.repeat]
  late final repeat = ImageRepeatUtility((v) => only(repeat: v));

  /// Utility for defining [ImageDefAttribute.fit]
  late final fit = BoxFitUtility((v) => only(fit: v));

  /// Utility for defining [ImageDefAttribute.alignment]
  late final alignment = AlignmentUtility((v) => only(alignment: v));

  /// Utility for defining [ImageDefAttribute.centerSlice]
  late final centerSlice = RectUtility((v) => only(centerSlice: v));

  /// Utility for defining [ImageDefAttribute.filterQuality]
  late final filterQuality =
      FilterQualityUtility((v) => only(filterQuality: v));

  /// Utility for defining [ImageDefAttribute.colorBlendMode]
  late final colorBlendMode = BlendModeUtility((v) => only(colorBlendMode: v));

  /// Utility for defining [ImageDefAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  /// Returns a new [ImageDefAttribute] with the specified properties.
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
    return builder(
      ImageDefAttribute(
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
      ),
    );
  }
}

mixin ImageDefMixable on Spec<ImageDef> {
  /// Retrieves the [ImageDef] from a MixData.
  static ImageDef from(MixData mix) {
    return mix.attributeOf<ImageDefAttribute>()?.resolve(mix) ??
        const ImageDef();
  }

  /// Retrieves the [ImageDef] from the nearest [Mix] ancestor.
  ///
  /// If no ancestor is found, returns [ImageDef].
  static ImageDef of(BuildContext context) {
    return ImageDefMixable.from(Mix.of(context));
  }

  /// Creates a copy of this [ImageDef] but with the given fields
  /// replaced with the new values.
  @override
  ImageDef copyWith({
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
    return ImageDef(
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
  ImageDef lerp(
    ImageDef? other,
    double t,
  ) {
    if (other == null) return _$this;

    return ImageDef(
      width: _lerpDouble(
        _$this.width,
        other._$this.width,
        t,
      ),
      height: _lerpDouble(
        _$this.height,
        other._$this.height,
        t,
      ),
      color: t < 0.5 ? _$this.color : other._$this.color,
      repeat: t < 0.5 ? _$this.repeat : other._$this.repeat,
      fit: t < 0.5 ? _$this.fit : other._$this.fit,
      alignment: AlignmentGeometry.lerp(
        _$this.alignment,
        other._$this.alignment,
        t,
      ),
      centerSlice: t < 0.5 ? _$this.centerSlice : other._$this.centerSlice,
      filterQuality:
          t < 0.5 ? _$this.filterQuality : other._$this.filterQuality,
      colorBlendMode:
          t < 0.5 ? _$this.colorBlendMode : other._$this.colorBlendMode,
      animated: t < 0.5 ? _$this.animated : other._$this.animated,
    );
  }

  /// The list of properties that constitute the state of this [ImageDef].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ImageDef] instances for equality.
  @override
  List<Object?> get props {
    return [
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
  }

  ImageDef get _$this => this as ImageDef;
  double? _lerpDouble(
    num? a,
    num? b,
    double t,
  ) {
    return ((1 - t) * (a ?? 0) + t * (b ?? 0));
  }
}

/// Represents the attributes of a [ImageDef].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [ImageDef].
///
/// Use this class to configure the attributes of a [ImageDef] and pass it to
/// the [ImageDef] constructor.
class ImageDefAttribute extends SpecAttribute<ImageDef> {
  const ImageDefAttribute({
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

  final double? width;

  final double? height;

  final ColorDto? color;

  final ImageRepeat? repeat;

  final BoxFit? fit;

  final AlignmentGeometry? alignment;

  final Rect? centerSlice;

  final FilterQuality? filterQuality;

  final BlendMode? colorBlendMode;

  @override
  ImageDef resolve(MixData mix) {
    return ImageDef(
      width: width,
      height: height,
      color: color?.resolve(mix),
      repeat: repeat,
      fit: fit,
      alignment: alignment,
      centerSlice: centerSlice,
      filterQuality: filterQuality,
      colorBlendMode: colorBlendMode,
      animated: animated?.resolve(mix),
    );
  }

  @override
  ImageDefAttribute merge(ImageDefAttribute? other) {
    if (other == null) return this;

    return ImageDefAttribute(
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

  /// The list of properties that constitute the state of this [ImageDefAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ImageDefAttribute] instances for equality.
  @override
  List<Object?> get props {
    return [
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
}

/// A tween that interpolates between two [ImageDef] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [ImageDef] specifications.
class ImageDefTween extends Tween<ImageDef?> {
  ImageDefTween({
    super.begin,
    super.end,
  });

  @override
  ImageDef lerp(double t) {
    if (begin == null && end == null) return const ImageDef();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
