// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'align_widget_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$AlignSpec on Spec<AlignSpec> {
  static AlignSpec from(MixData mix) {
    return mix.attributeOf<AlignSpecAttribute>()?.resolve(mix) ??
        const AlignSpec();
  }

  /// {@template align_spec_of}
  /// Retrieves the [AlignSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [AlignSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [AlignSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final alignSpec = AlignSpec.of(context);
  /// ```
  /// {@endtemplate}
  static AlignSpec of(BuildContext context) {
    return _$AlignSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [AlignSpec] but with the given fields
  /// replaced with the new values.
  @override
  AlignSpec copyWith({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
  }) {
    return AlignSpec(
        alignment: alignment ?? _$this.alignment,
        widthFactor: widthFactor ?? _$this.widthFactor,
        heightFactor: heightFactor ?? _$this.heightFactor);
  }

  /// Linearly interpolates between this [AlignSpec] and another [AlignSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [AlignSpec] is returned. When [t] is 1.0, the [other] [AlignSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [AlignSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [AlignSpec] instance.
  ///
  /// The interpolation is performed on each property of the [AlignSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [AlignmentGeometry.lerp] for [alignment].
  /// - [MixHelpers.lerpDouble] for [widthFactor] and [heightFactor].

  /// For , the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [AlignSpec] is used. Otherwise, the value
  /// from the [other] [AlignSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [AlignSpec] configurations.
  @override
  AlignSpec lerp(AlignSpec? other, double t) {
    if (other == null) return _$this;

    return AlignSpec(
        alignment: AlignmentGeometry.lerp(_$this.alignment, other.alignment, t),
        widthFactor:
            MixHelpers.lerpDouble(_$this.widthFactor, other.widthFactor, t),
        heightFactor:
            MixHelpers.lerpDouble(_$this.heightFactor, other.heightFactor, t));
  }

  /// The list of properties that constitute the state of this [AlignSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [AlignSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.alignment,
        _$this.widthFactor,
        _$this.heightFactor,
      ];

  AlignSpec get _$this => this as AlignSpec;
}

/// Represents the attributes of a [AlignSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [AlignSpec].
///
/// Use this class to configure the attributes of a [AlignSpec] and pass it to
/// the [AlignSpec] constructor.
final class AlignSpecAttribute extends SpecAttribute<AlignSpec>
    with Diagnosticable {
  final AlignmentGeometry? alignment;
  final double? widthFactor;
  final double? heightFactor;

  const AlignSpecAttribute(
      {this.alignment, this.widthFactor, this.heightFactor});

  /// Resolves to [AlignSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final alignSpec = AlignSpecAttribute(...).resolve(mix);
  /// ```
  @override
  AlignSpec resolve(MixData mix) {
    return AlignSpec(
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor);
  }

  /// Merges the properties of this [AlignSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [AlignSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  AlignSpecAttribute merge(AlignSpecAttribute? other) {
    if (other == null) return this;

    return AlignSpecAttribute(
        alignment: other.alignment ?? alignment,
        widthFactor: other.widthFactor ?? widthFactor,
        heightFactor: other.heightFactor ?? heightFactor);
  }

  /// The list of properties that constitute the state of this [AlignSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [AlignSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        alignment,
        widthFactor,
        heightFactor,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.addUsingDefault('alignment', alignment);
    properties.addUsingDefault('widthFactor', widthFactor);
    properties.addUsingDefault('heightFactor', heightFactor);
  }
}

/// Utility class for configuring [AlignSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [AlignSpecAttribute].
/// Use the methods of this class to configure specific properties of a [AlignSpecAttribute].
base class AlignSpecUtility<T extends Attribute>
    extends SpecUtility<T, AlignSpecAttribute> {
  /// Utility for defining [AlignSpecAttribute.alignment]
  late final alignment = AlignmentGeometryUtility((v) => only(alignment: v));

  /// Utility for defining [AlignSpecAttribute.widthFactor]
  late final widthFactor = DoubleUtility((v) => only(widthFactor: v));

  /// Utility for defining [AlignSpecAttribute.heightFactor]
  late final heightFactor = DoubleUtility((v) => only(heightFactor: v));

  AlignSpecUtility(super.builder);

  static final self = AlignSpecUtility((v) => v);

  /// Returns a new [AlignSpecAttribute] with the specified properties.
  @override
  T only({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
  }) {
    return builder(AlignSpecAttribute(
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    ));
  }
}

/// A tween that interpolates between two [AlignSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [AlignSpec] specifications.
class AlignSpecTween extends Tween<AlignSpec?> {
  AlignSpecTween({
    super.begin,
    super.end,
  });

  @override
  AlignSpec lerp(double t) {
    if (begin == null && end == null) return const AlignSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
