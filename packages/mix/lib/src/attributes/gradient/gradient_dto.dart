// ignore_for_file: prefer_relative_imports,avoid-importing-entrypoint-exports

import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../internal/constants.dart';
import '../../internal/mix_error.dart';

part 'gradient_dto.g.dart';

/// Represents a base Data transfer object of [Gradient]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[Gradient]
@immutable
sealed class GradientMix<T extends Gradient> extends Mixable<T>
    with HasDefaultValue<T> {
  final List<double>? stops;
  final List<ColorMix>? colors;
  final GradientTransform? transform;
  const GradientMix({this.stops, this.colors, this.transform});

  static B _exhaustiveMerge<A extends GradientMix, B extends GradientMix>(
    A a,
    B b,
  ) {
    if (a.runtimeType == b.runtimeType) return a.merge(b) as B;

    return switch (b) {
      (LinearGradientMix g) => a.asLinearGradient().merge(g) as B,
      (RadialGradientMix g) => a.asRadialGradient().merge(g) as B,
      (SweepGradientMix g) => a.asSweepGradient().merge(g) as B,
    };
  }

  static GradientMix? tryToMerge(GradientMix? a, GradientMix? b) {
    if (b == null) return a;
    if (a == null) return b;

    return a.runtimeType == b.runtimeType ? a.merge(b) : _exhaustiveMerge(a, b);
  }

  LinearGradientMix asLinearGradient() {
    return LinearGradientMix(
      transform: transform,
      colors: colors,
      stops: stops,
    );
  }

  RadialGradientMix asRadialGradient() {
    return RadialGradientMix(
      transform: transform,
      colors: colors,
      stops: stops,
    );
  }

  SweepGradientMix asSweepGradient() {
    return SweepGradientMix(
      transform: transform,
      colors: colors,
      stops: stops,
    );
  }

  @override
  GradientMix<T> merge(covariant GradientMix<T>? other);
}

/// Represents a Data transfer object of [LinearGradient]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[LinearGradient]

@MixableProperty()
final class LinearGradientMix extends GradientMix<LinearGradient>
    with _$LinearGradientMix {
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;
  final TileMode? tileMode;

  const LinearGradientMix({
    this.begin,
    this.end,
    this.tileMode,
    super.transform,
    super.colors,
    super.stops,
  });
  @override
  LinearGradient get defaultValue => const LinearGradient(colors: []);
}

/// Represents a Data transfer object of [RadialGradient]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[RadialGradient]
@MixableProperty()
final class RadialGradientMix extends GradientMix<RadialGradient>
    with _$RadialGradientMix {
  final AlignmentGeometry? center;
  final double? radius;

  // focalRadius
  final TileMode? tileMode;
  final AlignmentGeometry? focal;

  final double? focalRadius;

  const RadialGradientMix({
    this.center,
    this.radius,
    this.tileMode,
    this.focal,
    this.focalRadius,
    super.transform,
    super.colors,
    super.stops,
  });
  @override
  RadialGradient get defaultValue => const RadialGradient(colors: []);
}

/// Represents a Data transfer object of [SweepGradient]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[SweepGradient]

@MixableProperty()
final class SweepGradientMix extends GradientMix<SweepGradient>
    with _$SweepGradientMix {
  final AlignmentGeometry? center;
  final double? startAngle;
  final double? endAngle;

  final TileMode? tileMode;

  const SweepGradientMix({
    this.center,
    this.startAngle,
    this.endAngle,
    this.tileMode,
    super.transform,
    super.colors,
    super.stops,
  });
  @override
  SweepGradient get defaultValue => const SweepGradient(colors: []);
}

extension GradientExt on Gradient {
  // toDto
  GradientMix toDto() {
    final self = this;
    if (self is LinearGradient) return (self).toDto();
    if (self is RadialGradient) return (self).toDto();
    if (self is SweepGradient) return (self).toDto();

    throw MixError.unsupportedTypeInDto(
      Gradient,
      ['LinearGradient', 'RadialGradient', 'SweepGradient'],
    );
  }
}

/// A utility class for working with gradients.
///
/// This class provides convenient methods for creating different types of gradients,
/// such as radial gradients, linear gradients, and sweep gradients.
/// It also provides a method for converting a generic [Gradient] object to a specific type [T].
///
/// Accepts a [builder] function that takes a [GradientMix] and returns an object of type [T].
final class GradientMixUtility<T extends Attribute>
    extends MixUtility<T, GradientMix> {
  late final radial = RadialGradientMixUtility(builder);
  late final linear = LinearGradientMixUtility(builder);
  late final sweep = SweepGradientMixUtility(builder);

  GradientMixUtility(super.builder);

  /// Converts a [Gradient] object to the specific type [T].
  ///
  /// Throws an [UnimplementedError] if the given gradient type is not supported.
  T as(Gradient gradient) {
    switch (gradient) {
      case RadialGradient():
        return radial.as(gradient);
      case LinearGradient():
        return linear.as(gradient);
      case SweepGradient():
        return sweep.as(gradient);
    }

    throw FlutterError.fromParts([
      ErrorSummary('Mix does not support custom gradient implementations.'),
      ErrorDescription(
        'The provided gradient of type ${gradient.runtimeType} is not supported.',
      ),
      ErrorHint(
        'If you believe this gradient type should be supported, please open an issue at '
        '$mixIssuesUrl with details about your implementation '
        'and its use case.',
      ),
    ]);
  }
}
