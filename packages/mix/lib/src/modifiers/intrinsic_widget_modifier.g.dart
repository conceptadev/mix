// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intrinsic_widget_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$IntrinsicHeightSpec on Spec<IntrinsicHeightSpec> {
  static IntrinsicHeightSpec from(MixData mix) {
    return mix.attributeOf<IntrinsicHeightSpecAttribute>()?.resolve(mix) ??
        const IntrinsicHeightSpec();
  }

  /// {@template intrinsic_height_spec_of}
  /// Retrieves the [IntrinsicHeightSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [IntrinsicHeightSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [IntrinsicHeightSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final intrinsicHeightSpec = IntrinsicHeightSpec.of(context);
  /// ```
  /// {@endtemplate}
  static IntrinsicHeightSpec of(BuildContext context) {
    return _$IntrinsicHeightSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [IntrinsicHeightSpec] but with the given fields
  /// replaced with the new values.
  @override
  IntrinsicHeightSpec copyWith() {
    return IntrinsicHeightSpec();
  }

  /// Linearly interpolates between this [IntrinsicHeightSpec] and another [IntrinsicHeightSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [IntrinsicHeightSpec] is returned. When [t] is 1.0, the [other] [IntrinsicHeightSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [IntrinsicHeightSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [IntrinsicHeightSpec] instance.
  ///
  /// The interpolation is performed on each property of the [IntrinsicHeightSpec] using the appropriate
  /// interpolation method:
  ///

  /// For , the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [IntrinsicHeightSpec] is used. Otherwise, the value
  /// from the [other] [IntrinsicHeightSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [IntrinsicHeightSpec] configurations.
  @override
  IntrinsicHeightSpec lerp(IntrinsicHeightSpec? other, double t) {
    if (other == null) return _$this;

    return IntrinsicHeightSpec();
  }

  /// The list of properties that constitute the state of this [IntrinsicHeightSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [IntrinsicHeightSpec] instances for equality.
  @override
  List<Object?> get props => [];

  IntrinsicHeightSpec get _$this => this as IntrinsicHeightSpec;
}

/// Represents the attributes of a [IntrinsicHeightSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [IntrinsicHeightSpec].
///
/// Use this class to configure the attributes of a [IntrinsicHeightSpec] and pass it to
/// the [IntrinsicHeightSpec] constructor.
final class IntrinsicHeightSpecAttribute
    extends SpecAttribute<IntrinsicHeightSpec> with Diagnosticable {
  const IntrinsicHeightSpecAttribute();

  /// Resolves to [IntrinsicHeightSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final intrinsicHeightSpec = IntrinsicHeightSpecAttribute(...).resolve(mix);
  /// ```
  @override
  IntrinsicHeightSpec resolve(MixData mix) {
    return IntrinsicHeightSpec();
  }

  /// Merges the properties of this [IntrinsicHeightSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [IntrinsicHeightSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  IntrinsicHeightSpecAttribute merge(IntrinsicHeightSpecAttribute? other) {
    if (other == null) return this;

    return other;
  }

  /// The list of properties that constitute the state of this [IntrinsicHeightSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [IntrinsicHeightSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

/// Utility class for configuring [IntrinsicHeightSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [IntrinsicHeightSpecAttribute].
/// Use the methods of this class to configure specific properties of a [IntrinsicHeightSpecAttribute].
base class IntrinsicHeightSpecUtility<T extends Attribute>
    extends SpecUtility<T, IntrinsicHeightSpecAttribute> {
  IntrinsicHeightSpecUtility(super.builder);

  static final self = IntrinsicHeightSpecUtility((v) => v);

  /// Returns a new [IntrinsicHeightSpecAttribute] with the specified properties.
  @override
  T only() {
    return builder(IntrinsicHeightSpecAttribute());
  }
}

/// A tween that interpolates between two [IntrinsicHeightSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [IntrinsicHeightSpec] specifications.
class IntrinsicHeightSpecTween extends Tween<IntrinsicHeightSpec?> {
  IntrinsicHeightSpecTween({
    super.begin,
    super.end,
  });

  @override
  IntrinsicHeightSpec lerp(double t) {
    if (begin == null && end == null) return const IntrinsicHeightSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$IntrinsicWidthSpec on Spec<IntrinsicWidthSpec> {
  static IntrinsicWidthSpec from(MixData mix) {
    return mix.attributeOf<IntrinsicWidthSpecAttribute>()?.resolve(mix) ??
        const IntrinsicWidthSpec();
  }

  /// {@template intrinsic_width_spec_of}
  /// Retrieves the [IntrinsicWidthSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [IntrinsicWidthSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [IntrinsicWidthSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final intrinsicWidthSpec = IntrinsicWidthSpec.of(context);
  /// ```
  /// {@endtemplate}
  static IntrinsicWidthSpec of(BuildContext context) {
    return _$IntrinsicWidthSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [IntrinsicWidthSpec] but with the given fields
  /// replaced with the new values.
  @override
  IntrinsicWidthSpec copyWith() {
    return IntrinsicWidthSpec();
  }

  /// Linearly interpolates between this [IntrinsicWidthSpec] and another [IntrinsicWidthSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [IntrinsicWidthSpec] is returned. When [t] is 1.0, the [other] [IntrinsicWidthSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [IntrinsicWidthSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [IntrinsicWidthSpec] instance.
  ///
  /// The interpolation is performed on each property of the [IntrinsicWidthSpec] using the appropriate
  /// interpolation method:
  ///

  /// For , the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [IntrinsicWidthSpec] is used. Otherwise, the value
  /// from the [other] [IntrinsicWidthSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [IntrinsicWidthSpec] configurations.
  @override
  IntrinsicWidthSpec lerp(IntrinsicWidthSpec? other, double t) {
    if (other == null) return _$this;

    return IntrinsicWidthSpec();
  }

  /// The list of properties that constitute the state of this [IntrinsicWidthSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [IntrinsicWidthSpec] instances for equality.
  @override
  List<Object?> get props => [];

  IntrinsicWidthSpec get _$this => this as IntrinsicWidthSpec;
}

/// Represents the attributes of a [IntrinsicWidthSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [IntrinsicWidthSpec].
///
/// Use this class to configure the attributes of a [IntrinsicWidthSpec] and pass it to
/// the [IntrinsicWidthSpec] constructor.
final class IntrinsicWidthSpecAttribute
    extends SpecAttribute<IntrinsicWidthSpec> with Diagnosticable {
  const IntrinsicWidthSpecAttribute();

  /// Resolves to [IntrinsicWidthSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final intrinsicWidthSpec = IntrinsicWidthSpecAttribute(...).resolve(mix);
  /// ```
  @override
  IntrinsicWidthSpec resolve(MixData mix) {
    return IntrinsicWidthSpec();
  }

  /// Merges the properties of this [IntrinsicWidthSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [IntrinsicWidthSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  IntrinsicWidthSpecAttribute merge(IntrinsicWidthSpecAttribute? other) {
    if (other == null) return this;

    return other;
  }

  /// The list of properties that constitute the state of this [IntrinsicWidthSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [IntrinsicWidthSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

/// Utility class for configuring [IntrinsicWidthSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [IntrinsicWidthSpecAttribute].
/// Use the methods of this class to configure specific properties of a [IntrinsicWidthSpecAttribute].
base class IntrinsicWidthSpecUtility<T extends Attribute>
    extends SpecUtility<T, IntrinsicWidthSpecAttribute> {
  IntrinsicWidthSpecUtility(super.builder);

  static final self = IntrinsicWidthSpecUtility((v) => v);

  /// Returns a new [IntrinsicWidthSpecAttribute] with the specified properties.
  @override
  T only() {
    return builder(IntrinsicWidthSpecAttribute());
  }
}

/// A tween that interpolates between two [IntrinsicWidthSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [IntrinsicWidthSpec] specifications.
class IntrinsicWidthSpecTween extends Tween<IntrinsicWidthSpec?> {
  IntrinsicWidthSpecTween({
    super.begin,
    super.end,
  });

  @override
  IntrinsicWidthSpec lerp(double t) {
    if (begin == null && end == null) return const IntrinsicWidthSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
