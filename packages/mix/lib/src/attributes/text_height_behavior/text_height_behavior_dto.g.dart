// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_height_behavior_dto.dart';

// **************************************************************************
// MixableDtoGenerator
// **************************************************************************

mixin _$TextHeightBehaviorDto on Dto<TextHeightBehavior> {
  /// Resolves to [TextHeightBehavior] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final textHeightBehavior = TextHeightBehaviorDto(...).resolve(mix);
  /// ```
  @override
  TextHeightBehavior resolve(MixData mix) {
    return TextHeightBehavior(
      applyHeightToFirstAscent: _$this.applyHeightToFirstAscent ??
          defaultValue.applyHeightToFirstAscent,
      applyHeightToLastDescent: _$this.applyHeightToLastDescent ??
          defaultValue.applyHeightToLastDescent,
      leadingDistribution:
          _$this.leadingDistribution ?? defaultValue.leadingDistribution,
    );
  }

  /// Merges the properties of this [TextHeightBehaviorDto] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [TextHeightBehaviorDto] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  TextHeightBehaviorDto merge(covariant TextHeightBehaviorDto? other) {
    if (other == null) return _$this;

    return TextHeightBehaviorDto(
      applyHeightToFirstAscent:
          other.applyHeightToFirstAscent ?? _$this.applyHeightToFirstAscent,
      applyHeightToLastDescent:
          other.applyHeightToLastDescent ?? _$this.applyHeightToLastDescent,
      leadingDistribution:
          other.leadingDistribution ?? _$this.leadingDistribution,
    );
  }

  /// The list of properties that constitute the state of this [TextHeightBehaviorDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [TextHeightBehaviorDto] instances for equality.
  @override
  List<Object?> get props => [
        _$this.applyHeightToFirstAscent,
        _$this.applyHeightToLastDescent,
        _$this.leadingDistribution,
      ];

  TextHeightBehaviorDto get _$this => this as TextHeightBehaviorDto;
}

extension TextHeightBehaviorMixExt on TextHeightBehavior {
  TextHeightBehaviorDto toDto() {
    return TextHeightBehaviorDto(
      applyHeightToFirstAscent: applyHeightToFirstAscent,
      applyHeightToLastDescent: applyHeightToLastDescent,
      leadingDistribution: leadingDistribution,
    );
  }
}

extension ListTextHeightBehaviorMixExt on List<TextHeightBehavior> {
  List<TextHeightBehaviorDto> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
