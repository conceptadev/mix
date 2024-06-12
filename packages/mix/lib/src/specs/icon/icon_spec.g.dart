// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon_spec.dart';

// **************************************************************************
// Generator: SpecDefinitionBuilder
// **************************************************************************

base mixin IconSpecMixable on Spec<IconSpec> {
  /// Retrieves the [IconSpec] from a MixData.
  static IconSpec from(MixData mix) {
    return mix.attributeOf<IconSpecAttribute>()?.resolve(mix) ??
        const IconSpec();
  }

  /// Retrieves the [IconSpec] from the nearest [Mix] ancestor.
  ///
  /// If no ancestor is found, returns [IconSpec].
  static IconSpec of(BuildContext context) {
    return IconSpecMixable.from(Mix.of(context));
  }

  /// Creates a copy of this [IconSpec] but with the given fields
  /// replaced with the new values.
  @override
  IconSpec copyWith({
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
    return IconSpec(
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
  IconSpec lerp(
    IconSpec? other,
    double t,
  ) {
    if (other == null) return _$this;

    return IconSpec(
      color: Color.lerp(
        _$this.color,
        other._$this.color,
        t,
      ),
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

  /// The list of properties that constitute the state of this [IconSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [IconSpec] instances for equality.
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

  IconSpec get _$this => this as IconSpec;
}

/// Represents the attributes of a [IconSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [IconSpec].
///
/// Use this class to configure the attributes of a [IconSpec] and pass it to
/// the [IconSpec] constructor.
final class IconSpecAttribute extends SpecAttribute<IconSpec> {
  const IconSpecAttribute({
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
  IconSpec resolve(MixData mix) {
    return IconSpec(
      color: color?.resolve(mix),
      size: size,
      weight: weight,
      grade: grade,
      opticalSize: opticalSize,
      shadows: shadows?.map((e) => e.resolve(mix)).toList(),
      textDirection: textDirection,
      applyTextScaling: applyTextScaling,
      fill: fill,
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  @override
  IconSpecAttribute merge(IconSpecAttribute? other) {
    if (other == null) return this;

    return IconSpecAttribute(
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

  /// The list of properties that constitute the state of this [IconSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [IconSpecAttribute] instances for equality.
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

/// Utility class for configuring [IconSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [IconSpecAttribute].
///
/// Use the methods of this class to configure specific properties of a [IconSpecAttribute].
final class IconSpecUtility<T extends Attribute>
    extends SpecUtility<T, IconSpecAttribute> {
  IconSpecUtility([super.builder]);

  /// Utility for defining [IconSpecAttribute.color]
  late final color = ColorUtility((v) => only(color: v));

  /// Utility for defining [IconSpecAttribute.size]
  late final size = DoubleUtility((v) => only(size: v));

  /// Utility for defining [IconSpecAttribute.weight]
  late final weight = DoubleUtility((v) => only(weight: v));

  /// Utility for defining [IconSpecAttribute.grade]
  late final grade = DoubleUtility((v) => only(grade: v));

  /// Utility for defining [IconSpecAttribute.opticalSize]
  late final opticalSize = DoubleUtility((v) => only(opticalSize: v));

  /// Utility for defining [IconSpecAttribute.shadows]
  late final shadows = ShadowListUtility((v) => only(shadows: v));

  /// Utility for defining [IconSpecAttribute.textDirection]
  late final textDirection =
      TextDirectionUtility((v) => only(textDirection: v));

  /// Utility for defining [IconSpecAttribute.applyTextScaling]
  late final applyTextScaling = BoolUtility((v) => only(applyTextScaling: v));

  /// Utility for defining [IconSpecAttribute.fill]
  late final fill = DoubleUtility((v) => only(fill: v));

  /// Utility for defining [IconSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  /// Returns a new [IconSpecAttribute] with the specified properties.
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
      IconSpecAttribute(
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

/// A tween that interpolates between two [IconSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [IconSpec] specifications.
class IconSpecTween extends Tween<IconSpec?> {
  IconSpecTween({
    super.begin,
    super.end,
  });

  @override
  IconSpec lerp(double t) {
    if (begin == null && end == null) return const IconSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}

double? _lerpDouble(
  num? a,
  num? b,
  double t,
) {
  if (a == b || (a?.isNaN ?? false) && (b?.isNaN ?? false)) {
    return a?.toDouble();
  }
  a ??= 0.0;
  b ??= 0.0;
  return a * (1.0 - t) + b * t;
}
