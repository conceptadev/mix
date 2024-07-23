// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clip_widget_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$ClipOvalModifierSpec on WidgetModifierSpec<ClipOvalModifierSpec> {
  static ClipOvalModifierSpec from(MixData mix) {
    return mix.attributeOf<ClipOvalModifierAttribute>()?.resolve(mix) ??
        const ClipOvalModifierSpec();
  }

  /// {@template clip_oval_modifier_spec_of}
  /// Retrieves the [ClipOvalModifierSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [ClipOvalModifierSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [ClipOvalModifierSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final clipOvalModifierSpec = ClipOvalModifierSpec.of(context);
  /// ```
  /// {@endtemplate}
  static ClipOvalModifierSpec of(BuildContext context) {
    return _$ClipOvalModifierSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [ClipOvalModifierSpec] but with the given fields
  /// replaced with the new values.
  @override
  ClipOvalModifierSpec copyWith({
    CustomClipper<Rect>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipOvalModifierSpec(
      clipper: clipper ?? _$this.clipper,
      clipBehavior: clipBehavior ?? _$this.clipBehavior,
    );
  }

  /// Linearly interpolates between this [ClipOvalModifierSpec] and another [ClipOvalModifierSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [ClipOvalModifierSpec] is returned. When [t] is 1.0, the [other] [ClipOvalModifierSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [ClipOvalModifierSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [ClipOvalModifierSpec] instance.
  ///
  /// The interpolation is performed on each property of the [ClipOvalModifierSpec] using the appropriate
  /// interpolation method:
  ///

  /// For [clipper] and [clipBehavior], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [ClipOvalModifierSpec] is used. Otherwise, the value
  /// from the [other] [ClipOvalModifierSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [ClipOvalModifierSpec] configurations.
  @override
  ClipOvalModifierSpec lerp(ClipOvalModifierSpec? other, double t) {
    if (other == null) return _$this;

    return ClipOvalModifierSpec(
      clipper: t < 0.5 ? _$this.clipper : other.clipper,
      clipBehavior: t < 0.5 ? _$this.clipBehavior : other.clipBehavior,
    );
  }

  /// The list of properties that constitute the state of this [ClipOvalModifierSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ClipOvalModifierSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.clipper,
        _$this.clipBehavior,
      ];

  ClipOvalModifierSpec get _$this => this as ClipOvalModifierSpec;
}

/// Represents the attributes of a [ClipOvalModifierSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [ClipOvalModifierSpec].
///
/// Use this class to configure the attributes of a [ClipOvalModifierSpec] and pass it to
/// the [ClipOvalModifierSpec] constructor.
final class ClipOvalModifierAttribute
    extends WidgetModifierSpecAttribute<ClipOvalModifierSpec>
    with Diagnosticable {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipOvalModifierAttribute({
    this.clipper,
    this.clipBehavior,
  });

  /// Resolves to [ClipOvalModifierSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final clipOvalModifierSpec = ClipOvalModifierAttribute(...).resolve(mix);
  /// ```
  @override
  ClipOvalModifierSpec resolve(MixData mix) {
    return ClipOvalModifierSpec(
      clipper: clipper,
      clipBehavior: clipBehavior,
    );
  }

  /// Merges the properties of this [ClipOvalModifierAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [ClipOvalModifierAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  ClipOvalModifierAttribute merge(ClipOvalModifierAttribute? other) {
    if (other == null) return this;

    return ClipOvalModifierAttribute(
      clipper: other.clipper ?? clipper,
      clipBehavior: other.clipBehavior ?? clipBehavior,
    );
  }

  /// The list of properties that constitute the state of this [ClipOvalModifierAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ClipOvalModifierAttribute] instances for equality.
  @override
  List<Object?> get props => [
        clipper,
        clipBehavior,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.addUsingDefault('clipper', clipper);
    properties.addUsingDefault('clipBehavior', clipBehavior);
  }
}

/// A tween that interpolates between two [ClipOvalModifierSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [ClipOvalModifierSpec] specifications.
class ClipOvalModifierSpecTween extends Tween<ClipOvalModifierSpec?> {
  ClipOvalModifierSpecTween({
    super.begin,
    super.end,
  });

  @override
  ClipOvalModifierSpec lerp(double t) {
    if (begin == null && end == null) return const ClipOvalModifierSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$ClipRectModifierSpec on WidgetModifierSpec<ClipRectModifierSpec> {
  static ClipRectModifierSpec from(MixData mix) {
    return mix.attributeOf<ClipRectModifierAttribute>()?.resolve(mix) ??
        const ClipRectModifierSpec();
  }

  /// {@template clip_rect_modifier_spec_of}
  /// Retrieves the [ClipRectModifierSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [ClipRectModifierSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [ClipRectModifierSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final clipRectModifierSpec = ClipRectModifierSpec.of(context);
  /// ```
  /// {@endtemplate}
  static ClipRectModifierSpec of(BuildContext context) {
    return _$ClipRectModifierSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [ClipRectModifierSpec] but with the given fields
  /// replaced with the new values.
  @override
  ClipRectModifierSpec copyWith({
    CustomClipper<Rect>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipRectModifierSpec(
      clipper: clipper ?? _$this.clipper,
      clipBehavior: clipBehavior ?? _$this.clipBehavior,
    );
  }

  /// Linearly interpolates between this [ClipRectModifierSpec] and another [ClipRectModifierSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [ClipRectModifierSpec] is returned. When [t] is 1.0, the [other] [ClipRectModifierSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [ClipRectModifierSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [ClipRectModifierSpec] instance.
  ///
  /// The interpolation is performed on each property of the [ClipRectModifierSpec] using the appropriate
  /// interpolation method:
  ///

  /// For [clipper] and [clipBehavior], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [ClipRectModifierSpec] is used. Otherwise, the value
  /// from the [other] [ClipRectModifierSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [ClipRectModifierSpec] configurations.
  @override
  ClipRectModifierSpec lerp(ClipRectModifierSpec? other, double t) {
    if (other == null) return _$this;

    return ClipRectModifierSpec(
      clipper: t < 0.5 ? _$this.clipper : other.clipper,
      clipBehavior: t < 0.5 ? _$this.clipBehavior : other.clipBehavior,
    );
  }

  /// The list of properties that constitute the state of this [ClipRectModifierSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ClipRectModifierSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.clipper,
        _$this.clipBehavior,
      ];

  ClipRectModifierSpec get _$this => this as ClipRectModifierSpec;
}

/// Represents the attributes of a [ClipRectModifierSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [ClipRectModifierSpec].
///
/// Use this class to configure the attributes of a [ClipRectModifierSpec] and pass it to
/// the [ClipRectModifierSpec] constructor.
final class ClipRectModifierAttribute
    extends WidgetModifierSpecAttribute<ClipRectModifierSpec>
    with Diagnosticable {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipRectModifierAttribute({
    this.clipper,
    this.clipBehavior,
  });

  /// Resolves to [ClipRectModifierSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final clipRectModifierSpec = ClipRectModifierAttribute(...).resolve(mix);
  /// ```
  @override
  ClipRectModifierSpec resolve(MixData mix) {
    return ClipRectModifierSpec(
      clipper: clipper,
      clipBehavior: clipBehavior,
    );
  }

  /// Merges the properties of this [ClipRectModifierAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [ClipRectModifierAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  ClipRectModifierAttribute merge(ClipRectModifierAttribute? other) {
    if (other == null) return this;

    return ClipRectModifierAttribute(
      clipper: other.clipper ?? clipper,
      clipBehavior: other.clipBehavior ?? clipBehavior,
    );
  }

  /// The list of properties that constitute the state of this [ClipRectModifierAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ClipRectModifierAttribute] instances for equality.
  @override
  List<Object?> get props => [
        clipper,
        clipBehavior,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.addUsingDefault('clipper', clipper);
    properties.addUsingDefault('clipBehavior', clipBehavior);
  }
}

/// A tween that interpolates between two [ClipRectModifierSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [ClipRectModifierSpec] specifications.
class ClipRectModifierSpecTween extends Tween<ClipRectModifierSpec?> {
  ClipRectModifierSpecTween({
    super.begin,
    super.end,
  });

  @override
  ClipRectModifierSpec lerp(double t) {
    if (begin == null && end == null) return const ClipRectModifierSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$ClipRRectModifierSpec on WidgetModifierSpec<ClipRRectModifierSpec> {
  static ClipRRectModifierSpec from(MixData mix) {
    return mix.attributeOf<ClipRRectModifierAttribute>()?.resolve(mix) ??
        const ClipRRectModifierSpec();
  }

  /// {@template clip_r_rect_modifier_spec_of}
  /// Retrieves the [ClipRRectModifierSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [ClipRRectModifierSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [ClipRRectModifierSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final clipRRectModifierSpec = ClipRRectModifierSpec.of(context);
  /// ```
  /// {@endtemplate}
  static ClipRRectModifierSpec of(BuildContext context) {
    return _$ClipRRectModifierSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [ClipRRectModifierSpec] but with the given fields
  /// replaced with the new values.
  @override
  ClipRRectModifierSpec copyWith({
    BorderRadiusGeometry? borderRadius,
    CustomClipper<RRect>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipRRectModifierSpec(
      borderRadius: borderRadius ?? _$this.borderRadius,
      clipper: clipper ?? _$this.clipper,
      clipBehavior: clipBehavior ?? _$this.clipBehavior,
    );
  }

  /// Linearly interpolates between this [ClipRRectModifierSpec] and another [ClipRRectModifierSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [ClipRRectModifierSpec] is returned. When [t] is 1.0, the [other] [ClipRRectModifierSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [ClipRRectModifierSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [ClipRRectModifierSpec] instance.
  ///
  /// The interpolation is performed on each property of the [ClipRRectModifierSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [BorderRadiusGeometry.lerp] for [borderRadius].

  /// For [clipper] and [clipBehavior], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [ClipRRectModifierSpec] is used. Otherwise, the value
  /// from the [other] [ClipRRectModifierSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [ClipRRectModifierSpec] configurations.
  @override
  ClipRRectModifierSpec lerp(ClipRRectModifierSpec? other, double t) {
    if (other == null) return _$this;

    return ClipRRectModifierSpec(
      borderRadius:
          BorderRadiusGeometry.lerp(_$this.borderRadius, other.borderRadius, t),
      clipper: t < 0.5 ? _$this.clipper : other.clipper,
      clipBehavior: t < 0.5 ? _$this.clipBehavior : other.clipBehavior,
    );
  }

  /// The list of properties that constitute the state of this [ClipRRectModifierSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ClipRRectModifierSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.borderRadius,
        _$this.clipper,
        _$this.clipBehavior,
      ];

  ClipRRectModifierSpec get _$this => this as ClipRRectModifierSpec;
}

/// Represents the attributes of a [ClipRRectModifierSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [ClipRRectModifierSpec].
///
/// Use this class to configure the attributes of a [ClipRRectModifierSpec] and pass it to
/// the [ClipRRectModifierSpec] constructor.
final class ClipRRectModifierAttribute
    extends WidgetModifierSpecAttribute<ClipRRectModifierSpec>
    with Diagnosticable {
  final BorderRadiusGeometryDto? borderRadius;
  final CustomClipper<RRect>? clipper;
  final Clip? clipBehavior;

  const ClipRRectModifierAttribute({
    this.borderRadius,
    this.clipper,
    this.clipBehavior,
  });

  /// Resolves to [ClipRRectModifierSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final clipRRectModifierSpec = ClipRRectModifierAttribute(...).resolve(mix);
  /// ```
  @override
  ClipRRectModifierSpec resolve(MixData mix) {
    return ClipRRectModifierSpec(
      borderRadius: borderRadius?.resolve(mix),
      clipper: clipper,
      clipBehavior: clipBehavior,
    );
  }

  /// Merges the properties of this [ClipRRectModifierAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [ClipRRectModifierAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  ClipRRectModifierAttribute merge(ClipRRectModifierAttribute? other) {
    if (other == null) return this;

    return ClipRRectModifierAttribute(
      borderRadius:
          borderRadius?.merge(other.borderRadius) ?? other.borderRadius,
      clipper: other.clipper ?? clipper,
      clipBehavior: other.clipBehavior ?? clipBehavior,
    );
  }

  /// The list of properties that constitute the state of this [ClipRRectModifierAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ClipRRectModifierAttribute] instances for equality.
  @override
  List<Object?> get props => [
        borderRadius,
        clipper,
        clipBehavior,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.addUsingDefault('borderRadius', borderRadius);
    properties.addUsingDefault('clipper', clipper);
    properties.addUsingDefault('clipBehavior', clipBehavior);
  }
}

/// A tween that interpolates between two [ClipRRectModifierSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [ClipRRectModifierSpec] specifications.
class ClipRRectModifierSpecTween extends Tween<ClipRRectModifierSpec?> {
  ClipRRectModifierSpecTween({
    super.begin,
    super.end,
  });

  @override
  ClipRRectModifierSpec lerp(double t) {
    if (begin == null && end == null) return const ClipRRectModifierSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$ClipPathModifierSpec on WidgetModifierSpec<ClipPathModifierSpec> {
  static ClipPathModifierSpec from(MixData mix) {
    return mix.attributeOf<ClipPathModifierAttribute>()?.resolve(mix) ??
        const ClipPathModifierSpec();
  }

  /// {@template clip_path_modifier_spec_of}
  /// Retrieves the [ClipPathModifierSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [ClipPathModifierSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [ClipPathModifierSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final clipPathModifierSpec = ClipPathModifierSpec.of(context);
  /// ```
  /// {@endtemplate}
  static ClipPathModifierSpec of(BuildContext context) {
    return _$ClipPathModifierSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [ClipPathModifierSpec] but with the given fields
  /// replaced with the new values.
  @override
  ClipPathModifierSpec copyWith({
    CustomClipper<Path>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipPathModifierSpec(
      clipper: clipper ?? _$this.clipper,
      clipBehavior: clipBehavior ?? _$this.clipBehavior,
    );
  }

  /// Linearly interpolates between this [ClipPathModifierSpec] and another [ClipPathModifierSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [ClipPathModifierSpec] is returned. When [t] is 1.0, the [other] [ClipPathModifierSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [ClipPathModifierSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [ClipPathModifierSpec] instance.
  ///
  /// The interpolation is performed on each property of the [ClipPathModifierSpec] using the appropriate
  /// interpolation method:
  ///

  /// For [clipper] and [clipBehavior], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [ClipPathModifierSpec] is used. Otherwise, the value
  /// from the [other] [ClipPathModifierSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [ClipPathModifierSpec] configurations.
  @override
  ClipPathModifierSpec lerp(ClipPathModifierSpec? other, double t) {
    if (other == null) return _$this;

    return ClipPathModifierSpec(
      clipper: t < 0.5 ? _$this.clipper : other.clipper,
      clipBehavior: t < 0.5 ? _$this.clipBehavior : other.clipBehavior,
    );
  }

  /// The list of properties that constitute the state of this [ClipPathModifierSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ClipPathModifierSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.clipper,
        _$this.clipBehavior,
      ];

  ClipPathModifierSpec get _$this => this as ClipPathModifierSpec;
}

/// Represents the attributes of a [ClipPathModifierSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [ClipPathModifierSpec].
///
/// Use this class to configure the attributes of a [ClipPathModifierSpec] and pass it to
/// the [ClipPathModifierSpec] constructor.
final class ClipPathModifierAttribute
    extends WidgetModifierSpecAttribute<ClipPathModifierSpec>
    with Diagnosticable {
  final CustomClipper<Path>? clipper;
  final Clip? clipBehavior;

  const ClipPathModifierAttribute({
    this.clipper,
    this.clipBehavior,
  });

  /// Resolves to [ClipPathModifierSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final clipPathModifierSpec = ClipPathModifierAttribute(...).resolve(mix);
  /// ```
  @override
  ClipPathModifierSpec resolve(MixData mix) {
    return ClipPathModifierSpec(
      clipper: clipper,
      clipBehavior: clipBehavior,
    );
  }

  /// Merges the properties of this [ClipPathModifierAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [ClipPathModifierAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  ClipPathModifierAttribute merge(ClipPathModifierAttribute? other) {
    if (other == null) return this;

    return ClipPathModifierAttribute(
      clipper: other.clipper ?? clipper,
      clipBehavior: other.clipBehavior ?? clipBehavior,
    );
  }

  /// The list of properties that constitute the state of this [ClipPathModifierAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ClipPathModifierAttribute] instances for equality.
  @override
  List<Object?> get props => [
        clipper,
        clipBehavior,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.addUsingDefault('clipper', clipper);
    properties.addUsingDefault('clipBehavior', clipBehavior);
  }
}

/// A tween that interpolates between two [ClipPathModifierSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [ClipPathModifierSpec] specifications.
class ClipPathModifierSpecTween extends Tween<ClipPathModifierSpec?> {
  ClipPathModifierSpecTween({
    super.begin,
    super.end,
  });

  @override
  ClipPathModifierSpec lerp(double t) {
    if (begin == null && end == null) return const ClipPathModifierSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$ClipTriangleModifierSpec
    on WidgetModifierSpec<ClipTriangleModifierSpec> {
  static ClipTriangleModifierSpec from(MixData mix) {
    return mix.attributeOf<ClipTriangleModifierAttribute>()?.resolve(mix) ??
        const ClipTriangleModifierSpec();
  }

  /// {@template clip_triangle_modifier_spec_of}
  /// Retrieves the [ClipTriangleModifierSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [ClipTriangleModifierSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [ClipTriangleModifierSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final clipTriangleModifierSpec = ClipTriangleModifierSpec.of(context);
  /// ```
  /// {@endtemplate}
  static ClipTriangleModifierSpec of(BuildContext context) {
    return _$ClipTriangleModifierSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [ClipTriangleModifierSpec] but with the given fields
  /// replaced with the new values.
  @override
  ClipTriangleModifierSpec copyWith({
    Clip? clipBehavior,
  }) {
    return ClipTriangleModifierSpec(
      clipBehavior: clipBehavior ?? _$this.clipBehavior,
    );
  }

  /// Linearly interpolates between this [ClipTriangleModifierSpec] and another [ClipTriangleModifierSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [ClipTriangleModifierSpec] is returned. When [t] is 1.0, the [other] [ClipTriangleModifierSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [ClipTriangleModifierSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [ClipTriangleModifierSpec] instance.
  ///
  /// The interpolation is performed on each property of the [ClipTriangleModifierSpec] using the appropriate
  /// interpolation method:
  ///

  /// For [clipBehavior], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [ClipTriangleModifierSpec] is used. Otherwise, the value
  /// from the [other] [ClipTriangleModifierSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [ClipTriangleModifierSpec] configurations.
  @override
  ClipTriangleModifierSpec lerp(ClipTriangleModifierSpec? other, double t) {
    if (other == null) return _$this;

    return ClipTriangleModifierSpec(
      clipBehavior: t < 0.5 ? _$this.clipBehavior : other.clipBehavior,
    );
  }

  /// The list of properties that constitute the state of this [ClipTriangleModifierSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ClipTriangleModifierSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.clipBehavior,
      ];

  ClipTriangleModifierSpec get _$this => this as ClipTriangleModifierSpec;
}

/// Represents the attributes of a [ClipTriangleModifierSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [ClipTriangleModifierSpec].
///
/// Use this class to configure the attributes of a [ClipTriangleModifierSpec] and pass it to
/// the [ClipTriangleModifierSpec] constructor.
final class ClipTriangleModifierAttribute
    extends WidgetModifierSpecAttribute<ClipTriangleModifierSpec>
    with Diagnosticable {
  final Clip? clipBehavior;

  const ClipTriangleModifierAttribute({
    this.clipBehavior,
  });

  /// Resolves to [ClipTriangleModifierSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final clipTriangleModifierSpec = ClipTriangleModifierAttribute(...).resolve(mix);
  /// ```
  @override
  ClipTriangleModifierSpec resolve(MixData mix) {
    return ClipTriangleModifierSpec(
      clipBehavior: clipBehavior,
    );
  }

  /// Merges the properties of this [ClipTriangleModifierAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [ClipTriangleModifierAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  ClipTriangleModifierAttribute merge(ClipTriangleModifierAttribute? other) {
    if (other == null) return this;

    return ClipTriangleModifierAttribute(
      clipBehavior: other.clipBehavior ?? clipBehavior,
    );
  }

  /// The list of properties that constitute the state of this [ClipTriangleModifierAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ClipTriangleModifierAttribute] instances for equality.
  @override
  List<Object?> get props => [
        clipBehavior,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.addUsingDefault('clipBehavior', clipBehavior);
  }
}

/// A tween that interpolates between two [ClipTriangleModifierSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [ClipTriangleModifierSpec] specifications.
class ClipTriangleModifierSpecTween extends Tween<ClipTriangleModifierSpec?> {
  ClipTriangleModifierSpecTween({
    super.begin,
    super.end,
  });

  @override
  ClipTriangleModifierSpec lerp(double t) {
    if (begin == null && end == null) return const ClipTriangleModifierSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
