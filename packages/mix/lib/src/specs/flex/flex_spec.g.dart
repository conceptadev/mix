// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flex_spec.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

base mixin _$FlexSpec on Spec<FlexSpec> {
  static FlexSpec from(MixData mix) {
    return mix.attributeOf<FlexSpecAttribute>()?.resolve(mix) ??
        const FlexSpec();
  }

  /// {@template flex_spec_of}
  /// Retrieves the [FlexSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [FlexSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [FlexSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final flexSpec = FlexSpec.of(context);
  /// ```
  /// {@endtemplate}
  static FlexSpec of(BuildContext context) {
    return _$FlexSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [FlexSpec] but with the given fields
  /// replaced with the new values.
  @override
  FlexSpec copyWith({
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
    VerticalDirection? verticalDirection,
    Axis? direction,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
    Clip? clipBehavior,
    double? gap,
    AnimatedData? animated,
  }) {
    return FlexSpec(
      crossAxisAlignment: crossAxisAlignment ?? _$this.crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment ?? _$this.mainAxisAlignment,
      mainAxisSize: mainAxisSize ?? _$this.mainAxisSize,
      verticalDirection: verticalDirection ?? _$this.verticalDirection,
      direction: direction ?? _$this.direction,
      textDirection: textDirection ?? _$this.textDirection,
      textBaseline: textBaseline ?? _$this.textBaseline,
      clipBehavior: clipBehavior ?? _$this.clipBehavior,
      gap: gap ?? _$this.gap,
      animated: animated ?? _$this.animated,
    );
  }

  /// Linearly interpolates between this [FlexSpec] and another [FlexSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [FlexSpec] is returned. When [t] is 1.0, the [other] [FlexSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [FlexSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [FlexSpec] instance.
  ///
  /// The interpolation is performed on each property of the [FlexSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [MixHelpers.lerpDouble] for [gap].

  /// For [crossAxisAlignment] and [mainAxisAlignment] and [mainAxisSize] and [verticalDirection] and [direction] and [textDirection] and [textBaseline] and [clipBehavior] and [animated], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [FlexSpec] is used. Otherwise, the value
  /// from the [other] [FlexSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [FlexSpec] configurations.
  @override
  FlexSpec lerp(FlexSpec? other, double t) {
    if (other == null) return _$this;

    return FlexSpec(
      crossAxisAlignment:
          t < 0.5 ? _$this.crossAxisAlignment : other.crossAxisAlignment,
      mainAxisAlignment:
          t < 0.5 ? _$this.mainAxisAlignment : other.mainAxisAlignment,
      mainAxisSize: t < 0.5 ? _$this.mainAxisSize : other.mainAxisSize,
      verticalDirection:
          t < 0.5 ? _$this.verticalDirection : other.verticalDirection,
      direction: t < 0.5 ? _$this.direction : other.direction,
      textDirection: t < 0.5 ? _$this.textDirection : other.textDirection,
      textBaseline: t < 0.5 ? _$this.textBaseline : other.textBaseline,
      clipBehavior: t < 0.5 ? _$this.clipBehavior : other.clipBehavior,
      gap: MixHelpers.lerpDouble(_$this.gap, other.gap, t),
      animated: t < 0.5 ? _$this.animated : other.animated,
    );
  }

  /// The list of properties that constitute the state of this [FlexSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [FlexSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.crossAxisAlignment,
        _$this.mainAxisAlignment,
        _$this.mainAxisSize,
        _$this.verticalDirection,
        _$this.direction,
        _$this.textDirection,
        _$this.textBaseline,
        _$this.clipBehavior,
        _$this.gap,
        _$this.animated,
      ];

  FlexSpec get _$this => this as FlexSpec;
}

/// Represents the attributes of a [FlexSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [FlexSpec].
///
/// Use this class to configure the attributes of a [FlexSpec] and pass it to
/// the [FlexSpec] constructor.
final class FlexSpecAttribute extends ModifiableSpecAttribute<FlexSpec> {
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final VerticalDirection? verticalDirection;
  final Axis? direction;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final Clip? clipBehavior;
  final double? gap;

  const FlexSpecAttribute({
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.verticalDirection,
    this.direction,
    this.textDirection,
    this.textBaseline,
    this.clipBehavior,
    this.gap,
    super.animated,
  });

  /// Resolves to [FlexSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final flexSpec = FlexSpecAttribute(...).resolve(mix);
  /// ```
  @override
  FlexSpec resolve(MixData mix) {
    return FlexSpec(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      verticalDirection: verticalDirection,
      direction: direction,
      textDirection: textDirection,
      textBaseline: textBaseline,
      clipBehavior: clipBehavior,
      gap: gap,
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  /// Merges the properties of this [FlexSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [FlexSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  FlexSpecAttribute merge(FlexSpecAttribute? other) {
    if (other == null) return this;

    return FlexSpecAttribute(
      crossAxisAlignment: other.crossAxisAlignment ?? crossAxisAlignment,
      mainAxisAlignment: other.mainAxisAlignment ?? mainAxisAlignment,
      mainAxisSize: other.mainAxisSize ?? mainAxisSize,
      verticalDirection: other.verticalDirection ?? verticalDirection,
      direction: other.direction ?? direction,
      textDirection: other.textDirection ?? textDirection,
      textBaseline: other.textBaseline ?? textBaseline,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      gap: other.gap ?? gap,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [FlexSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [FlexSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        crossAxisAlignment,
        mainAxisAlignment,
        mainAxisSize,
        verticalDirection,
        direction,
        textDirection,
        textBaseline,
        clipBehavior,
        gap,
        animated,
      ];
}

/// Utility class for configuring [FlexSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [FlexSpecAttribute].
/// Use the methods of this class to configure specific properties of a [FlexSpecAttribute].
base class FlexSpecUtility<T extends Attribute>
    extends SpecUtility<T, FlexSpecAttribute> {
  /// Utility for defining [FlexSpecAttribute.crossAxisAlignment]
  late final crossAxisAlignment =
      CrossAxisAlignmentUtility((v) => only(crossAxisAlignment: v));

  /// Utility for defining [FlexSpecAttribute.mainAxisAlignment]
  late final mainAxisAlignment =
      MainAxisAlignmentUtility((v) => only(mainAxisAlignment: v));

  /// Utility for defining [FlexSpecAttribute.mainAxisSize]
  late final mainAxisSize = MainAxisSizeUtility((v) => only(mainAxisSize: v));

  /// Utility for defining [FlexSpecAttribute.verticalDirection]
  late final verticalDirection =
      VerticalDirectionUtility((v) => only(verticalDirection: v));

  /// Utility for defining [FlexSpecAttribute.direction]
  late final direction = AxisUtility((v) => only(direction: v));

  /// Utility for defining [FlexSpecAttribute.direction.horizontal]
  late final row = direction.horizontal;

  /// Utility for defining [FlexSpecAttribute.direction.vertical]
  late final column = direction.vertical;

  /// Utility for defining [FlexSpecAttribute.textDirection]
  late final textDirection =
      TextDirectionUtility((v) => only(textDirection: v));

  /// Utility for defining [FlexSpecAttribute.textBaseline]
  late final textBaseline = TextBaselineUtility((v) => only(textBaseline: v));

  /// Utility for defining [FlexSpecAttribute.clipBehavior]
  late final clipBehavior = ClipUtility((v) => only(clipBehavior: v));

  /// Utility for defining [FlexSpecAttribute.gap]
  late final gap = SpacingSideUtility((v) => only(gap: v));

  /// Utility for defining [FlexSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  FlexSpecUtility(super.builder);

  static final self = FlexSpecUtility((v) => v);

  /// Returns a new [FlexSpecAttribute] with the specified properties.
  @override
  T only({
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
    VerticalDirection? verticalDirection,
    Axis? direction,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
    Clip? clipBehavior,
    double? gap,
    AnimatedDataDto? animated,
  }) {
    return builder(FlexSpecAttribute(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      verticalDirection: verticalDirection,
      direction: direction,
      textDirection: textDirection,
      textBaseline: textBaseline,
      clipBehavior: clipBehavior,
      gap: gap,
      animated: animated,
    ));
  }
}

/// A tween that interpolates between two [FlexSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [FlexSpec] specifications.
class FlexSpecTween extends Tween<FlexSpec?> {
  FlexSpecTween({
    super.begin,
    super.end,
  });

  @override
  FlexSpec lerp(double t) {
    if (begin == null && end == null) return const FlexSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
