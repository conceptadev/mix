// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shape_border_dto.dart';

// **************************************************************************
// MixableDtoGenerator
// **************************************************************************

// Error generating code for RoundedRectangleBorderDto: FormatException: Not an instance of String.
// Error generating code for BeveledRectangleBorderDto: Null check operator used on a null value
// Error generating code for ContinuousRectangleBorderDto: Null check operator used on a null value
// Error generating code for CircleBorderDto: Null check operator used on a null value
// Error generating code for StarBorderDto: Null check operator used on a null value
// Error generating code for LinearBorderDto: Null check operator used on a null value
/// A mixin that provides DTO functionality for [LinearBorderEdgeDto].
mixin _$LinearBorderEdgeDto on Dto<LinearBorderEdge> {
  /// Resolves to [LinearBorderEdge] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final linearBorderEdge = LinearBorderEdgeDto(...).resolve(mix);
  /// ```
  @override
  LinearBorderEdge resolve(MixData mix) {
    return LinearBorderEdge(
      size: _$this.size ?? defaultValue.size,
      alignment: _$this.alignment ?? defaultValue.alignment,
    );
  }

  /// Merges the properties of this [LinearBorderEdgeDto] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [LinearBorderEdgeDto] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  LinearBorderEdgeDto merge(LinearBorderEdgeDto? other) {
    if (other == null) return _$this;

    return LinearBorderEdgeDto(
      size: other.size ?? _$this.size,
      alignment: other.alignment ?? _$this.alignment,
    );
  }

  /// The list of properties that constitute the state of this [LinearBorderEdgeDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [LinearBorderEdgeDto] instances for equality.
  @override
  List<Object?> get props => [
        _$this.size,
        _$this.alignment,
      ];

  /// Returns this instance as a [LinearBorderEdgeDto].
  LinearBorderEdgeDto get _$this => this as LinearBorderEdgeDto;
}

/// Utility class for configuring [LinearBorderEdge] properties.
///
/// This class provides methods to set individual properties of a [LinearBorderEdge].
/// Use the methods of this class to configure specific properties of a [LinearBorderEdge].
class LinearBorderEdgeUtility<T extends Attribute>
    extends DtoUtility<T, LinearBorderEdgeDto, LinearBorderEdge> {
  /// Utility for defining [LinearBorderEdgeDto.size]
  late final size = doubleUtility((v) => only(size: v));

  /// Utility for defining [LinearBorderEdgeDto.alignment]
  late final alignment = doubleUtility((v) => only(alignment: v));

  LinearBorderEdgeUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  LinearBorderEdgeUtility<T> get chain =>
      LinearBorderEdgeUtility(attributeBuilder, mutable: true);

  /// Returns a new [LinearBorderEdgeDto] with the specified properties.
  @override
  T only({
    SpacingSideDto? size,
    SpacingSideDto? alignment,
  }) {
    return builder(LinearBorderEdgeDto(
      size: size,
      alignment: alignment,
    ));
  }

  T call({
    double? size,
    double? alignment,
  }) {
    return only(
      size: size?.toDto(),
      alignment: alignment?.toDto(),
    );
  }
}

/// Extension methods to convert [LinearBorderEdge] to [LinearBorderEdgeDto].
extension LinearBorderEdgeMixExt on LinearBorderEdge {
  /// Converts this [LinearBorderEdge] to a [LinearBorderEdgeDto].
  LinearBorderEdgeDto toDto() {
    return LinearBorderEdgeDto(
      size: size?.toDto(),
      alignment: alignment?.toDto(),
    );
  }
}

/// Extension methods to convert List<[LinearBorderEdge]> to List<[LinearBorderEdgeDto]>.
extension ListLinearBorderEdgeMixExt on List<LinearBorderEdge> {
  /// Converts this List<[LinearBorderEdge]> to a List<[LinearBorderEdgeDto]>.
  List<LinearBorderEdgeDto> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

// Error generating code for StadiumBorderDto: Null check operator used on a null value
