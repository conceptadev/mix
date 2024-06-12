// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strut_style_dto.dart';

// **************************************************************************
// Generator: DtoDefinitionBuilder
// **************************************************************************

mixin StrutStyleDtoMixable on Dto<StrutStyle> {
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

  @override
  StrutStyleDto merge(StrutStyleDto? other) {
    if (other == null) return _$this;

    return StrutStyleDto(
      fontFamily: other.fontFamily ?? _$this.fontFamily,
      fontFamilyFallback: _mergeListT(
        _$this.fontFamilyFallback,
        other.fontFamilyFallback,
      ),
      fontSize: other.fontSize ?? _$this.fontSize,
      fontWeight: other.fontWeight ?? _$this.fontWeight,
      fontStyle: other.fontStyle ?? _$this.fontStyle,
      height: other.height ?? _$this.height,
      leading: other.leading ?? _$this.leading,
      forceStrutHeight: other.forceStrutHeight ?? _$this.forceStrutHeight,
    );
  }

  /// The list of properties that constitute the state of this [StrutStyleDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [StrutStyleDto] instances for equality.
  @override
  List<Object?> get props {
    return [
      _$this.fontFamily,
      _$this.fontFamilyFallback,
      _$this.fontSize,
      _$this.fontWeight,
      _$this.fontStyle,
      _$this.height,
      _$this.leading,
      _$this.forceStrutHeight,
    ];
  }

  StrutStyleDto get _$this => this as StrutStyleDto;
  List<T>? _mergeListT<T>(
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

extension StrutStyleExt on StrutStyle {
  StrutStyleDto toDto() {
    return StrutStyleDto(
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

/// Utility class for configuring [StrutStyleDto] properties.
///
/// This class provides methods to set individual properties of a [StrutStyleDto].
///
/// Use the methods of this class to configure specific properties of a [StrutStyleDto].
final class StrutStyleUtility<T extends Attribute>
    extends DtoUtility<T, StrutStyleDto, StrutStyle> {
  StrutStyleUtility(super.builder)
      : super(valueToDto: (value) => value.toDto());

  /// Utility for defining [StrutStyleDto.fontFamily]
  late final fontFamily = FontFamilyUtility((v) => only(fontFamily: v));

  /// Utility for defining [StrutStyleDto.fontFamilyFallback]
  late final fontFamilyFallback =
      StringListUtility((v) => only(fontFamilyFallback: v));

  /// Utility for defining [StrutStyleDto.fontSize]
  late final fontSize = FontSizeUtility((v) => only(fontSize: v));

  /// Utility for defining [StrutStyleDto.fontWeight]
  late final fontWeight = FontWeightUtility((v) => only(fontWeight: v));

  /// Utility for defining [StrutStyleDto.fontStyle]
  late final fontStyle = FontStyleUtility((v) => only(fontStyle: v));

  /// Utility for defining [StrutStyleDto.height]
  late final height = DoubleUtility((v) => only(height: v));

  /// Utility for defining [StrutStyleDto.leading]
  late final leading = DoubleUtility((v) => only(leading: v));

  /// Utility for defining [StrutStyleDto.forceStrutHeight]
  late final forceStrutHeight = BoolUtility((v) => only(forceStrutHeight: v));

  /// Returns a new [StrutStyleDto] with the specified properties.
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
    return builder(
      StrutStyleDto(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        height: height,
        leading: leading,
        forceStrutHeight: forceStrutHeight,
      ),
    );
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
