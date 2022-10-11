import 'package:mix/mix.dart';

// Dynamic utilities
final onXSmall = SystemVariantUtils.onXsmall();
final onMedium = SystemVariantUtils.onMedium();
final onSmall = SystemVariantUtils.onSmall();
final onLarge = SystemVariantUtils.onLarge();
final onPortrait = SystemVariantUtils.onPortrait();
final onLandscape = SystemVariantUtils.onLandscape();
final onDark = SystemVariantUtils.onDark();
final onLight = SystemVariantUtils.onLight();

final onDisabled = SystemVariantUtils.onDisabled();
final onFocus = SystemVariantUtils.onFocus();
final onHover = SystemVariantUtils.onHover();
final onPress = SystemVariantUtils.onPress();
const onNot = SystemVariantUtils.onNot;
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
