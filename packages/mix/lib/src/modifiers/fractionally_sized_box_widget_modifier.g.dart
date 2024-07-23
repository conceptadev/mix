// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fractionally_sized_box_widget_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$FractionallySizedBoxSpec on Spec<FractionallySizedBoxSpec> {
  static FractionallySizedBoxSpec from(MixData mix) {
    return mix.attributeOf<FractionallySizedBoxSpecAttribute>()?.resolve(mix) ??
        const FractionallySizedBoxSpec();
  }

  /// {@template fractionally_sized_box_spec_of}
  /// Retrieves the [FractionallySizedBoxSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [FractionallySizedBoxSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [FractionallySizedBoxSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final fractionallySizedBoxSpec = FractionallySizedBoxSpec.of(context);
  /// ```
  /// {@endtemplate}
  static FractionallySizedBoxSpec of(BuildContext context) {
    return _$FractionallySizedBoxSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [FractionallySizedBoxSpec] but with the given fields
  /// replaced with the new values.
  @override
  FractionallySizedBoxSpec copyWith({
    double? widthFactor,
    double? heightFactor,
    AlignmentGeometry? alignment,
  }) {
    return FractionallySizedBoxSpec(
        widthFactor: widthFactor ?? _$this.widthFactor,
        heightFactor: heightFactor ?? _$this.heightFactor,
        alignment: alignment ?? _$this.alignment);
  }

  /// Linearly interpolates between this [FractionallySizedBoxSpec] and another [FractionallySizedBoxSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [FractionallySizedBoxSpec] is returned. When [t] is 1.0, the [other] [FractionallySizedBoxSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [FractionallySizedBoxSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [FractionallySizedBoxSpec] instance.
  ///
  /// The interpolation is performed on each property of the [FractionallySizedBoxSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [MixHelpers.lerpDouble] for [widthFactor] and [heightFactor].
  /// - [AlignmentGeometry.lerp] for [alignment].

  /// For , the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [FractionallySizedBoxSpec] is used. Otherwise, the value
  /// from the [other] [FractionallySizedBoxSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [FractionallySizedBoxSpec] configurations.
  @override
  FractionallySizedBoxSpec lerp(FractionallySizedBoxSpec? other, double t) {
    if (other == null) return _$this;

    return FractionallySizedBoxSpec(
        widthFactor:
            MixHelpers.lerpDouble(_$this.widthFactor, other.widthFactor, t),
        heightFactor:
            MixHelpers.lerpDouble(_$this.heightFactor, other.heightFactor, t),
        alignment:
            AlignmentGeometry.lerp(_$this.alignment, other.alignment, t));
  }

  /// The list of properties that constitute the state of this [FractionallySizedBoxSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [FractionallySizedBoxSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.widthFactor,
        _$this.heightFactor,
        _$this.alignment,
      ];

  FractionallySizedBoxSpec get _$this => this as FractionallySizedBoxSpec;
}

/// Represents the attributes of a [FractionallySizedBoxSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [FractionallySizedBoxSpec].
///
/// Use this class to configure the attributes of a [FractionallySizedBoxSpec] and pass it to
/// the [FractionallySizedBoxSpec] constructor.
final class FractionallySizedBoxSpecAttribute
    extends SpecAttribute<FractionallySizedBoxSpec> with Diagnosticable {
  final double? widthFactor;
  final double? heightFactor;
  final AlignmentGeometry? alignment;

  const FractionallySizedBoxSpecAttribute(
      {this.widthFactor, this.heightFactor, this.alignment});

  /// Resolves to [FractionallySizedBoxSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final fractionallySizedBoxSpec = FractionallySizedBoxSpecAttribute(...).resolve(mix);
  /// ```
  @override
  FractionallySizedBoxSpec resolve(MixData mix) {
    return FractionallySizedBoxSpec(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        alignment: alignment);
  }

  /// Merges the properties of this [FractionallySizedBoxSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [FractionallySizedBoxSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  FractionallySizedBoxSpecAttribute merge(
      FractionallySizedBoxSpecAttribute? other) {
    if (other == null) return this;

    return FractionallySizedBoxSpecAttribute(
        widthFactor: other.widthFactor ?? widthFactor,
        heightFactor: other.heightFactor ?? heightFactor,
        alignment: other.alignment ?? alignment);
  }

  /// The list of properties that constitute the state of this [FractionallySizedBoxSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [FractionallySizedBoxSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        widthFactor,
        heightFactor,
        alignment,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.addUsingDefault('widthFactor', widthFactor);
    properties.addUsingDefault('heightFactor', heightFactor);
    properties.addUsingDefault('alignment', alignment);
  }
}

/// Utility class for configuring [FractionallySizedBoxSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [FractionallySizedBoxSpecAttribute].
/// Use the methods of this class to configure specific properties of a [FractionallySizedBoxSpecAttribute].
base class FractionallySizedBoxSpecUtility<T extends Attribute>
    extends SpecUtility<T, FractionallySizedBoxSpecAttribute> {
  /// Utility for defining [FractionallySizedBoxSpecAttribute.widthFactor]
  late final widthFactor = DoubleUtility((v) => only(widthFactor: v));

  /// Utility for defining [FractionallySizedBoxSpecAttribute.heightFactor]
  late final heightFactor = DoubleUtility((v) => only(heightFactor: v));

  /// Utility for defining [FractionallySizedBoxSpecAttribute.alignment]
  late final alignment = AlignmentGeometryUtility((v) => only(alignment: v));

  FractionallySizedBoxSpecUtility(super.builder);

  static final self = FractionallySizedBoxSpecUtility((v) => v);

  /// Returns a new [FractionallySizedBoxSpecAttribute] with the specified properties.
  @override
  T only({
    double? widthFactor,
    double? heightFactor,
    AlignmentGeometry? alignment,
  }) {
    return builder(FractionallySizedBoxSpecAttribute(
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      alignment: alignment,
    ));
  }
}

/// A tween that interpolates between two [FractionallySizedBoxSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [FractionallySizedBoxSpec] specifications.
class FractionallySizedBoxSpecTween extends Tween<FractionallySizedBoxSpec?> {
  FractionallySizedBoxSpecTween({
    super.begin,
    super.end,
  });

  @override
  FractionallySizedBoxSpec lerp(double t) {
    if (begin == null && end == null) return const FractionallySizedBoxSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
