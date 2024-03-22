import 'package:flutter/material.dart';

import '../material/material_tokens.dart';
import 'breakpoints_token.dart';

const $md = MaterialTokens();

const $radius = RadiusTokenUtil();
const $space = SpaceTokenUtil();
const $color = ColorTokenUtil();
const $breakpoint = BreakpointTokenUtil();
const $textStyle = TextStyleTokenUtil();

@immutable
class RadiusTokenUtil {
  const RadiusTokenUtil();
}

@immutable
class SpaceTokenUtil {
  const SpaceTokenUtil();
}

@immutable
class ColorTokenUtil {
  const ColorTokenUtil();
}

@immutable
class TextStyleTokenUtil {
  const TextStyleTokenUtil();
}

@immutable
class BreakpointTokenUtil {
  final xsmall = BreakpointToken.xsmall;
  final small = BreakpointToken.small;
  final medium = BreakpointToken.medium;
  final large = BreakpointToken.large;
  const BreakpointTokenUtil();
}
