import '../variants/dynamic_variants/dynamic_variants.utils.dart';

// Dynamic utilities
final onXSmall = DynamicVariantUtilities.onXsmall();
final onMedium = DynamicVariantUtilities.onMedium();
final onSmall = DynamicVariantUtilities.onSmall();
final onLarge = DynamicVariantUtilities.onLarge();
final onPortrait = DynamicVariantUtilities.onPortrait();
final onLandscape = DynamicVariantUtilities.onLandscape();
final onDark = DynamicVariantUtilities.onDark();
final onLight = DynamicVariantUtilities.onLight();
final onRTL = DynamicVariantUtilities.onRTL();
final onLTR = onNot(onRTL);

final onDisabled = DynamicVariantUtilities.onDisabled();
final onFocus = DynamicVariantUtilities.onFocus();
final onHover = DynamicVariantUtilities.onHover();
final onPress = DynamicVariantUtilities.onPress();
final onLongPress = DynamicVariantUtilities.onLongPress();
const onNot = DynamicVariantUtilities.onNot;
final onEnabled = onNot(onDisabled);
const when = DynamicVariantUtilities.when;

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
