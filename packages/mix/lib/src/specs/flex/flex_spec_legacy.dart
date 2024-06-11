import 'package:flutter/material.dart';

import '../../attributes/animated/animated_data_dto.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/spacing/spacing_util.dart';
import '../../core/attribute.dart';
import '../../core/models/animated_data.dart';
import '../../core/models/mix_data.dart';
import '../../core/spec.dart';
import '../../factory/mix_provider.dart';
import '../../internal/lerp_helpers.dart';

class FlexSpecLegacy extends Spec<FlexSpecLegacy> {
  final Axis? direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final VerticalDirection? verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final Clip? clipBehavior;
  final double? gap;

  const FlexSpecLegacy({
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

  const FlexSpecLegacy.exhaustive({
    required this.crossAxisAlignment,
    required this.mainAxisAlignment,
    required this.mainAxisSize,
    required this.verticalDirection,
    required this.direction,
    required this.textDirection,
    required this.textBaseline,
    required this.clipBehavior,
    required this.gap,
    required super.animated,
  });

  static FlexSpecLegacy of(BuildContext context) {
    final mix = Mix.of(context);

    return FlexSpecLegacy.from(mix);
  }

  static FlexSpecLegacy from(MixData mix) {
    return mix.attributeOf<FlexSpecLegacyAttribute>()?.resolve(mix) ??
        const FlexSpecLegacy();
  }

  @override
  FlexSpecLegacy lerp(FlexSpecLegacy? other, double t) {
    if (other == null) return this;

    return FlexSpecLegacy(
      crossAxisAlignment:
          lerpSnap(crossAxisAlignment, other.crossAxisAlignment, t),
      mainAxisAlignment:
          lerpSnap(mainAxisAlignment, other.mainAxisAlignment, t),
      mainAxisSize: lerpSnap(mainAxisSize, other.mainAxisSize, t),
      verticalDirection:
          lerpSnap(verticalDirection, other.verticalDirection, t),
      direction: lerpSnap(direction, other.direction, t),
      textDirection: lerpSnap(textDirection, other.textDirection, t),
      textBaseline: lerpSnap(textBaseline, other.textBaseline, t),
      clipBehavior: lerpSnap(clipBehavior, other.clipBehavior, t),
      gap: lerpDouble(gap, other.gap, t),
      animated: other.animated ?? animated,
    );
  }

  @override
  FlexSpecLegacy copyWith({
    Axis? direction,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisSize? mainAxisSize,
    VerticalDirection? verticalDirection,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
    Clip? clipBehavior,
    double? gap,
    AnimatedData? animated,
  }) {
    return FlexSpecLegacy(
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      mainAxisSize: mainAxisSize ?? this.mainAxisSize,
      verticalDirection: verticalDirection ?? this.verticalDirection,
      direction: direction ?? this.direction,
      textDirection: textDirection ?? this.textDirection,
      textBaseline: textBaseline ?? this.textBaseline,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      gap: gap ?? this.gap,
      animated: animated ?? this.animated,
    );
  }

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

class FlexSpecLegacyUtility<T extends Attribute>
    extends SpecUtility<T, FlexSpecLegacyAttribute> {
  late final direction = AxisUtility((v) => only(direction: v));
  late final mainAxisAlignment =
      MainAxisAlignmentUtility((v) => only(mainAxisAlignment: v));
  late final crossAxisAlignment =
      CrossAxisAlignmentUtility((v) => only(crossAxisAlignment: v));
  late final mainAxisSize = MainAxisSizeUtility((v) => only(mainAxisSize: v));
  late final verticalDirection =
      VerticalDirectionUtility((v) => only(verticalDirection: v));
  late final textDirection =
      TextDirectionUtility((v) => only(textDirection: v));
  late final textBaseline = TextBaselineUtility((v) => only(textBaseline: v));
  late final clipBehavior = ClipUtility((v) => only(clipBehavior: v));
  late final gap = SpacingSideUtility((v) => only(gap: v));

  late final row = direction.horizontal;
  late final column = direction.vertical;

  FlexSpecLegacyUtility(super.builder);

  @override
  T only({
    Axis? direction,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisSize? mainAxisSize,
    VerticalDirection? verticalDirection,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
    Clip? clipBehavior,
    double? gap,
    AnimatedDataDto? animated,
  }) {
    return builder(FlexSpecLegacyAttribute(
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      verticalDirection: verticalDirection,
      textDirection: textDirection,
      textBaseline: textBaseline,
      clipBehavior: clipBehavior,
      gap: gap,
      animated: animated,
    ));
  }
}

class FlexSpecLegacyAttribute extends SpecAttribute<FlexSpecLegacy> {
  final Axis? direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final VerticalDirection? verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final Clip? clipBehavior;
  final double? gap;

  const FlexSpecLegacyAttribute({
    this.direction,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.mainAxisSize,
    this.verticalDirection,
    this.textDirection,
    this.textBaseline,
    this.clipBehavior,
    this.gap,
    super.animated,
  });

  static FlexSpecLegacyAttribute of(MixData mix) {
    return mix.attributeOf() ?? const FlexSpecLegacyAttribute();
  }

  @override
  FlexSpecLegacy resolve(MixData mix) {
    return FlexSpecLegacy.exhaustive(
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
  FlexSpecLegacyAttribute merge(covariant FlexSpecLegacyAttribute? other) {
    if (other == null) return this;

    return FlexSpecLegacyAttribute(
      direction: other.direction ?? direction,
      mainAxisAlignment: other.mainAxisAlignment ?? mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment ?? crossAxisAlignment,
      mainAxisSize: other.mainAxisSize ?? mainAxisSize,
      verticalDirection: other.verticalDirection ?? verticalDirection,
      textDirection: other.textDirection ?? textDirection,
      textBaseline: other.textBaseline ?? textBaseline,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      gap: other.gap ?? gap,
      animated: other.animated ?? animated,
    );
  }

  @override
  List<Object?> get props => [
        direction,
        mainAxisAlignment,
        crossAxisAlignment,
        mainAxisSize,
        verticalDirection,
        textDirection,
        textBaseline,
        clipBehavior,
        gap,
        animated,
      ];
}
