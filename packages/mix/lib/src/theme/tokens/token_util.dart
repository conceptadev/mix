import '../material/material_tokens.dart';
import 'breakpoints_token.dart';
import 'radius_token.dart';
import 'space_token.dart';

const $material = MaterialTokens();
@Deprecated('You should define your own token utility')
const $token = MixTokens();

@Deprecated('You should define your own token utility')
class MixTokens {
  final space = const SpaceTokenUtil();
  final radius = const RadiusTokenUtil();
  final color = const ColorTokenUtil();
  final breakpoint = const BreakpointTokenUtil();
  final textStyle = const TextStyleTokenUtil();

  const MixTokens();
}

@Deprecated('You should define your own token utility')
class RadiusTokenUtil {
  final small = const RadiusToken('mix.radius.small');
  final medium = const RadiusToken('mix.radius.medium');
  final large = const RadiusToken('mix.radius.large');
  const RadiusTokenUtil();
}

@Deprecated('You should define your own token utility')
class SpaceTokenUtil {
  final large = const SpaceToken('mix.space.large');
  final medium = const SpaceToken('mix.space.medium');
  final small = const SpaceToken('mix.space.small');

  const SpaceTokenUtil();
}

@Deprecated('You should define your own token utility')
class ColorTokenUtil {
  const ColorTokenUtil();
}

@Deprecated('You should define your own token utility')
class TextStyleTokenUtil {
  const TextStyleTokenUtil();
}
