// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edge_insets_dto.dart';

// **************************************************************************
// MixGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

/// A mixin that provides DTO functionality for [EdgeInsetsMix].
mixin _$EdgeInsetsMix on Mixable<EdgeInsets> {
  /// Merges the properties of this [EdgeInsetsMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [EdgeInsetsMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  EdgeInsetsMix merge(EdgeInsetsMix? other) {
    if (other == null) return _$this;

    return EdgeInsetsMix(
      top: other.top ?? _$this.top,
      bottom: other.bottom ?? _$this.bottom,
      left: other.left ?? _$this.left,
      right: other.right ?? _$this.right,
    );
  }

  /// The list of properties that constitute the state of this [EdgeInsetsMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [EdgeInsetsMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.top,
        _$this.bottom,
        _$this.left,
        _$this.right,
      ];

  /// Returns this instance as a [EdgeInsetsMix].
  EdgeInsetsMix get _$this => this as EdgeInsetsMix;
}

/// Utility class for configuring [EdgeInsets] properties.
///
/// This class provides methods to set individual properties of a [EdgeInsets].
/// Use the methods of this class to configure specific properties of a [EdgeInsets].
class EdgeInsetsMixUtility<T extends Attribute>
    extends DtoUtility<T, EdgeInsetsMix, EdgeInsets> {
  /// Utility for defining [EdgeInsetsMix.top]
  late final top = DoubleUtility((v) => only(top: v));

  /// Utility for defining [EdgeInsetsMix.bottom]
  late final bottom = DoubleUtility((v) => only(bottom: v));

  /// Utility for defining [EdgeInsetsMix.left]
  late final left = DoubleUtility((v) => only(left: v));

  /// Utility for defining [EdgeInsetsMix.right]
  late final right = DoubleUtility((v) => only(right: v));

  EdgeInsetsMixUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Creates an [Attribute] instance using the [EdgeInsetsMix.all] constructor.
  T all(double value) => builder(EdgeInsetsMix.all(value));

  /// Creates an [Attribute] instance using the [EdgeInsetsMix.none] constructor.
  T none() => builder(const EdgeInsetsMix.none());

  /// Returns a new [EdgeInsetsMix] with the specified properties.
  @override
  T only({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return builder(EdgeInsetsMix(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    ));
  }

  T call({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return only(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    );
  }
}

/// Extension methods to convert [EdgeInsets] to [EdgeInsetsMix].
extension EdgeInsetsMixExt on EdgeInsets {
  /// Converts this [EdgeInsets] to a [EdgeInsetsMix].
  EdgeInsetsMix toDto() {
    return EdgeInsetsMix(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    );
  }
}

/// Extension methods to convert List<[EdgeInsets]> to List<[EdgeInsetsMix]>.
extension ListEdgeInsetsMixExt on List<EdgeInsets> {
  /// Converts this List<[EdgeInsets]> to a List<[EdgeInsetsMix]>.
  List<EdgeInsetsMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

/// A mixin that provides DTO functionality for [EdgeInsetsDirectionalMix].
mixin _$EdgeInsetsDirectionalMix on Mixable<EdgeInsetsDirectional> {
  /// Merges the properties of this [EdgeInsetsDirectionalMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [EdgeInsetsDirectionalMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  EdgeInsetsDirectionalMix merge(EdgeInsetsDirectionalMix? other) {
    if (other == null) return _$this;

    return EdgeInsetsDirectionalMix(
      top: other.top ?? _$this.top,
      bottom: other.bottom ?? _$this.bottom,
      start: other.start ?? _$this.start,
      end: other.end ?? _$this.end,
    );
  }

  /// The list of properties that constitute the state of this [EdgeInsetsDirectionalMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [EdgeInsetsDirectionalMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.top,
        _$this.bottom,
        _$this.start,
        _$this.end,
      ];

  /// Returns this instance as a [EdgeInsetsDirectionalMix].
  EdgeInsetsDirectionalMix get _$this => this as EdgeInsetsDirectionalMix;
}

/// Utility class for configuring [EdgeInsetsDirectional] properties.
///
/// This class provides methods to set individual properties of a [EdgeInsetsDirectional].
/// Use the methods of this class to configure specific properties of a [EdgeInsetsDirectional].
class EdgeInsetsDirectionalUtility<T extends Attribute>
    extends DtoUtility<T, EdgeInsetsDirectionalMix, EdgeInsetsDirectional> {
  /// Utility for defining [EdgeInsetsDirectionalMix.top]
  late final top = DoubleUtility((v) => only(top: v));

  /// Utility for defining [EdgeInsetsDirectionalMix.bottom]
  late final bottom = DoubleUtility((v) => only(bottom: v));

  /// Utility for defining [EdgeInsetsDirectionalMix.start]
  late final start = DoubleUtility((v) => only(start: v));

  /// Utility for defining [EdgeInsetsDirectionalMix.end]
  late final end = DoubleUtility((v) => only(end: v));

  EdgeInsetsDirectionalUtility(super.builder)
      : super(valueToDto: (v) => v.toDto());

  /// Creates an [Attribute] instance using the [EdgeInsetsDirectionalMix.all] constructor.
  T all(double value) => builder(EdgeInsetsDirectionalMix.all(value));

  /// Creates an [Attribute] instance using the [EdgeInsetsDirectionalMix.none] constructor.
  T none() => builder(const EdgeInsetsDirectionalMix.none());

  /// Returns a new [EdgeInsetsDirectionalMix] with the specified properties.
  @override
  T only({
    double? top,
    double? bottom,
    double? start,
    double? end,
  }) {
    return builder(EdgeInsetsDirectionalMix(
      top: top,
      bottom: bottom,
      start: start,
      end: end,
    ));
  }

  T call({
    double? top,
    double? bottom,
    double? start,
    double? end,
  }) {
    return only(
      top: top,
      bottom: bottom,
      start: start,
      end: end,
    );
  }
}

/// Extension methods to convert [EdgeInsetsDirectional] to [EdgeInsetsDirectionalMix].
extension EdgeInsetsDirectionalMixExt on EdgeInsetsDirectional {
  /// Converts this [EdgeInsetsDirectional] to a [EdgeInsetsDirectionalMix].
  EdgeInsetsDirectionalMix toDto() {
    return EdgeInsetsDirectionalMix(
      top: top,
      bottom: bottom,
      start: start,
      end: end,
    );
  }
}

/// Extension methods to convert List<[EdgeInsetsDirectional]> to List<[EdgeInsetsDirectionalMix]>.
extension ListEdgeInsetsDirectionalMixExt on List<EdgeInsetsDirectional> {
  /// Converts this List<[EdgeInsetsDirectional]> to a List<[EdgeInsetsDirectionalMix]>.
  List<EdgeInsetsDirectionalMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
