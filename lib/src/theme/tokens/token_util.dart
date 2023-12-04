import 'package:flutter/material.dart';

import 'material_tokens.dart';
import 'radius_token.dart';
import 'space_token.dart';

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

class ColorTokenUtil with MaterialColorTokensMixin {
  const ColorTokenUtil();
}

class TextStyleTokenUtil with MaterialTextStyleTokensMixin {
  const TextStyleTokenUtil();
}
