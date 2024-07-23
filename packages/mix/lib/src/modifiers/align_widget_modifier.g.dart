// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'align_widget_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$AlignModifierSpec on WidgetModifierSpec<AlignModifierSpec> {
  static AlignModifierSpec from(MixData mix) {
    return mix.attributeOf<AlignModifierAttribute>()?.resolve(mix) ??
        const AlignModifierSpec();
  }

  /// {@template align_modifier_spec_of}
  /// Retrieves the [AlignModifierSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [AlignModifierSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [AlignModifierSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final alignModifierSpec = AlignModifierSpec.of(context);
  /// ```
  /// {@endtemplate}
  static AlignModifierSpec of(BuildContext context) {
    return _$AlignModifierSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [AlignModifierSpec] but with the given fields
  /// replaced with the new values.
  @override
  AlignModifierSpec copyWith({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
  }) {
    return AlignModifierSpec(
      alignment: alignment ?? _$this.alignment,
      widthFactor: widthFactor ?? _$this.widthFactor,
      heightFactor: heightFactor ?? _$this.heightFactor,
    );
  }

  /// Linearly interpolates between this [AlignModifierSpec] and another [AlignModifierSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [AlignModifierSpec] is returned. When [t] is 1.0, the [other] [AlignModifierSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [AlignModifierSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [AlignModifierSpec] instance.
  ///
  /// The interpolation is performed on each property of the [AlignModifierSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [AlignmentGeometry.lerp] for [alignment].
  /// - [MixHelpers.lerpDouble] for [widthFactor] and [heightFactor].

  /// For , the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [AlignModifierSpec] is used. Otherwise, the value
  /// from the [other] [AlignModifierSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [AlignModifierSpec] configurations.
  @override
  AlignModifierSpec lerp(AlignModifierSpec? other, double t) {
    if (other == null) return _$this;

    return AlignModifierSpec(
      alignment: AlignmentGeometry.lerp(_$this.alignment, other.alignment, t),
      widthFactor:
          MixHelpers.lerpDouble(_$this.widthFactor, other.widthFactor, t),
      heightFactor:
          MixHelpers.lerpDouble(_$this.heightFactor, other.heightFactor, t),
    );
  }

  /// The list of properties that constitute the state of this [AlignModifierSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [AlignModifierSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.alignment,
        _$this.widthFactor,
        _$this.heightFactor,
      ];

  AlignModifierSpec get _$this => this as AlignModifierSpec;
}

/// Represents the attributes of a [AlignModifierSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [AlignModifierSpec].
///
/// Use this class to configure the attributes of a [AlignModifierSpec] and pass it to
/// the [AlignModifierSpec] constructor.
final class AlignModifierAttribute
    extends WidgetModifierSpecAttribute<AlignModifierSpec> with Diagnosticable {
  final AlignmentGeometry? alignment;
  final double? widthFactor;
  final double? heightFactor;

  const AlignModifierAttribute({
    this.alignment,
    this.widthFactor,
    this.heightFactor,
  });

  /// Resolves to [AlignModifierSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final alignModifierSpec = AlignModifierAttribute(...).resolve(mix);
  /// ```
  @override
  AlignModifierSpec resolve(MixData mix) {
    return AlignModifierSpec(
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  /// Merges the properties of this [AlignModifierAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [AlignModifierAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  AlignModifierAttribute merge(AlignModifierAttribute? other) {
    if (other == null) return this;

    return AlignModifierAttribute(
      alignment: other.alignment ?? alignment,
      widthFactor: other.widthFactor ?? widthFactor,
      heightFactor: other.heightFactor ?? heightFactor,
    );
  }

  /// The list of properties that constitute the state of this [AlignModifierAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [AlignModifierAttribute] instances for equality.
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

/// A tween that interpolates between two [AlignModifierSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [AlignModifierSpec] specifications.
class AlignModifierSpecTween extends Tween<AlignModifierSpec?> {
  AlignModifierSpecTween({
    super.begin,
    super.end,
  });

  @override
  AlignModifierSpec lerp(double t) {
    if (begin == null && end == null) return const AlignModifierSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
