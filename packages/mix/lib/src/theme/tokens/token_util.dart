import 'package:flutter/material.dart';

import '../material/material_tokens.dart';
import 'breakpoints_token.dart';
import 'radius_token.dart';
import 'space_token.dart';

const $material = MaterialTokens();
const $token = MixTokens();

@immutable
class MixTokens {
  final space = const SpaceTokenUtil();
  final radius = const RadiusTokenUtil();
  final color = const ColorTokenUtil();
  final breakpoint = const BreakpointTokenUtil();
  final textStyle = const TextStyleTokenUtil();

  const MixTokens();
}

@immutable
class RadiusTokenUtil {
  final small = const RadiusToken('mix.radius.small');
  final medium = const RadiusToken('mix.radius.medium');
  final large = const RadiusToken('mix.radius.large');
  const RadiusTokenUtil();
}

@immutable
class SpaceTokenUtil {
  final large = const SpaceToken('mix.space.large');
  final medium = const SpaceToken('mix.space.medium');
  final small = const SpaceToken('mix.space.small');

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
