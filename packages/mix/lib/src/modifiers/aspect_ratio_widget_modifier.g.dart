// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aspect_ratio_widget_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$AspectRatioSpec on Spec<AspectRatioSpec> {
  static AspectRatioSpec from(MixData mix) {
    return mix.attributeOf<AspectRatioSpecAttribute>()?.resolve(mix) ??
        const AspectRatioSpec();
  }

  /// {@template aspect_ratio_spec_of}
  /// Retrieves the [AspectRatioSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [AspectRatioSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [AspectRatioSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final aspectRatioSpec = AspectRatioSpec.of(context);
  /// ```
  /// {@endtemplate}
  static AspectRatioSpec of(BuildContext context) {
    return _$AspectRatioSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [AspectRatioSpec] but with the given fields
  /// replaced with the new values.
  @override
  AspectRatioSpec copyWith({
    double? aspectRatio,
  }) {
    return AspectRatioSpec(aspectRatio: aspectRatio ?? _$this.aspectRatio);
  }

  /// Linearly interpolates between this [AspectRatioSpec] and another [AspectRatioSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [AspectRatioSpec] is returned. When [t] is 1.0, the [other] [AspectRatioSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [AspectRatioSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [AspectRatioSpec] instance.
  ///
  /// The interpolation is performed on each property of the [AspectRatioSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [MixHelpers.lerpDouble] for [aspectRatio].

  /// For , the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [AspectRatioSpec] is used. Otherwise, the value
  /// from the [other] [AspectRatioSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [AspectRatioSpec] configurations.
  @override
  AspectRatioSpec lerp(AspectRatioSpec? other, double t) {
    if (other == null) return _$this;

    return AspectRatioSpec(
        aspectRatio:
            MixHelpers.lerpDouble(_$this.aspectRatio, other.aspectRatio, t));
  }

  /// The list of properties that constitute the state of this [AspectRatioSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [AspectRatioSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.aspectRatio,
      ];

  AspectRatioSpec get _$this => this as AspectRatioSpec;
}

/// Represents the attributes of a [AspectRatioSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [AspectRatioSpec].
///
/// Use this class to configure the attributes of a [AspectRatioSpec] and pass it to
/// the [AspectRatioSpec] constructor.
final class AspectRatioSpecAttribute extends SpecAttribute<AspectRatioSpec>
    with Diagnosticable {
  final double? aspectRatio;

  const AspectRatioSpecAttribute({this.aspectRatio});

  /// Resolves to [AspectRatioSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final aspectRatioSpec = AspectRatioSpecAttribute(...).resolve(mix);
  /// ```
  @override
  AspectRatioSpec resolve(MixData mix) {
    return AspectRatioSpec(aspectRatio: aspectRatio);
  }

  /// Merges the properties of this [AspectRatioSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [AspectRatioSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  AspectRatioSpecAttribute merge(AspectRatioSpecAttribute? other) {
    if (other == null) return this;

    return AspectRatioSpecAttribute(
        aspectRatio: other.aspectRatio ?? aspectRatio);
  }

  /// The list of properties that constitute the state of this [AspectRatioSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [AspectRatioSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        aspectRatio,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.addUsingDefault('aspectRatio', aspectRatio);
  }
}

/// Utility class for configuring [AspectRatioSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [AspectRatioSpecAttribute].
/// Use the methods of this class to configure specific properties of a [AspectRatioSpecAttribute].
base class AspectRatioSpecUtility<T extends Attribute>
    extends SpecUtility<T, AspectRatioSpecAttribute> {
  /// Utility for defining [AspectRatioSpecAttribute.aspectRatio]
  late final _aspectRatio = DoubleUtility((v) => only(aspectRatio: v));

  AspectRatioSpecUtility(super.builder);

  static final self = AspectRatioSpecUtility((v) => v);

  /// Returns a new [AspectRatioSpecAttribute] with the specified properties.
  @override
  T only({
    double? aspectRatio,
  }) {
    return builder(AspectRatioSpecAttribute(
      aspectRatio: aspectRatio,
    ));
  }
}

/// A tween that interpolates between two [AspectRatioSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [AspectRatioSpec] specifications.
class AspectRatioSpecTween extends Tween<AspectRatioSpec?> {
  AspectRatioSpecTween({
    super.begin,
    super.end,
  });

  @override
  AspectRatioSpec lerp(double t) {
    if (begin == null && end == null) return const AspectRatioSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
