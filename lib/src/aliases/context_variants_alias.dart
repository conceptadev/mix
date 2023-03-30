// Dynamic utilities
import '../variants/utilities/context_variant_utilities.dart';

final onXSmall = ContextVariantUtilities.onXsmall();
final onMedium = ContextVariantUtilities.onMedium();
final onSmall = ContextVariantUtilities.onSmall();
final onLarge = ContextVariantUtilities.onLarge();
final onPortrait = ContextVariantUtilities.onPortrait();
final onLandscape = ContextVariantUtilities.onLandscape();
final onDark = ContextVariantUtilities.onDark();
final onLight = ContextVariantUtilities.onLight();
final onRTL = ContextVariantUtilities.onRTL();
final onLTR = onNot(onRTL);

final onDisabled = ContextVariantUtilities.onDisabled();
final onFocus = ContextVariantUtilities.onFocus();
final onHover = ContextVariantUtilities.onHover();
final onPress = ContextVariantUtilities.onPress();
final onLongPress = ContextVariantUtilities.onLongPress();
const onNot = ContextVariantUtilities.onNot;
final onEnabled = onNot(onDisabled);
@Deprecated('use Mix.chooser instead')
void when(bool _) => throw UnimplementedError();

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
