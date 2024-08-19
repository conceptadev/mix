import 'package:mix/mix.dart';

class ColorTokens {
  final ColorToken primary = const ColorToken('primary');
  final ColorToken primaryHover = const ColorToken('primary.hover');
  final ColorToken onPrimary = const ColorToken('on.primary');
  // final ColorToken secondary = const ColorToken('secondary');
  // final ColorToken onSecondary = const ColorToken('on.secondary');
  // final ColorToken outline = const ColorToken('outline');
}

class RadiusTokens {
  final RadiusToken small = const RadiusToken('radius.small');
  final RadiusToken normal = const RadiusToken('radius.normal');
  final RadiusToken large = const RadiusToken('radius.large');
  final RadiusToken full = const RadiusToken('radius.full');
}

class SpaceTokens {
  final SpaceToken xxxsmall = const SpaceToken('space.xxxsmall');
  final SpaceToken xxsmall = const SpaceToken('space.xxsmall');
  final SpaceToken xsmall = const SpaceToken('space.xsmall');
  final SpaceToken small = const SpaceToken('space.small');
  final SpaceToken medium = const SpaceToken('space.medium');
  final SpaceToken large = const SpaceToken('space.large');
}

class TextStyleTokens {
  final TextStyleToken small = const TextStyleToken('textstyle.small');
  final TextStyleToken normal = const TextStyleToken('textstyle.normall');
  final TextStyleToken large = const TextStyleToken('textstyle.large');
  final TextStyleToken extraLarge =
      const TextStyleToken('textstyle.extraLarge');
}
