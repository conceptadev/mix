import '../aliases/context_variants_alias.dart';
import '../attributes/common/common.utils.dart';
import '../theme/tokens/size.dart';
import '../widgets/box/box.utils.dart';
import '../widgets/box/box.utils.deprecated.dart';

// Common Utilities

@Deprecated('Use animation instead')
const animated = CommonUtility.animation;

// Variants

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

// Margin

@Deprecated('Use margin instead')
const m = WithSizeTokens(BoxUtility.margin);

@Deprecated('Use marginOnly instead')
const mt = WithSizeTokens(BoxUtilityDeprecated.marginTop);

@Deprecated('Use marginOnly instead')
const mb = WithSizeTokens(BoxUtilityDeprecated.marginBottom);

@Deprecated('Use marginOnly instead')
const mr = WithSizeTokens(BoxUtilityDeprecated.marginRight);

@Deprecated('Use marginOnly instead')
const ml = WithSizeTokens(BoxUtilityDeprecated.marginLeft);

@Deprecated('Use marginOnly instead')
const ms = WithSizeTokens(BoxUtilityDeprecated.marginStart);

@Deprecated('Use marginOnly instead')
const me = WithSizeTokens(BoxUtilityDeprecated.marginEnd);

@Deprecated('Use marginX instead')
const mx = WithSizeTokens(BoxUtilityDeprecated.marginHorizontal);

@Deprecated('Use marginY instead')
const my = WithSizeTokens(BoxUtilityDeprecated.marginVertical);

@Deprecated('Use marginInsets instead')
const mi = BoxUtility.marginInsets;

@Deprecated('Use marginOnly instead')
const marginTop = WithSizeTokens(BoxUtilityDeprecated.marginTop);

@Deprecated('Use marginOnly instead')
const marginBottom = WithSizeTokens(BoxUtilityDeprecated.marginBottom);

@Deprecated('Use marginOnly instead')
const marginRight = WithSizeTokens(BoxUtilityDeprecated.marginRight);

@Deprecated('Use marginOnly instead')
const marginLeft = WithSizeTokens(BoxUtilityDeprecated.marginLeft);

@Deprecated('Use marginOnly instead')
const marginStart = WithSizeTokens(BoxUtilityDeprecated.marginStart);

@Deprecated('Use marginOnly instead')
const marginEnd = WithSizeTokens(BoxUtilityDeprecated.marginEnd);

@Deprecated('Use marginX instead')
const marginHorizontal = WithSizeTokens(BoxUtilityDeprecated.marginHorizontal);

@Deprecated('Use marginY instead')
const marginVertical = WithSizeTokens(BoxUtilityDeprecated.marginVertical);

// Padding

@Deprecated('Use padding instead')
const p = WithSizeTokens(BoxUtility.padding);

@Deprecated('Use paddingOnly instead')
const pt = WithSizeTokens(BoxUtilityDeprecated.paddingTop);

@Deprecated('Use paddingOnly instead')
const pb = WithSizeTokens(BoxUtilityDeprecated.paddingBottom);

@Deprecated('Use paddingOnly instead')
const pr = WithSizeTokens(BoxUtilityDeprecated.paddingRight);

@Deprecated('Use paddingOnly instead')
const pl = WithSizeTokens(BoxUtilityDeprecated.paddingLeft);

@Deprecated('Use paddingOnly instead')
const ps = WithSizeTokens(BoxUtilityDeprecated.paddingStart);

@Deprecated('Use paddingOnly instead')
const pe = WithSizeTokens(BoxUtilityDeprecated.paddingEnd);

@Deprecated('Use paddingX instead')
const px = WithSizeTokens(BoxUtilityDeprecated.paddingHorizontal);

@Deprecated('Use paddingY instead')
const py = WithSizeTokens(BoxUtilityDeprecated.paddingVertical);

@Deprecated('Use paddingInsets instead')
const pi = BoxUtility.paddingInsets;

@Deprecated('Use paddingOnly instead')
const paddingTop = WithSizeTokens(BoxUtilityDeprecated.paddingTop);

@Deprecated('Use paddingOnly instead')
const paddingBottom = WithSizeTokens(BoxUtilityDeprecated.paddingBottom);

@Deprecated('Use paddingOnly instead')
const paddingRight = WithSizeTokens(BoxUtilityDeprecated.paddingRight);

@Deprecated('Use paddingOnly instead')
const paddingLeft = WithSizeTokens(BoxUtilityDeprecated.paddingLeft);

@Deprecated('Use paddingOnly instead')
const paddingStart = WithSizeTokens(BoxUtilityDeprecated.paddingStart);

@Deprecated('Use paddingOnly instead')
const paddingEnd = WithSizeTokens(BoxUtilityDeprecated.paddingEnd);

@Deprecated('Use paddingX instead')
const paddingHorizontal =
    WithSizeTokens(BoxUtilityDeprecated.paddingHorizontal);

@Deprecated('Use paddingY instead')
const paddingVertical = WithSizeTokens(BoxUtilityDeprecated.paddingVertical);

// Height and Width

@Deprecated('Use height instead')
const h = BoxUtility.height;

@Deprecated('Use width instead')
const w = BoxUtility.width;

@Deprecated('Use maxHeight instead')
const maxH = BoxUtility.maxHeight;

@Deprecated('Use maxWidth instead')
const maxW = BoxUtility.maxWidth;

@Deprecated('Use minHeight instead')
const minH = BoxUtility.minHeight;

@Deprecated('Use minWidth instead')
const minW = BoxUtility.minWidth;

// Border

@Deprecated('Use borderTop instead')
const bt = BoxUtility.borderTop;

@Deprecated('Use borderBottom instead')
const bb = BoxUtility.borderBottom;

@Deprecated('Use borderLeft instead')
const bl = BoxUtility.borderLeft;

@Deprecated('Use borderRight instead')
const br = BoxUtility.borderRight;

@Deprecated('Use borderStart instead')
const bs = BoxUtility.borderStart;

@Deprecated('Use borderEnd instead')
const be = BoxUtility.borderEnd;

// Rounded

@Deprecated('Use rounded instead')
const r = BoxUtility.rounded;
