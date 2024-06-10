// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flex_spec.dart';

// **************************************************************************
// Generator: SpecDefinitionBuilder
// **************************************************************************

/// Utility class for configuring [FlexDefAttribute] properties.
///
/// This class provides methods to set individual properties of a [FlexDefAttribute].
///
/// Use the methods of this class to configure specific properties of a [FlexDefAttribute].
class FlexDefUtility<T extends Attribute>
    extends SpecUtility<T, FlexDefAttribute> {
  FlexDefUtility(super.builder);

  /// Utility for defining [FlexDefAttribute.crossAxisAlignment]
  late final crossAxisAlignment =
      CrossAxisAlignmentUtility((v) => only(crossAxisAlignment: v));

  /// Utility for defining [FlexDefAttribute.mainAxisAlignment]
  late final mainAxisAlignment =
      MainAxisAlignmentUtility((v) => only(mainAxisAlignment: v));

  /// Utility for defining [FlexDefAttribute.mainAxisSize]
  late final mainAxisSize = MainAxisSizeUtility((v) => only(mainAxisSize: v));

  /// Utility for defining [FlexDefAttribute.verticalDirection]
  late final verticalDirection =
      VerticalDirectionUtility((v) => only(verticalDirection: v));

  /// Utility for defining [FlexDefAttribute.direction]
  late final direction = AxisUtility((v) => only(direction: v));

  /// Utility for defining [FlexDefAttribute.textDirection]
  late final textDirection =
      TextDirectionUtility((v) => only(textDirection: v));

  /// Utility for defining [FlexDefAttribute.textBaseline]
  late final textBaseline = TextBaselineUtility((v) => only(textBaseline: v));

  /// Utility for defining [FlexDefAttribute.clipBehavior]
  late final clipBehavior = ClipUtility((v) => only(clipBehavior: v));

  /// Utility for defining [FlexDefAttribute.gap]
  late final gap = DoubleUtility((v) => only(gap: v));

  /// Utility for defining [FlexDefAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  /// Returns a new [FlexDefAttribute] with the specified properties.
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
    return builder(
      FlexDefAttribute(
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
      ),
    );
  }
}

mixin FlexDefMixable on Spec<FlexDef> {
  /// Retrieves the [FlexDef] from a MixData.
  static FlexDef from(MixData mix) {
    return mix.attributeOf<FlexDefAttribute>()?.resolve(mix) ?? const FlexDef();
  }

  /// Retrieves the [FlexDef] from the nearest [Mix] ancestor.
  ///
  /// If no ancestor is found, returns [FlexDef].
  static FlexDef of(BuildContext context) {
    return FlexDefMixable.from(Mix.of(context));
  }

  /// Creates a copy of this [FlexDef] but with the given fields
  /// replaced with the new values.
  @override
  FlexDef copyWith({
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
    return FlexDef(
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
  FlexDef lerp(
    FlexDef? other,
    double t,
  ) {
    if (other == null) return _$this;

    return FlexDef(
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
      gap: _lerpDouble(
        _$this.gap,
        other._$this.gap,
        t,
      ),
      animated: t < 0.5 ? _$this.animated : other._$this.animated,
    );
  }

  /// The list of properties that constitute the state of this [FlexDef].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [FlexDef] instances for equality.
  @override
  List<Object?> get props {
    return [
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
  }

  FlexDef get _$this => this as FlexDef;
  double? _lerpDouble(
    num? a,
    num? b,
    double t,
  ) {
    return ((1 - t) * (a ?? 0) + t * (b ?? 0));
  }
}

/// Represents the attributes of a [FlexDef].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [FlexDef].
///
/// Use this class to configure the attributes of a [FlexDef] and pass it to
/// the [FlexDef] constructor.
class FlexDefAttribute extends SpecAttribute<FlexDef> {
  const FlexDefAttribute({
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

  final CrossAxisAlignment? crossAxisAlignment;

  final MainAxisAlignment? mainAxisAlignment;

  final MainAxisSize? mainAxisSize;

  final VerticalDirection? verticalDirection;

  final Axis? direction;

  final TextDirection? textDirection;

  final TextBaseline? textBaseline;

  final Clip? clipBehavior;

  final double? gap;

  @override
  FlexDef resolve(MixData mix) {
    return FlexDef(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      verticalDirection: verticalDirection,
      direction: direction,
      textDirection: textDirection,
      textBaseline: textBaseline,
      clipBehavior: clipBehavior,
      gap: gap,
      animated: animated?.resolve(mix),
    );
  }

  @override
  FlexDefAttribute merge(FlexDefAttribute? other) {
    if (other == null) return this;

    return FlexDefAttribute(
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

  /// The list of properties that constitute the state of this [FlexDefAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [FlexDefAttribute] instances for equality.
  @override
  List<Object?> get props {
    return [
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
}

/// A tween that interpolates between two [FlexDef] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [FlexDef] specifications.
class FlexDefTween extends Tween<FlexDef?> {
  FlexDefTween({
    super.begin,
    super.end,
  });

  @override
  FlexDef lerp(double t) {
    if (begin == null && end == null) return const FlexDef();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
