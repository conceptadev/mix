// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'positioned_widget_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

mixin _$PositionedModifierSpec on WidgetModifierSpec<PositionedModifierSpec> {
  /// Creates a copy of this [PositionedModifierSpec] but with the given fields
  /// replaced with the new values.
  @override
  PositionedModifierSpec copyWith({
    num? right,
    num? left,
    num? top,
    num? bottom,
    num? width,
    num? height,
    bool? fill,
  }) {
    return PositionedModifierSpec(
      right: right ?? _$this.right,
      left: left ?? _$this.left,
      top: top ?? _$this.top,
      bottom: bottom ?? _$this.bottom,
      width: width ?? _$this.width,
      height: height ?? _$this.height,
      fill: fill ?? _$this.fill,
    );
  }

  /// Linearly interpolates between this [PositionedModifierSpec] and another [PositionedModifierSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [PositionedModifierSpec] is returned. When [t] is 1.0, the [other] [PositionedModifierSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [PositionedModifierSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [PositionedModifierSpec] instance.
  ///
  /// The interpolation is performed on each property of the [PositionedModifierSpec] using the appropriate
  /// interpolation method:
  ///

  /// For [right] and [left] and [top] and [bottom] and [width] and [height] and [fill], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [PositionedModifierSpec] is used. Otherwise, the value
  /// from the [other] [PositionedModifierSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [PositionedModifierSpec] configurations.
  @override
  PositionedModifierSpec lerp(PositionedModifierSpec? other, double t) {
    if (other == null) return _$this;

    return PositionedModifierSpec(
      right: t < 0.5 ? _$this.right : other.right,
      left: t < 0.5 ? _$this.left : other.left,
      top: t < 0.5 ? _$this.top : other.top,
      bottom: t < 0.5 ? _$this.bottom : other.bottom,
      width: t < 0.5 ? _$this.width : other.width,
      height: t < 0.5 ? _$this.height : other.height,
      fill: t < 0.5 ? _$this.fill : other.fill,
    );
  }

  /// The list of properties that constitute the state of this [PositionedModifierSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [PositionedModifierSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.right,
        _$this.left,
        _$this.top,
        _$this.bottom,
        _$this.width,
        _$this.height,
        _$this.fill,
      ];

  PositionedModifierSpec get _$this => this as PositionedModifierSpec;

  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
        .add(DiagnosticsProperty('right', _$this.right, defaultValue: null));
    properties
        .add(DiagnosticsProperty('left', _$this.left, defaultValue: null));
    properties.add(DiagnosticsProperty('top', _$this.top, defaultValue: null));
    properties
        .add(DiagnosticsProperty('bottom', _$this.bottom, defaultValue: null));
    properties
        .add(DiagnosticsProperty('width', _$this.width, defaultValue: null));
    properties
        .add(DiagnosticsProperty('height', _$this.height, defaultValue: null));
    properties
        .add(DiagnosticsProperty('fill', _$this.fill, defaultValue: null));
  }
}

/// Represents the attributes of a [PositionedModifierSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [PositionedModifierSpec].
///
/// Use this class to configure the attributes of a [PositionedModifierSpec] and pass it to
/// the [PositionedModifierSpec] constructor.
final class PositionedModifierSpecAttribute
    extends WidgetModifierSpecAttribute<PositionedModifierSpec>
    with Diagnosticable {
  final num? right;
  final num? left;
  final num? top;
  final num? bottom;
  final num? width;
  final num? height;
  final bool? fill;

  const PositionedModifierSpecAttribute({
    this.right,
    this.left,
    this.top,
    this.bottom,
    this.width,
    this.height,
    this.fill,
  });

  /// Resolves to [PositionedModifierSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final positionedModifierSpec = PositionedModifierSpecAttribute(...).resolve(mix);
  /// ```
  @override
  PositionedModifierSpec resolve(MixData mix) {
    return PositionedModifierSpec(
      right: right,
      left: left,
      top: top,
      bottom: bottom,
      width: width,
      height: height,
      fill: fill,
    );
  }

  /// Merges the properties of this [PositionedModifierSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [PositionedModifierSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  PositionedModifierSpecAttribute merge(
      PositionedModifierSpecAttribute? other) {
    if (other == null) return this;

    return PositionedModifierSpecAttribute(
      right: other.right ?? right,
      left: other.left ?? left,
      top: other.top ?? top,
      bottom: other.bottom ?? bottom,
      width: other.width ?? width,
      height: other.height ?? height,
      fill: other.fill ?? fill,
    );
  }

  /// The list of properties that constitute the state of this [PositionedModifierSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [PositionedModifierSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        right,
        left,
        top,
        bottom,
        width,
        height,
        fill,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('right', right, defaultValue: null));
    properties.add(DiagnosticsProperty('left', left, defaultValue: null));
    properties.add(DiagnosticsProperty('top', top, defaultValue: null));
    properties.add(DiagnosticsProperty('bottom', bottom, defaultValue: null));
    properties.add(DiagnosticsProperty('width', width, defaultValue: null));
    properties.add(DiagnosticsProperty('height', height, defaultValue: null));
    properties.add(DiagnosticsProperty('fill', fill, defaultValue: null));
  }
}

/// A tween that interpolates between two [PositionedModifierSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [PositionedModifierSpec] specifications.
class PositionedModifierSpecTween extends Tween<PositionedModifierSpec?> {
  PositionedModifierSpecTween({
    super.begin,
    super.end,
  });

  @override
  PositionedModifierSpec lerp(double t) {
    if (begin == null && end == null) {
      return const PositionedModifierSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}
