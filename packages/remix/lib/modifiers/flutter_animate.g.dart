// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flutter_animate.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

mixin _$FlutterAnimateModifierSpec
    on WidgetModifierSpec<FlutterAnimateModifierSpec> {
  /// Creates a copy of this [FlutterAnimateModifierSpec] but with the given fields
  /// replaced with the new values.
  @override
  FlutterAnimateModifierSpec copyWith({
    List<Effect<dynamic>>? effects,
    bool? autoPlay,
    Duration? delay,
    double? value,
    double? target,
  }) {
    return FlutterAnimateModifierSpec(
      effects: effects ?? _$this.effects,
      autoPlay: autoPlay ?? _$this.autoPlay,
      delay: delay ?? _$this.delay,
      value: value ?? _$this.value,
      target: target ?? _$this.target,
    );
  }

  /// Linearly interpolates between this [FlutterAnimateModifierSpec] and another [FlutterAnimateModifierSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [FlutterAnimateModifierSpec] is returned. When [t] is 1.0, the [other] [FlutterAnimateModifierSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [FlutterAnimateModifierSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [FlutterAnimateModifierSpec] instance.
  ///
  /// The interpolation is performed on each property of the [FlutterAnimateModifierSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [MixHelpers.lerpDouble] for [value] and [target].

  /// For [effects] and [autoPlay] and [delay], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [FlutterAnimateModifierSpec] is used. Otherwise, the value
  /// from the [other] [FlutterAnimateModifierSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [FlutterAnimateModifierSpec] configurations.
  @override
  FlutterAnimateModifierSpec lerp(FlutterAnimateModifierSpec? other, double t) {
    if (other == null) return _$this;

    return FlutterAnimateModifierSpec(
      effects: t < 0.5 ? _$this.effects : other.effects,
      autoPlay: t < 0.5 ? _$this.autoPlay : other.autoPlay,
      delay: t < 0.5 ? _$this.delay : other.delay,
      value: MixHelpers.lerpDouble(_$this.value, other.value, t),
      target: MixHelpers.lerpDouble(_$this.target, other.target, t),
    );
  }

  /// The list of properties that constitute the state of this [FlutterAnimateModifierSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [FlutterAnimateModifierSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.effects,
        _$this.autoPlay,
        _$this.delay,
        _$this.value,
        _$this.target,
      ];

  FlutterAnimateModifierSpec get _$this => this as FlutterAnimateModifierSpec;
}

/// Represents the attributes of a [FlutterAnimateModifierSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [FlutterAnimateModifierSpec].
///
/// Use this class to configure the attributes of a [FlutterAnimateModifierSpec] and pass it to
/// the [FlutterAnimateModifierSpec] constructor.
class _FlutterAnimateAttribute
    extends WidgetModifierSpecAttribute<FlutterAnimateModifierSpec> {
  final List<Effect<dynamic>>? effects;
  final bool? autoPlay;
  final Duration? delay;
  final double? value;
  final double? target;

  const _FlutterAnimateAttribute({
    this.effects,
    this.autoPlay,
    this.delay,
    this.value,
    this.target,
  });

  /// Resolves to [FlutterAnimateModifierSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final flutterAnimateModifierSpec = _FlutterAnimateAttribute(...).resolve(mix);
  /// ```
  @override
  FlutterAnimateModifierSpec resolve(MixData mix) {
    return FlutterAnimateModifierSpec(
      effects: effects,
      autoPlay: autoPlay,
      delay: delay,
      value: value,
      target: target,
    );
  }

  /// Merges the properties of this [_FlutterAnimateAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [_FlutterAnimateAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  _FlutterAnimateAttribute merge(covariant _FlutterAnimateAttribute? other) {
    if (other == null) return this;

    return _FlutterAnimateAttribute(
      effects: MixHelpers.mergeList(effects, other.effects),
      autoPlay: other.autoPlay ?? autoPlay,
      delay: other.delay ?? delay,
      value: other.value ?? value,
      target: other.target ?? target,
    );
  }

  /// The list of properties that constitute the state of this [_FlutterAnimateAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [_FlutterAnimateAttribute] instances for equality.
  @override
  List<Object?> get props => [
        effects,
        autoPlay,
        delay,
        value,
        target,
      ];
}

/// Utility class for configuring [_FlutterAnimateAttribute] properties.
///
/// This class provides methods to set individual properties of a [_FlutterAnimateAttribute].
/// Use the methods of this class to configure specific properties of a [_FlutterAnimateAttribute].
class _FlutterAnimateUtility<T extends Attribute>
    extends SpecUtility<T, _FlutterAnimateAttribute> {
  /// Utility for defining [_FlutterAnimateAttribute.effects]
  late final effects = ListUtility<T, Effect<dynamic>>((v) => only(effects: v));

  /// Utility for defining [_FlutterAnimateAttribute.autoPlay]
  late final autoPlay = BoolUtility((v) => only(autoPlay: v));

  /// Utility for defining [_FlutterAnimateAttribute.delay]
  late final delay = DurationUtility((v) => only(delay: v));

  /// Utility for defining [_FlutterAnimateAttribute.value]
  late final value = DoubleUtility((v) => only(value: v));

  /// Utility for defining [_FlutterAnimateAttribute.target]
  late final target = DoubleUtility((v) => only(target: v));

  _FlutterAnimateUtility(super.builder);

  static final self = _FlutterAnimateUtility((v) => v);

  /// Returns a new [_FlutterAnimateAttribute] with the specified properties.
  @override
  T only({
    List<Effect<dynamic>>? effects,
    bool? autoPlay,
    Duration? delay,
    double? value,
    double? target,
  }) {
    return builder(_FlutterAnimateAttribute(
      effects: effects,
      autoPlay: autoPlay,
      delay: delay,
      value: value,
      target: target,
    ));
  }
}

/// A tween that interpolates between two [FlutterAnimateModifierSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [FlutterAnimateModifierSpec] specifications.
class FlutterAnimateModifierSpecTween
    extends Tween<FlutterAnimateModifierSpec?> {
  FlutterAnimateModifierSpecTween({
    super.begin,
    super.end,
  });

  @override
  FlutterAnimateModifierSpec lerp(double t) {
    if (begin == null && end == null) {
      return const FlutterAnimateModifierSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}
