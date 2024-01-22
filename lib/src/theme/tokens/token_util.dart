import 'package:flutter/material.dart';

import 'breakpoints_token.dart';
import 'material_tokens.dart';
import 'radius_token.dart';
import 'space_token.dart';

const $radii = RadiiTokenUtil();
const $space = SpaceTokenUtil();
const $colors = ColorTokenUtil();
const $breakpoints = BreakpointTokenUtil();
const $textStyles = TextStyleTokenUtil();

@immutable
class RadiiTokenUtil {
  const RadiiTokenUtil();

  final small = RadiusToken.small;
  final medium = RadiusToken.medium;
  final large = RadiusToken.large;
}

@immutable
class SpaceTokenUtil {
  const SpaceTokenUtil();

  final xsmall = SpaceToken.xsmall;
  final small = SpaceToken.small;
  final medium = SpaceToken.medium;
  final large = SpaceToken.large;
  final xlarge = SpaceToken.xlarge;
  final xxlarge = SpaceToken.xxlarge;
}

@immutable
class BreakpointTokenUtil {
  const BreakpointTokenUtil();

  final xsmall = BreakpointToken.xsmall;
  final small = BreakpointToken.small;
  final medium = BreakpointToken.medium;
  final large = BreakpointToken.large;
}

@immutable
class ColorTokenUtil {
  const ColorTokenUtil();
}

@immutable
class TextStyleTokenUtil {
  const TextStyleTokenUtil();
}
