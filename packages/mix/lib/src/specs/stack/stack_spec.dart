import 'package:flutter/material.dart';

import '../../attributes/animated/animated_data_dto.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../core/attribute.dart';
import '../../core/models/animated_data.dart';
import '../../core/models/mix_data.dart';
import '../../core/spec.dart';
import '../../factory/mix_provider.dart';
import '../../internal/lerp_helpers.dart';

class StackSpec extends Spec<StackSpec> {
  final AlignmentGeometry? alignment;
  final StackFit? fit;
  final TextDirection? textDirection;
  final Clip? clipBehavior;

  const StackSpec({
    this.alignment,
    this.fit,
    this.textDirection,
    this.clipBehavior,
    super.animated,
  });

  const StackSpec.exhaustive({
    required this.alignment,
    required this.fit,
    required this.textDirection,
    required this.clipBehavior,
    required super.animated,
  });

  static StackSpec of(BuildContext context) {
    final mix = Mix.of(context);

    return StackSpec.from(mix);
  }

  static StackSpec from(MixData mix) {
    return mix.attributeOf<StackSpecAttribute>()?.resolve(mix) ??
        const StackSpec();
  }

  @override
  StackSpec lerp(StackSpec? other, double t) {
    if (other == null) return this;

    return StackSpec(
      alignment: AlignmentGeometry.lerp(alignment, other.alignment, t),
      fit: lerpSnap(fit, other.fit, t),
      textDirection: lerpSnap(textDirection, other.textDirection, t),
      clipBehavior: lerpSnap(clipBehavior, other.clipBehavior, t),
      animated: other.animated ?? animated,
    );
  }

  @override
  StackSpec copyWith({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
    AnimatedData? animated,
  }) {
    return StackSpec(
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

class StackSpecAttribute extends SpecAttribute<StackSpec> {
  final Clip? clipBehavior;
  final TextDirection? textDirection;
  final StackFit? fit;
  final AlignmentGeometry? alignment;
  const StackSpecAttribute({
    this.alignment,
    this.fit,
    this.textDirection,
    this.clipBehavior,
    super.animated,
  });

  static StackSpecAttribute of(MixData mix) {
    return mix.attributeOf() ?? const StackSpecAttribute();
  }

  @override
  StackSpec resolve(MixData mix) {
    return StackSpec.exhaustive(
      alignment: alignment,
      fit: fit,
      textDirection: textDirection,
      clipBehavior: clipBehavior,
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  @override
  StackSpecAttribute merge(covariant StackSpecAttribute? other) {
    if (other == null) return this;

    return StackSpecAttribute(
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

class StackSpecUtility<T extends Attribute>
    extends SpecUtility<T, StackSpecAttribute> {
  late final alignment = AlignmentUtility((v) => only(alignment: v));
  late final fit = StackFitUtility((v) => only(fit: v));
  late final textDirection =
      TextDirectionUtility((v) => only(textDirection: v));
  late final clipBehavior = ClipUtility((v) => only(clipBehavior: v));

  StackSpecUtility(super.builder);

  @override
  T only({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
    AnimatedDataDto? animated,
  }) {
    return builder(
      StackSpecAttribute(
        alignment: alignment,
        fit: fit,
        textDirection: textDirection,
        clipBehavior: clipBehavior,
        animated: animated,
      ),
    );
  }
}
