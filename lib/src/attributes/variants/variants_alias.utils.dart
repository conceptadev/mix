import 'package:mix/mix.dart';

// Dynamic utilities
final onXSmall = VariantUtils.onXsmall();
final onMedium = VariantUtils.onMedium();
final onSmall = VariantUtils.onSmall();
final onLarge = VariantUtils.onLarge();
final onPortrait = VariantUtils.onPortrait();
final onLandscape = VariantUtils.onLandscape();
final onDark = VariantUtils.onDark();
final onLight = VariantUtils.onLight();

final onDisabled = VariantUtils.onDisabled();
final onFocus = VariantUtils.onFocus();
final onHover = VariantUtils.onHover();
final onPress = VariantUtils.onPress();
const onNot = VariantUtils.onNot;
final onEnabled = onNot(onDisabled);

@Deprecated('Use onXSmall instead')
final xsmall = onXSmall;

@Deprecated('Use onSmall instead')
final small = onSmall;

@Deprecated('Use onMedium instead')
final medium = onMedium;

@Deprecated('Use onDark instead')
final dark = onDark;

@Deprecated('Use onLight instead')
final light = onLight;

@Deprecated('Use onLarge instead')
final large = onLarge;

@Deprecated('Use onHover instead')
final hover = onHover;

@Deprecated('Use onFocus instead')
final focus = onFocus;

@Deprecated('Use onPortrait instead')
final portrait = onPortrait;

@Deprecated('Use onLandscape instead')
final landscape = onLandscape;

@Deprecated('Use onDisabled instead')
final disabled = onDisabled;

@Deprecated('Use onEnabled instead')
final enabled = onEnabled;

@Deprecated('Use onPress instead')
final press = onPress;

@Deprecated('Use onNot instead')
const not = onNot;
