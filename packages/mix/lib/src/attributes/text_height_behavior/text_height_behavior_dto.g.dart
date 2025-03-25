// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_height_behavior_dto.dart';

// **************************************************************************
// MixGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

/// A mixin that provides DTO functionality for [TextHeightBehaviorMix].
mixin _$TextHeightBehaviorMix on Mixable<TextHeightBehavior> {
  /// Resolves to [TextHeightBehavior] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final textHeightBehavior = TextHeightBehaviorMix(...).resolve(mix);
  /// ```
  @override
  TextHeightBehavior resolve(MixData mix) {
    return TextHeightBehavior(
      applyHeightToFirstAscent: _$this.applyHeightToFirstAscent ?? true,
      applyHeightToLastDescent: _$this.applyHeightToLastDescent ?? true,
      leadingDistribution:
          _$this.leadingDistribution ?? TextLeadingDistribution.proportional,
    );
  }

  /// Merges the properties of this [TextHeightBehaviorMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [TextHeightBehaviorMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  TextHeightBehaviorMix merge(TextHeightBehaviorMix? other) {
    if (other == null) return _$this;

    return TextHeightBehaviorMix(
      applyHeightToFirstAscent:
          other.applyHeightToFirstAscent ?? _$this.applyHeightToFirstAscent,
      applyHeightToLastDescent:
          other.applyHeightToLastDescent ?? _$this.applyHeightToLastDescent,
      leadingDistribution:
          other.leadingDistribution ?? _$this.leadingDistribution,
    );
  }

  /// The list of properties that constitute the state of this [TextHeightBehaviorMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [TextHeightBehaviorMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.applyHeightToFirstAscent,
        _$this.applyHeightToLastDescent,
        _$this.leadingDistribution,
      ];

  /// Returns this instance as a [TextHeightBehaviorMix].
  TextHeightBehaviorMix get _$this => this as TextHeightBehaviorMix;
}

/// Extension methods to convert [TextHeightBehavior] to [TextHeightBehaviorMix].
extension TextHeightBehaviorMixExt on TextHeightBehavior {
  /// Converts this [TextHeightBehavior] to a [TextHeightBehaviorMix].
  TextHeightBehaviorMix toDto() {
    return TextHeightBehaviorMix(
      applyHeightToFirstAscent: applyHeightToFirstAscent,
      applyHeightToLastDescent: applyHeightToLastDescent,
      leadingDistribution: leadingDistribution,
    );
  }
}

/// Extension methods to convert List<[TextHeightBehavior]> to List<[TextHeightBehaviorMix]>.
extension ListTextHeightBehaviorMixExt on List<TextHeightBehavior> {
  /// Converts this List<[TextHeightBehavior]> to a List<[TextHeightBehaviorMix]>.
  List<TextHeightBehaviorMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
