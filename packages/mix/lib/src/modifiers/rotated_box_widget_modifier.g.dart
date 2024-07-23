// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rotated_box_widget_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$RotatedBoxSpec on Spec<RotatedBoxSpec> {
  static RotatedBoxSpec from(MixData mix) {
    return mix.attributeOf<RotatedBoxSpecAttribute>()?.resolve(mix) ??
        const RotatedBoxSpec._();
  }

  /// {@template rotated_box_spec_of}
  /// Retrieves the [RotatedBoxSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [RotatedBoxSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [RotatedBoxSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final rotatedBoxSpec = RotatedBoxSpec.of(context);
  /// ```
  /// {@endtemplate}
  static RotatedBoxSpec of(BuildContext context) {
    return _$RotatedBoxSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [RotatedBoxSpec] but with the given fields
  /// replaced with the new values.
  @override
  RotatedBoxSpec copyWith({
    int? quarterTurns,
  }) {
    return RotatedBoxSpec._(quarterTurns: quarterTurns ?? _$this.quarterTurns);
  }

  /// Linearly interpolates between this [RotatedBoxSpec] and another [RotatedBoxSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [RotatedBoxSpec] is returned. When [t] is 1.0, the [other] [RotatedBoxSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [RotatedBoxSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [RotatedBoxSpec] instance.
  ///
  /// The interpolation is performed on each property of the [RotatedBoxSpec] using the appropriate
  /// interpolation method:
  ///

  /// For [quarterTurns], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [RotatedBoxSpec] is used. Otherwise, the value
  /// from the [other] [RotatedBoxSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [RotatedBoxSpec] configurations.
  @override
  RotatedBoxSpec lerp(RotatedBoxSpec? other, double t) {
    if (other == null) return _$this;

    return RotatedBoxSpec._(
        quarterTurns: t < 0.5 ? _$this.quarterTurns : other.quarterTurns);
  }

  /// The list of properties that constitute the state of this [RotatedBoxSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [RotatedBoxSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.quarterTurns,
      ];

  RotatedBoxSpec get _$this => this as RotatedBoxSpec;
}

/// Represents the attributes of a [RotatedBoxSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [RotatedBoxSpec].
///
/// Use this class to configure the attributes of a [RotatedBoxSpec] and pass it to
/// the [RotatedBoxSpec] constructor.
final class RotatedBoxSpecAttribute extends SpecAttribute<RotatedBoxSpec>
    with Diagnosticable {
  final int? quarterTurns;

  const RotatedBoxSpecAttribute({this.quarterTurns});

  /// Resolves to [RotatedBoxSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final rotatedBoxSpec = RotatedBoxSpecAttribute(...).resolve(mix);
  /// ```
  @override
  RotatedBoxSpec resolve(MixData mix) {
    return RotatedBoxSpec._(quarterTurns: quarterTurns);
  }

  /// Merges the properties of this [RotatedBoxSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [RotatedBoxSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  RotatedBoxSpecAttribute merge(RotatedBoxSpecAttribute? other) {
    if (other == null) return this;

    return RotatedBoxSpecAttribute._(
        quarterTurns: other.quarterTurns ?? quarterTurns);
  }

  /// The list of properties that constitute the state of this [RotatedBoxSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [RotatedBoxSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        quarterTurns,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.addUsingDefault('quarterTurns', quarterTurns);
  }
}

/// Utility class for configuring [RotatedBoxSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [RotatedBoxSpecAttribute].
/// Use the methods of this class to configure specific properties of a [RotatedBoxSpecAttribute].
base class RotatedBoxSpecUtility<T extends Attribute>
    extends SpecUtility<T, RotatedBoxSpecAttribute> {
  /// Utility for defining [RotatedBoxSpecAttribute.quarterTurns]
  late final quarterTurns = IntUtility((v) => only(quarterTurns: v));

  RotatedBoxSpecUtility(super.builder);

  static final self = RotatedBoxSpecUtility((v) => v);

  /// Returns a new [RotatedBoxSpecAttribute] with the specified properties.
  @override
  T only({
    int? quarterTurns,
  }) {
    return builder(RotatedBoxSpecAttribute(
      quarterTurns: quarterTurns,
    ));
  }
}

/// A tween that interpolates between two [RotatedBoxSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [RotatedBoxSpec] specifications.
class RotatedBoxSpecTween extends Tween<RotatedBoxSpec?> {
  RotatedBoxSpecTween({
    super.begin,
    super.end,
  });

  @override
  RotatedBoxSpec lerp(double t) {
    if (begin == null && end == null) return RotatedBoxSpec._();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
