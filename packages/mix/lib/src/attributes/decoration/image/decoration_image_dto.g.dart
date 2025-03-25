// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decoration_image_dto.dart';

// **************************************************************************
// MixGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

/// A mixin that provides DTO functionality for [DecorationImageMix].
mixin _$DecorationImageMix
    on Mixable<DecorationImage>, HasDefaultValue<DecorationImage> {
  /// Resolves to [DecorationImage] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final decorationImage = DecorationImageMix(...).resolve(mix);
  /// ```
  @override
  DecorationImage resolve(MixData mix) {
    return DecorationImage(
      image: _$this.image ?? defaultValue.image,
      fit: _$this.fit ?? defaultValue.fit,
      alignment: _$this.alignment ?? defaultValue.alignment,
      centerSlice: _$this.centerSlice ?? defaultValue.centerSlice,
      repeat: _$this.repeat ?? defaultValue.repeat,
      filterQuality: _$this.filterQuality ?? defaultValue.filterQuality,
      invertColors: _$this.invertColors ?? defaultValue.invertColors,
      isAntiAlias: _$this.isAntiAlias ?? defaultValue.isAntiAlias,
    );
  }

  /// Merges the properties of this [DecorationImageMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [DecorationImageMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  DecorationImageMix merge(DecorationImageMix? other) {
    if (other == null) return _$this;

    return DecorationImageMix(
      image: other.image ?? _$this.image,
      fit: other.fit ?? _$this.fit,
      alignment: other.alignment ?? _$this.alignment,
      centerSlice: other.centerSlice ?? _$this.centerSlice,
      repeat: other.repeat ?? _$this.repeat,
      filterQuality: other.filterQuality ?? _$this.filterQuality,
      invertColors: other.invertColors ?? _$this.invertColors,
      isAntiAlias: other.isAntiAlias ?? _$this.isAntiAlias,
    );
  }

  /// The list of properties that constitute the state of this [DecorationImageMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [DecorationImageMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.image,
        _$this.fit,
        _$this.alignment,
        _$this.centerSlice,
        _$this.repeat,
        _$this.filterQuality,
        _$this.invertColors,
        _$this.isAntiAlias,
      ];

  /// Returns this instance as a [DecorationImageMix].
  DecorationImageMix get _$this => this as DecorationImageMix;
}

/// Utility class for configuring [DecorationImage] properties.
///
/// This class provides methods to set individual properties of a [DecorationImage].
/// Use the methods of this class to configure specific properties of a [DecorationImage].
class DecorationImageMixUtility<T extends Attribute>
    extends DtoUtility<T, DecorationImageMix, DecorationImage> {
  /// Utility for defining [DecorationImageMix.image]
  late final provider = ImageProviderUtility((v) => only(image: v));

  /// Utility for defining [DecorationImageMix.fit]
  late final fit = BoxFitUtility((v) => only(fit: v));

  /// Utility for defining [DecorationImageMix.alignment]
  late final alignment = AlignmentGeometryUtility((v) => only(alignment: v));

  /// Utility for defining [DecorationImageMix.centerSlice]
  late final centerSlice = RectUtility((v) => only(centerSlice: v));

  /// Utility for defining [DecorationImageMix.repeat]
  late final repeat = ImageRepeatUtility((v) => only(repeat: v));

  /// Utility for defining [DecorationImageMix.filterQuality]
  late final filterQuality =
      FilterQualityUtility((v) => only(filterQuality: v));

  /// Utility for defining [DecorationImageMix.invertColors]
  late final invertColors = BoolUtility((v) => only(invertColors: v));

  /// Utility for defining [DecorationImageMix.isAntiAlias]
  late final isAntiAlias = BoolUtility((v) => only(isAntiAlias: v));

  DecorationImageMixUtility(super.builder)
      : super(valueToDto: (v) => v.toDto());

  /// Returns a new [DecorationImageMix] with the specified properties.
  @override
  T only({
    ImageProvider<Object>? image,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    Rect? centerSlice,
    ImageRepeat? repeat,
    FilterQuality? filterQuality,
    bool? invertColors,
    bool? isAntiAlias,
  }) {
    return builder(DecorationImageMix(
      image: image,
      fit: fit,
      alignment: alignment,
      centerSlice: centerSlice,
      repeat: repeat,
      filterQuality: filterQuality,
      invertColors: invertColors,
      isAntiAlias: isAntiAlias,
    ));
  }

  T call({
    ImageProvider<Object>? image,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    Rect? centerSlice,
    ImageRepeat? repeat,
    FilterQuality? filterQuality,
    bool? invertColors,
    bool? isAntiAlias,
  }) {
    return only(
      image: image,
      fit: fit,
      alignment: alignment,
      centerSlice: centerSlice,
      repeat: repeat,
      filterQuality: filterQuality,
      invertColors: invertColors,
      isAntiAlias: isAntiAlias,
    );
  }
}

/// Extension methods to convert [DecorationImage] to [DecorationImageMix].
extension DecorationImageMixExt on DecorationImage {
  /// Converts this [DecorationImage] to a [DecorationImageMix].
  DecorationImageMix toDto() {
    return DecorationImageMix(
      image: image,
      fit: fit,
      alignment: alignment,
      centerSlice: centerSlice,
      repeat: repeat,
      filterQuality: filterQuality,
      invertColors: invertColors,
      isAntiAlias: isAntiAlias,
    );
  }
}

/// Extension methods to convert List<[DecorationImage]> to List<[DecorationImageMix]>.
extension ListDecorationImageMixExt on List<DecorationImage> {
  /// Converts this List<[DecorationImage]> to a List<[DecorationImageMix]>.
  List<DecorationImageMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
