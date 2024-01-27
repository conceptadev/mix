import 'package:flutter/material.dart';

import '../material/material_tokens.dart';
import 'breakpoints_token.dart';
import 'radius_token.dart';
import 'space_token.dart';

const $md = MaterialTokens();
const $radii = RadiiTokenUtil();
const $space = SpaceTokenUtil();
const $colors = ColorTokenUtil();
const $breakpoints = BreakpointTokenUtil();
const $textStyles = TextStyleTokenUtil();

@immutable
class RadiiTokenUtil {
  final small = RadiusToken.small;
  final medium = RadiusToken.medium;
  final large = RadiusToken.large;
  const RadiiTokenUtil();
}

@immutable
class SpaceTokenUtil {
  final xsmall = SpaceToken.xsmall;
  final small = SpaceToken.small;
  final medium = SpaceToken.medium;
  final large = SpaceToken.large;
  final xlarge = SpaceToken.xlarge;
  final xxlarge = SpaceToken.xxlarge;
  const SpaceTokenUtil();
}

@immutable
class BreakpointTokenUtil {
  final xsmall = BreakpointToken.xsmall;
  final small = BreakpointToken.small;
  final medium = BreakpointToken.medium;
  final large = BreakpointToken.large;
  const BreakpointTokenUtil();
}

@immutable
class ColorTokenUtil {
  const ColorTokenUtil();
}

@immutable
class TextStyleTokenUtil {
  const TextStyleTokenUtil();
}
