// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stack_spec.dart';

// **************************************************************************
// Generator: SpecDefinitionBuilder
// **************************************************************************

mixin StackDefMixable on Spec<StackDef> {
  /// Retrieves the [StackDef] from a MixData.
  static StackDef from(MixData mix) {
    return mix.attributeOf<StackDefAttribute>()?.resolve(mix) ??
        const StackDef();
  }

  /// Retrieves the [StackDef] from the nearest [Mix] ancestor.
  ///
  /// If no ancestor is found, returns [StackDef].
  static StackDef of(BuildContext context) {
    return StackDefMixable.from(Mix.of(context));
  }

  /// Creates a copy of this [StackDef] but with the given fields
  /// replaced with the new values.
  @override
  StackDef copyWith({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
    AnimatedData? animated,
  }) {
    return StackDef(
      alignment: alignment ?? _$this.alignment,
      fit: fit ?? _$this.fit,
      textDirection: textDirection ?? _$this.textDirection,
      clipBehavior: clipBehavior ?? _$this.clipBehavior,
      animated: animated ?? _$this.animated,
    );
  }

  @override
  StackDef lerp(
    StackDef? other,
    double t,
  ) {
    if (other == null) return _$this;

    return StackDef(
      alignment: AlignmentGeometry.lerp(
        _$this.alignment,
        other._$this.alignment,
        t,
      ),
      fit: t < 0.5 ? _$this.fit : other._$this.fit,
      textDirection:
          t < 0.5 ? _$this.textDirection : other._$this.textDirection,
      clipBehavior: t < 0.5 ? _$this.clipBehavior : other._$this.clipBehavior,
      animated: t < 0.5 ? _$this.animated : other._$this.animated,
    );
  }

  /// The list of properties that constitute the state of this [StackDef].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [StackDef] instances for equality.
  @override
  List<Object?> get props {
    return [
      _$this.alignment,
      _$this.fit,
      _$this.textDirection,
      _$this.clipBehavior,
      _$this.animated,
    ];
  }

  StackDef get _$this => this as StackDef;
}

/// Represents the attributes of a [StackDef].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [StackDef].
///
/// Use this class to configure the attributes of a [StackDef] and pass it to
/// the [StackDef] constructor.
class StackDefAttribute extends SpecAttribute<StackDef> {
  const StackDefAttribute({
    this.alignment,
    this.fit,
    this.textDirection,
    this.clipBehavior,
    super.animated,
  });

  final AlignmentGeometry? alignment;

  final StackFit? fit;

  final TextDirection? textDirection;

  final Clip? clipBehavior;

  @override
  StackDef resolve(MixData mix) {
    return StackDef(
      alignment: alignment,
      fit: fit,
      textDirection: textDirection,
      clipBehavior: clipBehavior,
      animated: animated?.resolve(mix),
    );
  }

  @override
  StackDefAttribute merge(StackDefAttribute? other) {
    if (other == null) return this;

    return StackDefAttribute(
      alignment: other.alignment ?? alignment,
      fit: other.fit ?? fit,
      textDirection: other.textDirection ?? textDirection,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [StackDefAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [StackDefAttribute] instances for equality.
  @override
  List<Object?> get props {
    return [
      alignment,
      fit,
      textDirection,
      clipBehavior,
      animated,
    ];
  }
}

/// Utility class for configuring [StackDefAttribute] properties.
///
/// This class provides methods to set individual properties of a [StackDefAttribute].
///
/// Use the methods of this class to configure specific properties of a [StackDefAttribute].
class StackDefUtility<T extends Attribute>
    extends SpecUtility<T, StackDefAttribute> {
  StackDefUtility(super.builder);

  /// Utility for defining [StackDefAttribute.alignment]
  late final alignment = AlignmentUtility((v) => only(alignment: v));

  /// Utility for defining [StackDefAttribute.fit]
  late final fit = StackFitUtility((v) => only(fit: v));

  /// Utility for defining [StackDefAttribute.textDirection]
  late final textDirection =
      TextDirectionUtility((v) => only(textDirection: v));

  /// Utility for defining [StackDefAttribute.clipBehavior]
  late final clipBehavior = ClipUtility((v) => only(clipBehavior: v));

  /// Utility for defining [StackDefAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  /// Returns a new [StackDefAttribute] with the specified properties.
  @override
  T only({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
    AnimatedDataDto? animated,
  }) {
    return builder(
      StackDefAttribute(
        alignment: alignment,
        fit: fit,
        textDirection: textDirection,
        clipBehavior: clipBehavior,
        animated: animated,
      ),
    );
  }
}

/// A tween that interpolates between two [StackDef] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [StackDef] specifications.
class StackDefTween extends Tween<StackDef?> {
  StackDefTween({
    super.begin,
    super.end,
  });

  @override
  StackDef lerp(double t) {
    if (begin == null && end == null) return const StackDef();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
