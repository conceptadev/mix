// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strut_style_dto.dart';

// **************************************************************************
// MixGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

/// A mixin that provides DTO functionality for [StrutStyleMix].
mixin _$StrutStyleMix on Mixable<StrutStyle> {
  /// Resolves to [StrutStyle] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final strutStyle = StrutStyleMix(...).resolve(mix);
  /// ```
  @override
  StrutStyle resolve(MixData mix) {
    return StrutStyle(
      fontFamily: _$this.fontFamily,
      fontFamilyFallback: _$this.fontFamilyFallback,
      fontSize: _$this.fontSize,
      fontWeight: _$this.fontWeight,
      fontStyle: _$this.fontStyle,
      height: _$this.height,
      leading: _$this.leading,
      forceStrutHeight: _$this.forceStrutHeight,
    );
  }

  /// Merges the properties of this [StrutStyleMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [StrutStyleMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  StrutStyleMix merge(StrutStyleMix? other) {
    if (other == null) return _$this;

    return StrutStyleMix(
      fontFamily: other.fontFamily ?? _$this.fontFamily,
      fontFamilyFallback: MixHelpers.mergeList(
          _$this.fontFamilyFallback, other.fontFamilyFallback),
      fontSize: other.fontSize ?? _$this.fontSize,
      fontWeight: other.fontWeight ?? _$this.fontWeight,
      fontStyle: other.fontStyle ?? _$this.fontStyle,
      height: other.height ?? _$this.height,
      leading: other.leading ?? _$this.leading,
      forceStrutHeight: other.forceStrutHeight ?? _$this.forceStrutHeight,
    );
  }

  /// The list of properties that constitute the state of this [StrutStyleMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [StrutStyleMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.fontFamily,
        _$this.fontFamilyFallback,
        _$this.fontSize,
        _$this.fontWeight,
        _$this.fontStyle,
        _$this.height,
        _$this.leading,
        _$this.forceStrutHeight,
      ];

  /// Returns this instance as a [StrutStyleMix].
  StrutStyleMix get _$this => this as StrutStyleMix;
}

/// Utility class for configuring [StrutStyle] properties.
///
/// This class provides methods to set individual properties of a [StrutStyle].
/// Use the methods of this class to configure specific properties of a [StrutStyle].
class StrutStyleMixUtility<T extends Attribute>
    extends DtoUtility<T, StrutStyleMix, StrutStyle> {
  /// Utility for defining [StrutStyleMix.fontFamily]
  late final fontFamily = FontFamilyUtility((v) => only(fontFamily: v));

  /// Utility for defining [StrutStyleMix.fontFamilyFallback]
  late final fontFamilyFallback =
      ListUtility<T, String>((v) => only(fontFamilyFallback: v));

  /// Utility for defining [StrutStyleMix.fontSize]
  late final fontSize = FontSizeUtility((v) => only(fontSize: v));

  /// Utility for defining [StrutStyleMix.fontWeight]
  late final fontWeight = FontWeightUtility((v) => only(fontWeight: v));

  /// Utility for defining [StrutStyleMix.fontStyle]
  late final fontStyle = FontStyleUtility((v) => only(fontStyle: v));

  /// Utility for defining [StrutStyleMix.height]
  late final height = DoubleUtility((v) => only(height: v));

  /// Utility for defining [StrutStyleMix.leading]
  late final leading = DoubleUtility((v) => only(leading: v));

  /// Utility for defining [StrutStyleMix.forceStrutHeight]
  late final forceStrutHeight = BoolUtility((v) => only(forceStrutHeight: v));

  StrutStyleMixUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [StrutStyleMix] with the specified properties.
  @override
  T only({
    String? fontFamily,
    List<String>? fontFamilyFallback,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? height,
    double? leading,
    bool? forceStrutHeight,
  }) {
    return builder(StrutStyleMix(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      height: height,
      leading: leading,
      forceStrutHeight: forceStrutHeight,
    ));
  }

  T call({
    String? fontFamily,
    List<String>? fontFamilyFallback,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? height,
    double? leading,
    bool? forceStrutHeight,
  }) {
    return only(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      height: height,
      leading: leading,
      forceStrutHeight: forceStrutHeight,
    );
  }
}

/// Extension methods to convert [StrutStyle] to [StrutStyleMix].
extension StrutStyleMixExt on StrutStyle {
  /// Converts this [StrutStyle] to a [StrutStyleMix].
  StrutStyleMix toDto() {
    return StrutStyleMix(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      height: height,
      leading: leading,
      forceStrutHeight: forceStrutHeight,
    );
  }
}

/// Extension methods to convert List<[StrutStyle]> to List<[StrutStyleMix]>.
extension ListStrutStyleMixExt on List<StrutStyle> {
  /// Converts this List<[StrutStyle]> to a List<[StrutStyleMix]>.
  List<StrutStyleMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
