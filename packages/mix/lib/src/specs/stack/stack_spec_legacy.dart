import 'package:flutter/material.dart';

import '../../attributes/animated/animated_data_dto.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../core/attribute.dart';
import '../../core/models/animated_data.dart';
import '../../core/models/mix_data.dart';
import '../../core/spec.dart';
import '../../factory/mix_provider.dart';
import '../../internal/lerp_helpers.dart';

class StackSpecLegacy extends Spec<StackSpecLegacy> {
  final AlignmentGeometry? alignment;
  final StackFit? fit;
  final TextDirection? textDirection;
  final Clip? clipBehavior;

  const StackSpecLegacy({
    this.alignment,
    this.fit,
    this.textDirection,
    this.clipBehavior,
    super.animated,
  });

  const StackSpecLegacy.exhaustive({
    required this.alignment,
    required this.fit,
    required this.textDirection,
    required this.clipBehavior,
    required super.animated,
  });

  static StackSpecLegacy of(BuildContext context) {
    final mix = Mix.of(context);

    return StackSpecLegacy.from(mix);
  }

  static StackSpecLegacy from(MixData mix) {
    return mix.attributeOf<StackSpecLegacyAttribute>()?.resolve(mix) ??
        const StackSpecLegacy();
  }

  @override
  StackSpecLegacy lerp(StackSpecLegacy? other, double t) {
    if (other == null) return this;

    return StackSpecLegacy(
      alignment: AlignmentGeometry.lerp(alignment, other.alignment, t),
      fit: lerpSnap(fit, other.fit, t),
      textDirection: lerpSnap(textDirection, other.textDirection, t),
      clipBehavior: lerpSnap(clipBehavior, other.clipBehavior, t),
      animated: other.animated ?? animated,
    );
  }

  @override
  StackSpecLegacy copyWith({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
    AnimatedData? animated,
  }) {
    return StackSpecLegacy(
      alignment: alignment ?? this.alignment,
      fit: fit ?? this.fit,
      textDirection: textDirection ?? this.textDirection,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      animated: animated ?? this.animated,
    );
  }

  @override
  List<Object?> get props =>
      [alignment, fit, textDirection, clipBehavior, animated];
}

class StackSpecLegacyAttribute extends SpecAttribute<StackSpecLegacy> {
  final Clip? clipBehavior;
  final TextDirection? textDirection;
  final StackFit? fit;
  final AlignmentGeometry? alignment;
  const StackSpecLegacyAttribute({
    this.alignment,
    this.fit,
    this.textDirection,
    this.clipBehavior,
    super.animated,
  });

  static StackSpecLegacyAttribute of(MixData mix) {
    return mix.attributeOf() ?? const StackSpecLegacyAttribute();
  }

  @override
  StackSpecLegacy resolve(MixData mix) {
    return StackSpecLegacy.exhaustive(
      alignment: alignment,
      fit: fit,
      textDirection: textDirection,
      clipBehavior: clipBehavior,
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  @override
  StackSpecLegacyAttribute merge(covariant StackSpecLegacyAttribute? other) {
    if (other == null) return this;

    return StackSpecLegacyAttribute(
      alignment: other.alignment ?? alignment,
      fit: other.fit ?? fit,
      textDirection: other.textDirection ?? textDirection,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      animated: other.animated ?? animated,
    );
  }

  @override
  List<Object?> get props =>
      [alignment, fit, textDirection, clipBehavior, animated];
}

class StackSpecLegacyUtility<T extends Attribute>
    extends SpecUtility<T, StackSpecLegacyAttribute> {
  late final alignment = AlignmentUtility((v) => only(alignment: v));
  late final fit = StackFitUtility((v) => only(fit: v));
  late final textDirection =
      TextDirectionUtility((v) => only(textDirection: v));
  late final clipBehavior = ClipUtility((v) => only(clipBehavior: v));

  StackSpecLegacyUtility(super.builder);

  @override
  T only({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
    AnimatedDataDto? animated,
  }) {
    return builder(
      StackSpecLegacyAttribute(
        alignment: alignment,
        fit: fit,
        textDirection: textDirection,
        clipBehavior: clipBehavior,
        animated: animated,
      ),
    );
  }
}
