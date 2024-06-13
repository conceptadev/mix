// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'border_dto.dart';

// **************************************************************************
// Generator: DtoDefinitionBuilder
// **************************************************************************

mixin BorderSideDtoMixable on Dto<BorderSide> {
  @override
  BorderSide resolve(MixData mix) {
    final defaultValue = BorderSide();

    return BorderSide(
      color: _$this.color?.resolve(mix) ?? defaultValue.color,
      strokeAlign: _$this.strokeAlign ?? defaultValue.strokeAlign,
      style: _$this.style ?? defaultValue.style,
      width: _$this.width ?? defaultValue.width,
    );
  }

  @override
  BorderSideDto merge(BorderSideDto? other) {
    if (other == null) return _$this;

    return BorderSideDto(
      color: _$this.color?.merge(other.color) ?? other.color,
      strokeAlign: other.strokeAlign ?? _$this.strokeAlign,
      style: other.style ?? _$this.style,
      width: other.width ?? _$this.width,
    );
  }

  /// The list of properties that constitute the state of this [BorderSideDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BorderSideDto] instances for equality.
  @override
  List<Object?> get props {
    return [
      _$this.color,
      _$this.strokeAlign,
      _$this.style,
      _$this.width,
    ];
  }

  BorderSideDto get _$this => this as BorderSideDto;
}

extension BorderSideExt on BorderSide {
  BorderSideDto toDto() {
    return BorderSideDto(
      color: color?.toDto(),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );
  }
}

/// Utility class for configuring [BorderSideDto] properties.
///
/// This class provides methods to set individual properties of a [BorderSideDto].
///
/// Use the methods of this class to configure specific properties of a [BorderSideDto].
final class BorderSideUtility<T extends Attribute>
    extends DtoUtility<T, BorderSideDto, BorderSide> {
  BorderSideUtility(super.builder)
      : super(valueToDto: (value) => value.toDto());

  /// Utility for defining [BorderSideDto.color]
  late final color = ColorUtility((v) => only(color: v));

  /// Utility for defining [BorderSideDto.strokeAlign]
  late final strokeAlign = DoubleUtility((v) => only(strokeAlign: v));

  /// Utility for defining [BorderSideDto.style]
  late final style = BorderStyleUtility((v) => only(style: v));

  /// Utility for defining [BorderSideDto.style.none]
  late final none = style.none;

  /// Utility for defining [BorderSideDto.width]
  late final width = DoubleUtility((v) => only(width: v));

  /// Returns a new [BorderSideDto] with the specified properties.
  @override
  T only({
    ColorDto? color,
    double? strokeAlign,
    BorderStyle? style,
    double? width,
  }) {
    return builder(
      BorderSideDto(
        color: color,
        strokeAlign: strokeAlign,
        style: style,
        width: width,
      ),
    );
  }

  T call({
    Color? color,
    double? strokeAlign,
    BorderStyle? style,
    double? width,
  }) {
    return only(
      color: color?.toDto(),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );
  }
}
