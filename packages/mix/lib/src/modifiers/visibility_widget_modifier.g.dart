// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visibility_widget_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$VisibilityModifierSpec on WidgetModifierSpec<VisibilityModifierSpec> {
  static VisibilityModifierSpec from(MixData mix) {
    return mix.attributeOf<VisibilityModifierAttribute>()?.resolve(mix) ??
        const VisibilityModifierSpec();
  }

  /// {@template visibility_modifier_spec_of}
  /// Retrieves the [VisibilityModifierSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [VisibilityModifierSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [VisibilityModifierSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final visibilityModifierSpec = VisibilityModifierSpec.of(context);
  /// ```
  /// {@endtemplate}
  static VisibilityModifierSpec of(BuildContext context) {
    return _$VisibilityModifierSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [VisibilityModifierSpec] but with the given fields
  /// replaced with the new values.
  @override
  VisibilityModifierSpec copyWith({
    bool? visible,
  }) {
    return VisibilityModifierSpec(
      visible ?? _$this.visible,
    );
  }

  /// Linearly interpolates between this [VisibilityModifierSpec] and another [VisibilityModifierSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [VisibilityModifierSpec] is returned. When [t] is 1.0, the [other] [VisibilityModifierSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [VisibilityModifierSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [VisibilityModifierSpec] instance.
  ///
  /// The interpolation is performed on each property of the [VisibilityModifierSpec] using the appropriate
  /// interpolation method:
  ///

  /// For [visible], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [VisibilityModifierSpec] is used. Otherwise, the value
  /// from the [other] [VisibilityModifierSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [VisibilityModifierSpec] configurations.
  @override
  VisibilityModifierSpec lerp(VisibilityModifierSpec? other, double t) {
    if (other == null) return _$this;

    return VisibilityModifierSpec(
      t < 0.5 ? _$this.visible : other.visible,
    );
  }

  /// The list of properties that constitute the state of this [VisibilityModifierSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [VisibilityModifierSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.visible,
      ];

  VisibilityModifierSpec get _$this => this as VisibilityModifierSpec;
}

/// Represents the attributes of a [VisibilityModifierSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [VisibilityModifierSpec].
///
/// Use this class to configure the attributes of a [VisibilityModifierSpec] and pass it to
/// the [VisibilityModifierSpec] constructor.
final class VisibilityModifierAttribute
    extends WidgetModifierSpecAttribute<VisibilityModifierSpec>
    with Diagnosticable {
  final bool? visible;

  const VisibilityModifierAttribute({
    this.visible,
  });

  /// Resolves to [VisibilityModifierSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final visibilityModifierSpec = VisibilityModifierAttribute(...).resolve(mix);
  /// ```
  @override
  VisibilityModifierSpec resolve(MixData mix) {
    return VisibilityModifierSpec(
      visible,
    );
  }

  /// Merges the properties of this [VisibilityModifierAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [VisibilityModifierAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  VisibilityModifierAttribute merge(VisibilityModifierAttribute? other) {
    if (other == null) return this;

    return VisibilityModifierAttribute(
      visible: other.visible ?? visible,
    );
  }

  /// The list of properties that constitute the state of this [VisibilityModifierAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [VisibilityModifierAttribute] instances for equality.
  @override
  List<Object?> get props => [
        visible,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.addUsingDefault('visible', visible);
  }
}

/// A tween that interpolates between two [VisibilityModifierSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [VisibilityModifierSpec] specifications.
class VisibilityModifierSpecTween extends Tween<VisibilityModifierSpec?> {
  VisibilityModifierSpecTween({
    super.begin,
    super.end,
  });

  @override
  VisibilityModifierSpec lerp(double t) {
    if (begin == null && end == null) return const VisibilityModifierSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
