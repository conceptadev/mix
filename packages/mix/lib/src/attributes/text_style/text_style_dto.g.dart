// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_style_dto.dart';

// **************************************************************************
// MixableDtoGenerator
// **************************************************************************

base mixin _$TextStyleData on Dto<TextStyle> {
  /// Resolves to [TextStyle] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final textStyle = TextStyleData(...).resolve(mix);
  /// ```
  @override
  TextStyle resolve(MixData mix) {
    return TextStyle(
      background: _$this.background ?? defaultValue.background,
      backgroundColor:
          _$this.backgroundColor?.resolve(mix) ?? defaultValue.backgroundColor,
      color: _$this.color?.resolve(mix) ?? defaultValue.color,
      debugLabel: _$this.debugLabel ?? defaultValue.debugLabel,
      decoration: _$this.decoration ?? defaultValue.decoration,
      decorationColor:
          _$this.decorationColor?.resolve(mix) ?? defaultValue.decorationColor,
      decorationStyle: _$this.decorationStyle ?? defaultValue.decorationStyle,
      decorationThickness:
          _$this.decorationThickness ?? defaultValue.decorationThickness,
      fontFamily: _$this.fontFamily ?? defaultValue.fontFamily,
      fontFamilyFallback:
          _$this.fontFamilyFallback ?? defaultValue.fontFamilyFallback,
      fontFeatures: _$this.fontFeatures ?? defaultValue.fontFeatures,
      fontSize: _$this.fontSize ?? defaultValue.fontSize,
      fontStyle: _$this.fontStyle ?? defaultValue.fontStyle,
      fontWeight: _$this.fontWeight ?? defaultValue.fontWeight,
      foreground: _$this.foreground ?? defaultValue.foreground,
      height: _$this.height ?? defaultValue.height,
      letterSpacing: _$this.letterSpacing ?? defaultValue.letterSpacing,
      locale: _$this.locale ?? defaultValue.locale,
      shadows: _$this.shadows?.map((e) => e.resolve(mix)).toList() ??
          defaultValue.shadows,
      textBaseline: _$this.textBaseline ?? defaultValue.textBaseline,
      wordSpacing: _$this.wordSpacing ?? defaultValue.wordSpacing,
    );
  }

  /// Merges the properties of this [TextStyleData] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [TextStyleData] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  TextStyleData merge(covariant TextStyleData? other) {
    if (other == null) return _$this;

    return TextStyleData(
      background: other.background ?? _$this.background,
      backgroundColor: _$this.backgroundColor?.merge(other.backgroundColor) ??
          other.backgroundColor,
      color: _$this.color?.merge(other.color) ?? other.color,
      debugLabel: other.debugLabel ?? _$this.debugLabel,
      decoration: other.decoration ?? _$this.decoration,
      decorationColor: _$this.decorationColor?.merge(other.decorationColor) ??
          other.decorationColor,
      decorationStyle: other.decorationStyle ?? _$this.decorationStyle,
      decorationThickness:
          other.decorationThickness ?? _$this.decorationThickness,
      fontFamily: other.fontFamily ?? _$this.fontFamily,
      fontFamilyFallback: MixHelpers.mergeList(
          _$this.fontFamilyFallback, other.fontFamilyFallback),
      fontFeatures:
          MixHelpers.mergeList(_$this.fontFeatures, other.fontFeatures),
      fontSize: other.fontSize ?? _$this.fontSize,
      fontStyle: other.fontStyle ?? _$this.fontStyle,
      fontWeight: other.fontWeight ?? _$this.fontWeight,
      foreground: other.foreground ?? _$this.foreground,
      height: other.height ?? _$this.height,
      letterSpacing: other.letterSpacing ?? _$this.letterSpacing,
      locale: other.locale ?? _$this.locale,
      shadows: MixHelpers.mergeList(_$this.shadows, other.shadows),
      textBaseline: other.textBaseline ?? _$this.textBaseline,
      wordSpacing: other.wordSpacing ?? _$this.wordSpacing,
    );
  }

  /// The list of properties that constitute the state of this [TextStyleData].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [TextStyleData] instances for equality.
  @override
  List<Object?> get props => [
        _$this.background,
        _$this.backgroundColor,
        _$this.color,
        _$this.debugLabel,
        _$this.decoration,
        _$this.decorationColor,
        _$this.decorationStyle,
        _$this.decorationThickness,
        _$this.fontFamily,
        _$this.fontFamilyFallback,
        _$this.fontFeatures,
        _$this.fontSize,
        _$this.fontStyle,
        _$this.fontWeight,
        _$this.foreground,
        _$this.height,
        _$this.letterSpacing,
        _$this.locale,
        _$this.shadows,
        _$this.textBaseline,
        _$this.wordSpacing,
      ];

  TextStyleData get _$this => this as TextStyleData;
}

base mixin _$TextStyleDto on Dto<TextStyle> {
  /// Merges the properties of this [TextStyleDto] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [TextStyleDto] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  TextStyleDto merge(TextStyleDto? other) {
    if (other == null) return _$this;

    return TextStyleDto._(
      value: [...?_$this.value, ...?other.value],
    );
  }

  /// The list of properties that constitute the state of this [TextStyleDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [TextStyleDto] instances for equality.
  @override
  List<Object?> get props => [
        _$this.value,
      ];

  TextStyleDto get _$this => this as TextStyleDto;
}
