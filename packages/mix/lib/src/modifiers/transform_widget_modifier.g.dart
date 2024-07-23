// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transform_widget_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$TransformSpec on Spec<TransformSpec> {
  static TransformSpec from(MixData mix) {
    return mix.attributeOf<TransformSpecAttribute>()?.resolve(mix) ??
        const TransformSpec();
  }

  /// {@template transform_spec_of}
  /// Retrieves the [TransformSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [TransformSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [TransformSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final transformSpec = TransformSpec.of(context);
  /// ```
  /// {@endtemplate}
  static TransformSpec of(BuildContext context) {
    return _$TransformSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [TransformSpec] but with the given fields
  /// replaced with the new values.
  @override
  TransformSpec copyWith({
    Matrix4? transform,
    Alignment? alignment,
  }) {
    return TransformSpec(
        transform: transform ?? _$this.transform,
        alignment: alignment ?? _$this.alignment);
  }

  /// Linearly interpolates between this [TransformSpec] and another [TransformSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [TransformSpec] is returned. When [t] is 1.0, the [other] [TransformSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [TransformSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [TransformSpec] instance.
  ///
  /// The interpolation is performed on each property of the [TransformSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [MixHelpers.lerpMatrix4] for [transform].
  /// - [Alignment.lerp] for [alignment].

  /// For , the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [TransformSpec] is used. Otherwise, the value
  /// from the [other] [TransformSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [TransformSpec] configurations.
  @override
  TransformSpec lerp(TransformSpec? other, double t) {
    if (other == null) return _$this;

    return TransformSpec(
        transform: MixHelpers.lerpMatrix4(_$this.transform, other.transform, t),
        alignment: Alignment.lerp(_$this.alignment, other.alignment, t));
  }

  /// The list of properties that constitute the state of this [TransformSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [TransformSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.transform,
        _$this.alignment,
      ];

  TransformSpec get _$this => this as TransformSpec;
}

/// Represents the attributes of a [TransformSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [TransformSpec].
///
/// Use this class to configure the attributes of a [TransformSpec] and pass it to
/// the [TransformSpec] constructor.
final class TransformSpecAttribute extends SpecAttribute<TransformSpec>
    with Diagnosticable {
  final Matrix4? transform;
  final Alignment? alignment;

  const TransformSpecAttribute({this.transform, this.alignment});

  /// Resolves to [TransformSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final transformSpec = TransformSpecAttribute(...).resolve(mix);
  /// ```
  @override
  TransformSpec resolve(MixData mix) {
    return TransformSpec(transform: transform, alignment: alignment);
  }

  /// Merges the properties of this [TransformSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [TransformSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  TransformSpecAttribute merge(TransformSpecAttribute? other) {
    if (other == null) return this;

    return TransformSpecAttribute(
        transform: other.transform ?? transform,
        alignment: other.alignment ?? alignment);
  }

  /// The list of properties that constitute the state of this [TransformSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [TransformSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        transform,
        alignment,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.addUsingDefault('transform', transform);
    properties.addUsingDefault('alignment', alignment);
  }
}

/// Utility class for configuring [TransformSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [TransformSpecAttribute].
/// Use the methods of this class to configure specific properties of a [TransformSpecAttribute].
base class TransformSpecUtility<T extends Attribute>
    extends SpecUtility<T, TransformSpecAttribute> {
  /// Utility for defining [TransformSpecAttribute.transform]
  late final transform = Matrix4Utility((v) => only(transform: v));

  /// Utility for defining [TransformSpecAttribute.alignment]
  late final alignment = AlignmentUtility((v) => only(alignment: v));

  TransformSpecUtility(super.builder);

  static final self = TransformSpecUtility((v) => v);

  /// Returns a new [TransformSpecAttribute] with the specified properties.
  @override
  T only({
    Matrix4? transform,
    Alignment? alignment,
  }) {
    return builder(TransformSpecAttribute(
      transform: transform,
      alignment: alignment,
    ));
  }
}

/// A tween that interpolates between two [TransformSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [TransformSpec] specifications.
class TransformSpecTween extends Tween<TransformSpec?> {
  TransformSpecTween({
    super.begin,
    super.end,
  });

  @override
  TransformSpec lerp(double t) {
    if (begin == null && end == null) return const TransformSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
