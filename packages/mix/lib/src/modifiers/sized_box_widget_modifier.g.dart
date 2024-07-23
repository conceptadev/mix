// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sized_box_widget_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$SizedBoxSpec on Spec<SizedBoxSpec> {
  static SizedBoxSpec from(MixData mix) {
    return mix.attributeOf<SizedBoxSpecAttribute>()?.resolve(mix) ??
        const SizedBoxSpec();
  }

  /// {@template sized_box_spec_of}
  /// Retrieves the [SizedBoxSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [SizedBoxSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [SizedBoxSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final sizedBoxSpec = SizedBoxSpec.of(context);
  /// ```
  /// {@endtemplate}
  static SizedBoxSpec of(BuildContext context) {
    return _$SizedBoxSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [SizedBoxSpec] but with the given fields
  /// replaced with the new values.
  @override
  SizedBoxSpec copyWith({
    double? width,
    double? height,
  }) {
    return SizedBoxSpec(
        width: width ?? _$this.width, height: height ?? _$this.height);
  }

  /// Linearly interpolates between this [SizedBoxSpec] and another [SizedBoxSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [SizedBoxSpec] is returned. When [t] is 1.0, the [other] [SizedBoxSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [SizedBoxSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [SizedBoxSpec] instance.
  ///
  /// The interpolation is performed on each property of the [SizedBoxSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [MixHelpers.lerpDouble] for [width] and [height].

  /// For , the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [SizedBoxSpec] is used. Otherwise, the value
  /// from the [other] [SizedBoxSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [SizedBoxSpec] configurations.
  @override
  SizedBoxSpec lerp(SizedBoxSpec? other, double t) {
    if (other == null) return _$this;

    return SizedBoxSpec(
        width: MixHelpers.lerpDouble(_$this.width, other.width, t),
        height: MixHelpers.lerpDouble(_$this.height, other.height, t));
  }

  /// The list of properties that constitute the state of this [SizedBoxSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SizedBoxSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.width,
        _$this.height,
      ];

  SizedBoxSpec get _$this => this as SizedBoxSpec;
}

/// Represents the attributes of a [SizedBoxSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [SizedBoxSpec].
///
/// Use this class to configure the attributes of a [SizedBoxSpec] and pass it to
/// the [SizedBoxSpec] constructor.
final class SizedBoxSpecAttribute extends SpecAttribute<SizedBoxSpec>
    with Diagnosticable {
  final double? width;
  final double? height;

  const SizedBoxSpecAttribute({this.width, this.height});

  /// Resolves to [SizedBoxSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final sizedBoxSpec = SizedBoxSpecAttribute(...).resolve(mix);
  /// ```
  @override
  SizedBoxSpec resolve(MixData mix) {
    return SizedBoxSpec(width: width, height: height);
  }

  /// Merges the properties of this [SizedBoxSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [SizedBoxSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  SizedBoxSpecAttribute merge(SizedBoxSpecAttribute? other) {
    if (other == null) return this;

    return SizedBoxSpecAttribute(
        width: other.width ?? width, height: other.height ?? height);
  }

  /// The list of properties that constitute the state of this [SizedBoxSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SizedBoxSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        width,
        height,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.addUsingDefault('width', width);
    properties.addUsingDefault('height', height);
  }
}

/// Utility class for configuring [SizedBoxSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [SizedBoxSpecAttribute].
/// Use the methods of this class to configure specific properties of a [SizedBoxSpecAttribute].
base class SizedBoxSpecUtility<T extends Attribute>
    extends SpecUtility<T, SizedBoxSpecAttribute> {
  /// Utility for defining [SizedBoxSpecAttribute.width]
  late final width = DoubleUtility((v) => only(width: v));

  /// Utility for defining [SizedBoxSpecAttribute.height]
  late final height = DoubleUtility((v) => only(height: v));

  SizedBoxSpecUtility(super.builder);

  static final self = SizedBoxSpecUtility((v) => v);

  /// Returns a new [SizedBoxSpecAttribute] with the specified properties.
  @override
  T only({
    double? width,
    double? height,
  }) {
    return builder(SizedBoxSpecAttribute(
      width: width,
      height: height,
    ));
  }
}

/// A tween that interpolates between two [SizedBoxSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [SizedBoxSpec] specifications.
class SizedBoxSpecTween extends Tween<SizedBoxSpec?> {
  SizedBoxSpecTween({
    super.begin,
    super.end,
  });

  @override
  SizedBoxSpec lerp(double t) {
    if (begin == null && end == null) return const SizedBoxSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
