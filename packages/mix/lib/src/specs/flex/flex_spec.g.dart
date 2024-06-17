// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flex_spec.dart';

// **************************************************************************
// Generator: SpecDefinitionBuilder
// **************************************************************************

base mixin _$FlexSpec on Spec<FlexSpec> {
  static FlexSpec from(MixData mix) {
    return mix.attributeOf<FlexSpecAttribute>()?.resolve(mix) ??
        const FlexSpec();
  }

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

  @override
  FlexSpec lerp(FlexSpec? other, double t) {
    if (other == null) return _$this;

    return FlexSpec(
      crossAxisAlignment:
          t < 0.5 ? _$this.crossAxisAlignment : other._$this.crossAxisAlignment,
      mainAxisAlignment:
          t < 0.5 ? _$this.mainAxisAlignment : other._$this.mainAxisAlignment,
      mainAxisSize: t < 0.5 ? _$this.mainAxisSize : other._$this.mainAxisSize,
      verticalDirection:
          t < 0.5 ? _$this.verticalDirection : other._$this.verticalDirection,
      direction: t < 0.5 ? _$this.direction : other._$this.direction,
      textDirection:
          t < 0.5 ? _$this.textDirection : other._$this.textDirection,
      textBaseline: t < 0.5 ? _$this.textBaseline : other._$this.textBaseline,
      clipBehavior: t < 0.5 ? _$this.clipBehavior : other._$this.clipBehavior,
      gap: _$lerpDouble(_$this.gap, other._$this.gap, t),
      animated: t < 0.5 ? _$this.animated : other._$this.animated,
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
final class FlexSpecAttribute extends SpecAttribute<FlexSpec> {
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
///
/// Use the methods of this class to configure specific properties of a [FlexSpecAttribute].
final class FlexSpecUtility<T extends Attribute>
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

double? _$lerpDouble(num? a, num? b, double t) {
  if (a == b || (a?.isNaN ?? false) && (b?.isNaN ?? false)) {
    return a?.toDouble();
  }
  a ??= 0.0;
  b ??= 0.0;
  return a * (1.0 - t) + b * t;
}
