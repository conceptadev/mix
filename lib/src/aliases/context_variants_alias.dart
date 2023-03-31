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
