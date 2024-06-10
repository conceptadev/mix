// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon_spec.dart';

// **************************************************************************
// Generator: SpecDefinitionBuilder
// **************************************************************************

/// Utility class for configuring [IconDefAttribute] properties.
///
/// This class provides methods to set individual properties of a [IconDefAttribute].
///
/// Use the methods of this class to configure specific properties of a [IconDefAttribute].
class IconDefUtility<T extends Attribute>
    extends SpecUtility<T, IconDefAttribute> {
  IconDefUtility(super.builder);

  /// Utility for defining [IconDefAttribute.color]
  late final color = ColorUtility((v) => only(color: v));

  /// Utility for defining [IconDefAttribute.size]
  late final size = DoubleUtility((v) => only(size: v));

  /// Utility for defining [IconDefAttribute.weight]
  late final weight = DoubleUtility((v) => only(weight: v));

  /// Utility for defining [IconDefAttribute.grade]
  late final grade = DoubleUtility((v) => only(grade: v));

  /// Utility for defining [IconDefAttribute.opticalSize]
  late final opticalSize = DoubleUtility((v) => only(opticalSize: v));

  /// Utility for defining [IconDefAttribute.shadows]
  late final shadows = ShadowListUtility((v) => only(shadows: v));

  /// Utility for defining [IconDefAttribute.textDirection]
  late final textDirection =
      TextDirectionUtility((v) => only(textDirection: v));

  /// Utility for defining [IconDefAttribute.applyTextScaling]
  late final applyTextScaling = BoolUtility((v) => only(applyTextScaling: v));

  /// Utility for defining [IconDefAttribute.fill]
  late final fill = DoubleUtility((v) => only(fill: v));

  /// Utility for defining [IconDefAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  /// Returns a new [IconDefAttribute] with the specified properties.
  @override
  T only({
    ColorDto? color,
    double? size,
    double? weight,
    double? grade,
    double? opticalSize,
    List<ShadowDto>? shadows,
    TextDirection? textDirection,
    bool? applyTextScaling,
    double? fill,
    AnimatedDataDto? animated,
  }) {
    return builder(
      IconDefAttribute(
        color: color,
        size: size,
        weight: weight,
        grade: grade,
        opticalSize: opticalSize,
        shadows: shadows,
        textDirection: textDirection,
        applyTextScaling: applyTextScaling,
        fill: fill,
        animated: animated,
      ),
    );
  }
}

mixin IconDefMixable on Spec<IconDef> {
  /// Retrieves the [IconDef] from a MixData.
  static IconDef from(MixData mix) {
    return mix.attributeOf<IconDefAttribute>()?.resolve(mix) ?? const IconDef();
  }

  /// Retrieves the [IconDef] from the nearest [Mix] ancestor.
  ///
  /// If no ancestor is found, returns [IconDef].
  static IconDef of(BuildContext context) {
    return IconDefMixable.from(Mix.of(context));
  }

  /// Creates a copy of this [IconDef] but with the given fields
  /// replaced with the new values.
  @override
  IconDef copyWith({
    Color? color,
    double? size,
    double? weight,
    double? grade,
    double? opticalSize,
    List<Shadow>? shadows,
    TextDirection? textDirection,
    bool? applyTextScaling,
    double? fill,
    AnimatedData? animated,
  }) {
    return IconDef(
      color: color ?? _$this.color,
      size: size ?? _$this.size,
      weight: weight ?? _$this.weight,
      grade: grade ?? _$this.grade,
      opticalSize: opticalSize ?? _$this.opticalSize,
      shadows: shadows ?? _$this.shadows,
      textDirection: textDirection ?? _$this.textDirection,
      applyTextScaling: applyTextScaling ?? _$this.applyTextScaling,
      fill: fill ?? _$this.fill,
      animated: animated ?? _$this.animated,
    );
  }

  @override
  IconDef lerp(
    IconDef? other,
    double t,
  ) {
    if (other == null) return _$this;

    return IconDef(
      color: t < 0.5 ? _$this.color : other._$this.color,
      size: _lerpDouble(
        _$this.size,
        other._$this.size,
        t,
      ),
      weight: _lerpDouble(
        _$this.weight,
        other._$this.weight,
        t,
      ),
      grade: _lerpDouble(
        _$this.grade,
        other._$this.grade,
        t,
      ),
      opticalSize: _lerpDouble(
        _$this.opticalSize,
        other._$this.opticalSize,
        t,
      ),
      shadows: t < 0.5 ? _$this.shadows : other._$this.shadows,
      textDirection:
          t < 0.5 ? _$this.textDirection : other._$this.textDirection,
      applyTextScaling:
          t < 0.5 ? _$this.applyTextScaling : other._$this.applyTextScaling,
      fill: _lerpDouble(
        _$this.fill,
        other._$this.fill,
        t,
      ),
      animated: t < 0.5 ? _$this.animated : other._$this.animated,
    );
  }

  /// The list of properties that constitute the state of this [IconDef].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [IconDef] instances for equality.
  @override
  List<Object?> get props {
    return [
      _$this.color,
      _$this.size,
      _$this.weight,
      _$this.grade,
      _$this.opticalSize,
      _$this.shadows,
      _$this.textDirection,
      _$this.applyTextScaling,
      _$this.fill,
      _$this.animated,
    ];
  }

  IconDef get _$this => this as IconDef;
  double? _lerpDouble(
    num? a,
    num? b,
    double t,
  ) {
    return ((1 - t) * (a ?? 0) + t * (b ?? 0));
  }
}

/// Represents the attributes of a [IconDef].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [IconDef].
///
/// Use this class to configure the attributes of a [IconDef] and pass it to
/// the [IconDef] constructor.
class IconDefAttribute extends SpecAttribute<IconDef> {
  const IconDefAttribute({
    this.color,
    this.size,
    this.weight,
    this.grade,
    this.opticalSize,
    this.shadows,
    this.textDirection,
    this.applyTextScaling,
    this.fill,
    super.animated,
  });

  final ColorDto? color;

  final double? size;

  final double? weight;

  final double? grade;

  final double? opticalSize;

  final List<ShadowDto>? shadows;

  final TextDirection? textDirection;

  final bool? applyTextScaling;

  final double? fill;

  @override
  IconDef resolve(MixData mix) {
    return IconDef(
      color: color?.resolve(mix),
      size: size,
      weight: weight,
      grade: grade,
      opticalSize: opticalSize,
      shadows: shadows?.map((e) => e.resolve(mix)).toList(),
      textDirection: textDirection,
      applyTextScaling: applyTextScaling,
      fill: fill,
      animated: animated?.resolve(mix),
    );
  }

  @override
  IconDefAttribute merge(IconDefAttribute? other) {
    if (other == null) return this;

    return IconDefAttribute(
      color: color?.merge(other.color) ?? other.color,
      size: other.size ?? size,
      weight: other.weight ?? weight,
      grade: other.grade ?? grade,
      opticalSize: other.opticalSize ?? opticalSize,
      shadows: Dto.mergeList(shadows, other.shadows),
      textDirection: other.textDirection ?? textDirection,
      applyTextScaling: other.applyTextScaling ?? applyTextScaling,
      fill: other.fill ?? fill,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [IconDefAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [IconDefAttribute] instances for equality.
  @override
  List<Object?> get props {
    return [
      color,
      size,
      weight,
      grade,
      opticalSize,
      shadows,
      textDirection,
      applyTextScaling,
      fill,
      animated,
    ];
  }
}

/// A tween that interpolates between two [IconDef] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [IconDef] specifications.
class IconDefTween extends Tween<IconDef?> {
  IconDefTween({
    super.begin,
    super.end,
  });

  @override
  IconDef lerp(double t) {
    if (begin == null && end == null) return const IconDef();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
