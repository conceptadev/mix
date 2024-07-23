// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visibility_widget_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$VisibilitySpec on Spec<VisibilitySpec> {
  static VisibilitySpec from(MixData mix) {
    return mix.attributeOf<VisibilitySpecAttribute>()?.resolve(mix) ??
        const VisibilitySpec._();
  }

  /// {@template visibility_spec_of}
  /// Retrieves the [VisibilitySpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [VisibilitySpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [VisibilitySpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final visibilitySpec = VisibilitySpec.of(context);
  /// ```
  /// {@endtemplate}
  static VisibilitySpec of(BuildContext context) {
    return _$VisibilitySpec.from(Mix.of(context));
  }

  /// Creates a copy of this [VisibilitySpec] but with the given fields
  /// replaced with the new values.
  @override
  VisibilitySpec copyWith({
    bool? visible,
  }) {
    return VisibilitySpec._(visible: visible ?? _$this.visible);
  }

  /// Linearly interpolates between this [VisibilitySpec] and another [VisibilitySpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [VisibilitySpec] is returned. When [t] is 1.0, the [other] [VisibilitySpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [VisibilitySpec] is returned.
  ///
  /// If [other] is null, this method returns the current [VisibilitySpec] instance.
  ///
  /// The interpolation is performed on each property of the [VisibilitySpec] using the appropriate
  /// interpolation method:
  ///

  /// For [visible], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [VisibilitySpec] is used. Otherwise, the value
  /// from the [other] [VisibilitySpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [VisibilitySpec] configurations.
  @override
  VisibilitySpec lerp(VisibilitySpec? other, double t) {
    if (other == null) return _$this;

    return VisibilitySpec._(visible: t < 0.5 ? _$this.visible : other.visible);
  }

  /// The list of properties that constitute the state of this [VisibilitySpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [VisibilitySpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.visible,
      ];

  VisibilitySpec get _$this => this as VisibilitySpec;
}

/// Represents the attributes of a [VisibilitySpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [VisibilitySpec].
///
/// Use this class to configure the attributes of a [VisibilitySpec] and pass it to
/// the [VisibilitySpec] constructor.
final class VisibilitySpecAttribute extends SpecAttribute<VisibilitySpec>
    with Diagnosticable {
  final bool? visible;

  const VisibilitySpecAttribute({this.visible});

  /// Resolves to [VisibilitySpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final visibilitySpec = VisibilitySpecAttribute(...).resolve(mix);
  /// ```
  @override
  VisibilitySpec resolve(MixData mix) {
    return VisibilitySpec._(visible: visible);
  }

  /// Merges the properties of this [VisibilitySpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [VisibilitySpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  VisibilitySpecAttribute merge(VisibilitySpecAttribute? other) {
    if (other == null) return this;

    return VisibilitySpecAttribute._(visible: other.visible ?? visible);
  }

  /// The list of properties that constitute the state of this [VisibilitySpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [VisibilitySpecAttribute] instances for equality.
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

/// Utility class for configuring [VisibilitySpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [VisibilitySpecAttribute].
/// Use the methods of this class to configure specific properties of a [VisibilitySpecAttribute].
base class VisibilitySpecUtility<T extends Attribute>
    extends SpecUtility<T, VisibilitySpecAttribute> {
  /// Utility for defining [VisibilitySpecAttribute.visible]
  late final visible = BoolUtility((v) => only(visible: v));

  VisibilitySpecUtility(super.builder);

  static final self = VisibilitySpecUtility((v) => v);

  /// Returns a new [VisibilitySpecAttribute] with the specified properties.
  @override
  T only({
    bool? visible,
  }) {
    return builder(VisibilitySpecAttribute(
      visible: visible,
    ));
  }
}

/// A tween that interpolates between two [VisibilitySpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [VisibilitySpec] specifications.
class VisibilitySpecTween extends Tween<VisibilitySpec?> {
  VisibilitySpecTween({
    super.begin,
    super.end,
  });

  @override
  VisibilitySpec lerp(double t) {
    if (begin == null && end == null) return VisibilitySpec._();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
