import 'package:flutter/material.dart';

import '../../core/extensions/values_ext.dart';
import '../color/color_dto.dart';
import '../scalars/scalar_util.dart';
import 'gradient_attribute.dart';
import 'gradient_dto.dart';

class GradientUtility<T> extends MixUtility<T, GradientDto> {
  static const selfBuilder = GradientUtility(GradientAttribute.new);

  const GradientUtility(super.builder);

  // T _radial(RadialGradientDto radial) => builder(radial);

  // T _linear(LinearGradientDto linear) => builder(linear);

  // T _sweep(SweepGradientDto sweep) => builder(sweep);

  RadialGradientUtility<T> get radial {
    return RadialGradientUtility(builder);
  }

  LinearGradientUtility<T> get linear {
    return LinearGradientUtility(builder);
  }

  SweepGradientUtility<T> get sweep {
    return SweepGradientUtility(builder);
  }

  T as(Gradient gradient) {
    if (gradient is RadialGradient) {
      return radial.as(gradient);
    } else if (gradient is LinearGradient) {
      return linear.as(gradient);
    } else if (gradient is SweepGradient) {
      return sweep.as(gradient);
    }
    throw UnimplementedError(
      'Cannot create GradientAttribute from gradient of type ${gradient.runtimeType}',
    );
  }
}

class RadialGradientUtility<T> extends MixUtility<T, RadialGradientDto> {
  static const selfBuilder = RadialGradientUtility(GradientAttribute.new);

  const RadialGradientUtility(super.builder);

  AlignmentUtility<T> get center {
    return AlignmentUtility((center) => call(center: center));
  }

  DoubleUtility<T> get radius {
    return DoubleUtility((radius) => call(radius: radius));
  }

  AlignmentUtility<T> get focal {
    return AlignmentUtility((focal) => call(focal: focal));
  }

  DoubleUtility<T> get focalRadius {
    return DoubleUtility((focalRadius) => call(focalRadius: focalRadius));
  }

  TileModeUtility<T> get tileMode {
    return TileModeUtility((tileMode) => call(tileMode: tileMode));
  }

  GradientTransformUtility<T> get transform {
    return GradientTransformUtility((transform) => call(transform: transform));
  }

  T colors(List<Color> colors) => call(colors: colors);

  T stops(List<double> stops) => call(stops: stops);

  T as(RadialGradient gradient) {
    return builder(RadialGradientDto.from(gradient));
  }

  T call({
    List<Color>? colors,
    List<double>? stops,
    AlignmentGeometry? center,
    double? radius,
    AlignmentGeometry? focal,
    double? focalRadius,
    TileMode? tileMode,
    GradientTransform? transform,
  }) {
    final gradient = RadialGradientDto(
      center: center,
      radius: radius,
      tileMode: tileMode,
      focal: focal,
      focalRadius: focalRadius,
      transform: transform,
      colors: colors?.map((e) => e.toDto()).toList(),
      stops: stops,
    );

    return builder(gradient);
  }
}

class LinearGradientUtility<T> extends MixUtility<T, LinearGradientDto> {
  static const selfBuilder = LinearGradientUtility(GradientAttribute.new);

  const LinearGradientUtility(super.builder);

  AlignmentUtility<T> get begin {
    return AlignmentUtility((AlignmentGeometry begin) {
      return builder(LinearGradientDto(begin: begin));
    });
  }

  AlignmentUtility<T> get end {
    return AlignmentUtility((AlignmentGeometry end) {
      return builder(LinearGradientDto(end: end));
    });
  }

  TileModeUtility<T> get tileMode {
    return TileModeUtility(
      (TileMode tileMode) => builder(LinearGradientDto(tileMode: tileMode)),
    );
  }

  GradientTransformUtility<T> get transform {
    return GradientTransformUtility((GradientTransform transform) {
      return builder(LinearGradientDto(transform: transform));
    });
  }

  T colors(List<Color> colors) => call(colors: colors);

  T stops(List<double> stops) => builder(LinearGradientDto(stops: stops));

  T as(LinearGradient gradient) {
    return builder(LinearGradientDto.from(gradient));
  }

  T call({
    List<Color>? colors,
    List<double>? stops,
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
    TileMode? tileMode,
    GradientTransform? transform,
  }) {
    final gradient = LinearGradientDto(
      begin: begin,
      end: end,
      tileMode: tileMode,
      transform: transform,
      colors: colors?.map(ColorDto.new).toList(),
      stops: stops,
    );

    return builder(gradient);
  }
}

class SweepGradientUtility<T> extends MixUtility<T, SweepGradientDto> {
  static const selfBuilder = SweepGradientUtility(GradientAttribute.new);

  const SweepGradientUtility(super.builder);

  AlignmentUtility<T> get center {
    return AlignmentUtility((AlignmentGeometry center) {
      return builder(SweepGradientDto(center: center));
    });
  }

  DoubleUtility<T> get startAngle {
    return DoubleUtility((double startAngle) {
      return builder(SweepGradientDto(startAngle: startAngle));
    });
  }

  DoubleUtility<T> get endAngle {
    return DoubleUtility((double endAngle) {
      return builder(SweepGradientDto(endAngle: endAngle));
    });
  }

  TileModeUtility<T> get tileMode {
    return TileModeUtility((TileMode tileMode) {
      return builder(SweepGradientDto(tileMode: tileMode));
    });
  }

  GradientTransformUtility<T> get transform {
    return GradientTransformUtility((GradientTransform transform) {
      return builder(SweepGradientDto(transform: transform));
    });
  }

  T colors(List<Color> colors) => call(colors: colors);

  T stops(List<double> stops) => call(stops: stops);

  T as(SweepGradient gradient) {
    return builder(SweepGradientDto.from(gradient));
  }

  T call({
    List<Color>? colors,
    List<double>? stops,
    AlignmentGeometry? center,
    double? startAngle,
    double? endAngle,
    TileMode? tileMode,
    GradientTransform? transform,
  }) {
    final gradient = SweepGradientDto(
      center: center,
      startAngle: startAngle,
      endAngle: endAngle,
      tileMode: tileMode,
      transform: transform,
      colors: colors?.map(ColorDto.new).toList(),
      stops: stops,
    );

    return builder(gradient);
  }
}
