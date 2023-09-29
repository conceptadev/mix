// Dynamic utilities.
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
