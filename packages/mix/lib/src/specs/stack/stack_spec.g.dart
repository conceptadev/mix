// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stack_spec.dart';

// **************************************************************************
// Generator: SpecDefinitionBuilder
// **************************************************************************

base mixin _$StackSpec on Spec<StackSpec> {
  static StackSpec from(MixData mix) {
    return mix.attributeOf<StackSpecAttribute>()?.resolve(mix) ??
        const StackSpec();
  }

  /// {@template stack_spec_of}
  /// Retrieves the [StackSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [StackSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [StackSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final stackSpec = StackSpec.of(context);
  /// ```
  /// {@endtemplate}
  static StackSpec of(BuildContext context) {
    return _$StackSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [StackSpec] but with the given fields
  /// replaced with the new values.
  @override
  StackSpec copyWith({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
    AnimatedData? animated,
  }) {
    return StackSpec(
      alignment: alignment ?? _$this.alignment,
      fit: fit ?? _$this.fit,
      textDirection: textDirection ?? _$this.textDirection,
      clipBehavior: clipBehavior ?? _$this.clipBehavior,
      animated: animated ?? _$this.animated,
    );
  }

  /// Linearly interpolates between this [StackSpec] and another [StackSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [StackSpec] is returned. When [t] is 1.0, the [other] [StackSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [StackSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [StackSpec] instance.
  ///
  /// The interpolation is performed on each property of the [StackSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [AlignmentGeometry.lerp] for [alignment].

  /// For [fit] and [textDirection] and [clipBehavior] and [animated], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [StackSpec] is used. Otherwise, the value
  /// from the [other] [StackSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [StackSpec] configurations.
  @override
  StackSpec lerp(StackSpec? other, double t) {
    if (other == null) return _$this;

    return StackSpec(
      alignment:
          AlignmentGeometry.lerp(_$this.alignment, other._$this.alignment, t),
      fit: t < 0.5 ? _$this.fit : other._$this.fit,
      textDirection:
          t < 0.5 ? _$this.textDirection : other._$this.textDirection,
      clipBehavior: t < 0.5 ? _$this.clipBehavior : other._$this.clipBehavior,
      animated: t < 0.5 ? _$this.animated : other._$this.animated,
    );
  }

  /// The list of properties that constitute the state of this [StackSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [StackSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.alignment,
        _$this.fit,
        _$this.textDirection,
        _$this.clipBehavior,
        _$this.animated,
      ];

  StackSpec get _$this => this as StackSpec;
}

/// Represents the attributes of a [StackSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [StackSpec].
///
/// Use this class to configure the attributes of a [StackSpec] and pass it to
/// the [StackSpec] constructor.
final class StackSpecAttribute extends SpecAttribute<StackSpec> {
  final AlignmentGeometry? alignment;
  final StackFit? fit;
  final TextDirection? textDirection;
  final Clip? clipBehavior;

  const StackSpecAttribute({
    this.alignment,
    this.fit,
    this.textDirection,
    this.clipBehavior,
    super.animated,
  });

  /// Resolves to [StackSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final stackSpec = StackSpecAttribute(...).resolve(mix);
  /// ```
  @override
  StackSpec resolve(MixData mix) {
    return StackSpec(
      alignment: alignment,
      fit: fit,
      textDirection: textDirection,
      clipBehavior: clipBehavior,
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  /// Merges the properties of this [StackSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [StackSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  StackSpecAttribute merge(StackSpecAttribute? other) {
    if (other == null) return this;

    return StackSpecAttribute(
      alignment: other.alignment ?? alignment,
      fit: other.fit ?? fit,
      textDirection: other.textDirection ?? textDirection,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [StackSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [StackSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        alignment,
        fit,
        textDirection,
        clipBehavior,
        animated,
      ];
}

/// Utility class for configuring [StackSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [StackSpecAttribute].
/// Use the methods of this class to configure specific properties of a [StackSpecAttribute].
base class StackSpecUtility<T extends Attribute>
    extends SpecUtility<T, StackSpecAttribute> {
  /// Utility for defining [StackSpecAttribute.alignment]
  late final alignment = AlignmentGeometryUtility((v) => only(alignment: v));

  /// Utility for defining [StackSpecAttribute.fit]
  late final fit = StackFitUtility((v) => only(fit: v));

  /// Utility for defining [StackSpecAttribute.textDirection]
  late final textDirection =
      TextDirectionUtility((v) => only(textDirection: v));

  /// Utility for defining [StackSpecAttribute.clipBehavior]
  late final clipBehavior = ClipUtility((v) => only(clipBehavior: v));

  /// Utility for defining [StackSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  StackSpecUtility(super.builder);

  static final self = StackSpecUtility((v) => v);

  /// Returns a new [StackSpecAttribute] with the specified properties.
  @override
  T only({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
    AnimatedDataDto? animated,
  }) {
    return builder(StackSpecAttribute(
      alignment: alignment,
      fit: fit,
      textDirection: textDirection,
      clipBehavior: clipBehavior,
      animated: animated,
    ));
  }
}

/// A tween that interpolates between two [StackSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [StackSpec] specifications.
class StackSpecTween extends Tween<StackSpec?> {
  StackSpecTween({
    super.begin,
    super.end,
  });

  @override
  StackSpec lerp(double t) {
    if (begin == null && end == null) return const StackSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
