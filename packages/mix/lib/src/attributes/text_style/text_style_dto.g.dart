// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_style_dto.dart';

// **************************************************************************
// Generator: DtoDefinitionBuilder
// **************************************************************************

mixin _$TextStyleDataRef on Dto<TextStyle> {
  /// The list of properties that constitute the state of this [TextStyleDataRef].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [TextStyleDataRef] instances for equality.
  @override
  List<Object?> get props {
    return [
      _$this.ref,
    ];
  }

  TextStyleDataRef get _$this => this as TextStyleDataRef;
}

mixin _$TextStyleData on Dto<TextStyle> {
  @override
  TextStyle resolve(MixData mix) {
    return TextStyle(
      background: _$this.background,
      backgroundColor: _$this.backgroundColor?.resolve(mix),
      color: _$this.color?.resolve(mix),
      debugLabel: _$this.debugLabel,
      decoration: _$this.decoration,
      decorationColor: _$this.decorationColor?.resolve(mix),
      decorationStyle: _$this.decorationStyle,
      decorationThickness: _$this.decorationThickness,
      fontFamily: _$this.fontFamily,
      fontFamilyFallback: _$this.fontFamilyFallback,
      fontFeatures: _$this.fontFeatures,
      fontSize: _$this.fontSize,
      fontStyle: _$this.fontStyle,
      fontWeight: _$this.fontWeight,
      foreground: _$this.foreground,
      height: _$this.height,
      letterSpacing: _$this.letterSpacing,
      locale: _$this.locale,
      shadows: _$this.shadows?.map((e) => e.resolve(mix)).toList(),
      textBaseline: _$this.textBaseline,
      wordSpacing: _$this.wordSpacing,
    );
  }

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
      fontFamilyFallback: _$mergeListT(
        _$this.fontFamilyFallback,
        other.fontFamilyFallback,
      ),
      fontFeatures: _$mergeListT(
        _$this.fontFeatures,
        other.fontFeatures,
      ),
      fontSize: other.fontSize ?? _$this.fontSize,
      fontStyle: other.fontStyle ?? _$this.fontStyle,
      fontWeight: other.fontWeight ?? _$this.fontWeight,
      foreground: other.foreground ?? _$this.foreground,
      height: other.height ?? _$this.height,
      letterSpacing: other.letterSpacing ?? _$this.letterSpacing,
      locale: other.locale ?? _$this.locale,
      shadows: Dto.mergeList(_$this.shadows, other.shadows),
      textBaseline: other.textBaseline ?? _$this.textBaseline,
      wordSpacing: other.wordSpacing ?? _$this.wordSpacing,
    );
  }

  /// The list of properties that constitute the state of this [TextStyleData].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [TextStyleData] instances for equality.
  @override
  List<Object?> get props {
    return [
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
  }

  TextStyleData get _$this => this as TextStyleData;
  List<T>? _$mergeListT<T>(
    List<T>? a,
    List<T>? b,
  ) {
    if (b == null) return a;
    if (a == null) return b;

    final mergedList = [...a];
    for (int i = 0; i < b.length; i++) {
      if (i < mergedList.length) {
        mergedList[i] = b[i] ?? mergedList[i];
      } else {
        mergedList.add(b[i]);
      }
    }

    return mergedList;
  }
}

mixin _$TextStyleDto on Dto<TextStyle> {
  @override
  TextStyleDto merge(TextStyleDto? other) {
    if (other == null) return _$this;

    return TextStyleDto._(
      [..._$this.value, ...other.value],
    );
  }

  /// The list of properties that constitute the state of this [TextStyleDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [TextStyleDto] instances for equality.
  @override
  List<Object?> get props {
    return [
      _$this.value,
    ];
  }

  TextStyleDto get _$this => this as TextStyleDto;
}
