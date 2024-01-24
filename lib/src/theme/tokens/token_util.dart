import 'package:flutter/material.dart';

import '../material/material_tokens.dart';
import 'radius_token.dart';
import 'space_token.dart';

const $md = MaterialTokens();
const $radii = RadiiTokenUtil();
const $space = SpaceTokenUtil();
const $colors = ColorTokenUtil();
const $textStyles = TextStyleTokenUtil();

@immutable
class RadiiTokenUtil {
  const RadiiTokenUtil();
  RadiusRef small() => RadiusToken.small();
  RadiusRef medium() => RadiusToken.medium();
  RadiusRef large() => RadiusToken.large();
}

@immutable
class SpaceTokenUtil {
  const SpaceTokenUtil();
  SpaceRef xsmall() => SpaceToken.xsmall();
  SpaceRef small() => SpaceToken.small();
  SpaceRef medium() => SpaceToken.medium();
  SpaceRef large() => SpaceToken.large();
  SpaceRef xlarge() => SpaceToken.xlarge();
  SpaceRef xxlarge() => SpaceToken.xxlarge();
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
