import 'package:mix/mix.dart';

extension ColorExt on ColorTokenUtil {
  ColorToken get primary => const ColorToken('primary');
  ColorToken get primaryHover => const ColorToken('primary.hover');
  ColorToken get onPrimary => const ColorToken('on.primary');
  // ColorToken get secondary => const ColorToken('secondary');
  // ColorToken get onSecondary => const ColorToken('on.secondary');
  // ColorToken get outline => const ColorToken('outline');
}

extension RadiusExt on RadiusTokenUtil {
  RadiusToken get small => const RadiusToken('radius.small');
  RadiusToken get normal => const RadiusToken('radius.normal');
  RadiusToken get large => const RadiusToken('radius.large');
  RadiusToken get full => const RadiusToken('radius.full');
}

extension SpacingExt on SpaceTokenUtil {
  SpaceToken get xxxsmall => const SpaceToken('space.xxxsmall');
  SpaceToken get xxsmall => const SpaceToken('space.xxsmall');
  SpaceToken get xsmall => const SpaceToken('space.xsmall');
  SpaceToken get small => const SpaceToken('space.small');
  SpaceToken get medium => const SpaceToken('space.medium');
}

extension TextStyleExt on TextStyleTokenUtil {
  TextStyleToken get small => const TextStyleToken('textstyle.small');
  TextStyleToken get normal => const TextStyleToken('textstyle.normall');
  TextStyleToken get large => const TextStyleToken('textstyle.large');
  TextStyleToken get extraLarge => const TextStyleToken('textstyle.extraLarge');
}
