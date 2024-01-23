import 'package:flutter/material.dart';

import '../../../mix.dart';

final $radii = RadiiTokenUtil();
const $space = SpaceTokenUtil();
const $colors = ColorTokenUtil();
const $textStyles = TextStyleTokenUtil();

@immutable
class RadiiTokenUtil {
  final small = RadiusToken.small();
  final medium = RadiusToken.medium();
  final large = RadiusToken.large();

  RadiiTokenUtil();
}

@immutable
class SpaceTokenUtil {
  const SpaceTokenUtil();
  double xsmall() => SpaceToken.xsmall();
  double small() => SpaceToken.small();
  double medium() => SpaceToken.medium();
  double large() => SpaceToken.large();
  double xlarge() => SpaceToken.xlarge();
  double xxlarge() => SpaceToken.xxlarge();
}

@immutable
class ColorTokenUtil {
  const ColorTokenUtil();

  factory ColorTokenUtil.withMaterial() {
    return const ColorTokenUtilWithMaterialTokens();
  }
}

@immutable
class TextStyleTokenUtil {
  const TextStyleTokenUtil();

  factory TextStyleTokenUtil.withMaterial() {
    return const TextStyleTokenUtilWithMaterialTokens();
  }
}
