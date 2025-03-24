// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'border_dto.dart';

// **************************************************************************
// MixGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

/// A mixin that provides DTO functionality for [BorderMix].
mixin _$BorderMix on Mixable<Border> {
  /// Resolves to [Border] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final border = BorderMix(...).resolve(mix);
  /// ```
  @override
  Border resolve(MixData mix) {
    return Border(
      top: _$this.top?.resolve(mix) ?? BorderSide.none,
      bottom: _$this.bottom?.resolve(mix) ?? BorderSide.none,
      left: _$this.left?.resolve(mix) ?? BorderSide.none,
      right: _$this.right?.resolve(mix) ?? BorderSide.none,
    );
  }

  /// Merges the properties of this [BorderMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [BorderMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  BorderMix merge(BorderMix? other) {
    if (other == null) return _$this;

    return BorderMix(
      top: _$this.top?.merge(other.top) ?? other.top,
      bottom: _$this.bottom?.merge(other.bottom) ?? other.bottom,
      left: _$this.left?.merge(other.left) ?? other.left,
      right: _$this.right?.merge(other.right) ?? other.right,
    );
  }

  /// The list of properties that constitute the state of this [BorderMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BorderMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.top,
        _$this.bottom,
        _$this.left,
        _$this.right,
      ];

  /// Returns this instance as a [BorderMix].
  BorderMix get _$this => this as BorderMix;
}

/// Extension methods to convert [Border] to [BorderMix].
extension BorderMixExt on Border {
  /// Converts this [Border] to a [BorderMix].
  BorderMix toDto() {
    return BorderMix(
      top: top.toDto(),
      bottom: bottom.toDto(),
      left: left.toDto(),
      right: right.toDto(),
    );
  }
}

/// Extension methods to convert List<[Border]> to List<[BorderMix]>.
extension ListBorderMixExt on List<Border> {
  /// Converts this List<[Border]> to a List<[BorderMix]>.
  List<BorderMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

/// A mixin that provides DTO functionality for [BorderDirectionalMix].
mixin _$BorderDirectionalMix on Mixable<BorderDirectional> {
  /// Resolves to [BorderDirectional] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final borderDirectional = BorderDirectionalMix(...).resolve(mix);
  /// ```
  @override
  BorderDirectional resolve(MixData mix) {
    return BorderDirectional(
      top: _$this.top?.resolve(mix) ?? BorderSide.none,
      bottom: _$this.bottom?.resolve(mix) ?? BorderSide.none,
      start: _$this.start?.resolve(mix) ?? BorderSide.none,
      end: _$this.end?.resolve(mix) ?? BorderSide.none,
    );
  }

  /// Merges the properties of this [BorderDirectionalMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [BorderDirectionalMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  BorderDirectionalMix merge(BorderDirectionalMix? other) {
    if (other == null) return _$this;

    return BorderDirectionalMix(
      top: _$this.top?.merge(other.top) ?? other.top,
      bottom: _$this.bottom?.merge(other.bottom) ?? other.bottom,
      start: _$this.start?.merge(other.start) ?? other.start,
      end: _$this.end?.merge(other.end) ?? other.end,
    );
  }

  /// The list of properties that constitute the state of this [BorderDirectionalMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BorderDirectionalMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.top,
        _$this.bottom,
        _$this.start,
        _$this.end,
      ];

  /// Returns this instance as a [BorderDirectionalMix].
  BorderDirectionalMix get _$this => this as BorderDirectionalMix;
}

/// Extension methods to convert [BorderDirectional] to [BorderDirectionalMix].
extension BorderDirectionalMixExt on BorderDirectional {
  /// Converts this [BorderDirectional] to a [BorderDirectionalMix].
  BorderDirectionalMix toDto() {
    return BorderDirectionalMix(
      top: top.toDto(),
      bottom: bottom.toDto(),
      start: start.toDto(),
      end: end.toDto(),
    );
  }
}

/// Extension methods to convert List<[BorderDirectional]> to List<[BorderDirectionalMix]>.
extension ListBorderDirectionalMixExt on List<BorderDirectional> {
  /// Converts this List<[BorderDirectional]> to a List<[BorderDirectionalMix]>.
  List<BorderDirectionalMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

/// A mixin that provides DTO functionality for [BorderSideMix].
mixin _$BorderSideMix on Mixable<BorderSide>, HasDefaultValue<BorderSide> {
  /// Resolves to [BorderSide] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final borderSide = BorderSideMix(...).resolve(mix);
  /// ```
  @override
  BorderSide resolve(MixData mix) {
    return BorderSide(
      color: _$this.color?.resolve(mix) ?? defaultValue.color,
      strokeAlign: _$this.strokeAlign ?? defaultValue.strokeAlign,
      style: _$this.style ?? defaultValue.style,
      width: _$this.width ?? defaultValue.width,
    );
  }

  /// Merges the properties of this [BorderSideMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [BorderSideMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  BorderSideMix merge(BorderSideMix? other) {
    if (other == null) return _$this;

    return BorderSideMix(
      color: _$this.color?.merge(other.color) ?? other.color,
      strokeAlign: other.strokeAlign ?? _$this.strokeAlign,
      style: other.style ?? _$this.style,
      width: other.width ?? _$this.width,
    );
  }

  /// The list of properties that constitute the state of this [BorderSideMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BorderSideMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.color,
        _$this.strokeAlign,
        _$this.style,
        _$this.width,
      ];

  /// Returns this instance as a [BorderSideMix].
  BorderSideMix get _$this => this as BorderSideMix;
}

/// Utility class for configuring [BorderSide] properties.
///
/// This class provides methods to set individual properties of a [BorderSide].
/// Use the methods of this class to configure specific properties of a [BorderSide].
class BorderSideMixUtility<T extends Attribute>
    extends DtoUtility<T, BorderSideMix, BorderSide> {
  /// Utility for defining [BorderSideMix.color]
  late final color = ColorUtility((v) => only(color: v));

  /// Utility for defining [BorderSideMix.strokeAlign]
  late final strokeAlign = StrokeAlignUtility((v) => only(strokeAlign: v));

  /// Utility for defining [BorderSideMix.style]
  late final style = BorderStyleUtility((v) => only(style: v));

  /// Utility for defining [BorderSideMix.width]
  late final width = DoubleUtility((v) => only(width: v));

  BorderSideMixUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Creates an [Attribute] instance using the [BorderSideMix.none] constructor.
  T none() => builder(const BorderSideMix.none());

  /// Returns a new [BorderSideMix] with the specified properties.
  @override
  T only({
    ColorDto? color,
    double? strokeAlign,
    BorderStyle? style,
    double? width,
  }) {
    return builder(BorderSideMix(
      color: color,
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    ));
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

/// Extension methods to convert [BorderSide] to [BorderSideMix].
extension BorderSideMixExt on BorderSide {
  /// Converts this [BorderSide] to a [BorderSideMix].
  BorderSideMix toDto() {
    return BorderSideMix(
      color: color.toDto(),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );
  }
}

/// Extension methods to convert List<[BorderSide]> to List<[BorderSideMix]>.
extension ListBorderSideMixExt on List<BorderSide> {
  /// Converts this List<[BorderSide]> to a List<[BorderSideMix]>.
  List<BorderSideMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
