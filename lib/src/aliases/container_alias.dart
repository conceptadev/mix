import '../../mix.dart';

final margin = WrapWithSpaceTokens(const ContainerStyleUtilities().margin);
final marginTop =
    WrapWithSpaceTokens(const ContainerStyleUtilities().marginTop);
final marginBottom =
    WrapWithSpaceTokens(const ContainerStyleUtilities().marginBottom);
final marginRight =
    WrapWithSpaceTokens(const ContainerStyleUtilities().marginRight);
final marginLeft =
    WrapWithSpaceTokens(const ContainerStyleUtilities().marginLeft);
final marginDirectionalStart = WrapWithSpaceTokens(
  const ContainerStyleUtilities().marginDirectionalStart,
);

final marginDirectionalEnd = WrapWithSpaceTokens(
  const ContainerStyleUtilities().marginDirectionalEnd,
);

final marginSymmetric = const ContainerStyleUtilities().marginSymmetric;
final marginHorizontal = const ContainerStyleUtilities().marginHorizontal;
final marginVertical = const ContainerStyleUtilities().marginVertical;

final marginInsets = const ContainerStyleUtilities().marginInsets;

final padding = WrapWithSpaceTokens(const ContainerStyleUtilities().padding);
final paddingTop =
    WrapWithSpaceTokens(const ContainerStyleUtilities().paddingTop);
final paddingBottom =
    WrapWithSpaceTokens(const ContainerStyleUtilities().paddingBottom);
final paddingRight =
    WrapWithSpaceTokens(const ContainerStyleUtilities().paddingRight);
final paddingLeft =
    WrapWithSpaceTokens(const ContainerStyleUtilities().paddingLeft);

final paddingSymmetric = const ContainerStyleUtilities().paddingSymmetric;
final paddingHorizontal = const ContainerStyleUtilities().paddingHorizontal;
final paddingVertical = const ContainerStyleUtilities().paddingVertical;
final paddingInsets = const ContainerStyleUtilities().paddingInsets;

final paddingDirectionalStart = WrapWithSpaceTokens(
  const ContainerStyleUtilities().paddingDirectionalStart,
);
final paddingDirectionalEnd = WrapWithSpaceTokens(
  const ContainerStyleUtilities().paddingDirectionalEnd,
);

final paddingDirectionalTop = WrapWithSpaceTokens(
  const ContainerStyleUtilities().paddingDirectionalTop,
);

final paddingDirectionalBottom = WrapWithSpaceTokens(
  const ContainerStyleUtilities().paddingDirectionalBottom,
);

// Transform.
final transform = const ContainerStyleUtilities().transform;

/// Background color attribute.
final backgroundColor = const ContainerStyleUtilities().backgroundColor;

/// Height.
final height = const ContainerStyleUtilities().height;

/// Width.
final width = const ContainerStyleUtilities().width;

/// Max height attribute.
final maxHeight = const ContainerStyleUtilities().maxHeight;

/// Max width attribute.
final maxWidth = const ContainerStyleUtilities().maxWidth;

/// Min height attribute.
final minHeight = const ContainerStyleUtilities().minHeight;

/// Min width attribute.
final minWidth = const ContainerStyleUtilities().minWidth;

/// Border.
final border = const ContainerStyleUtilities().border;
final borderTop = const ContainerStyleUtilities().borderTop;
final borderBottom = const ContainerStyleUtilities().borderBottom;
final borderLeft = const ContainerStyleUtilities().borderLeft;
final borderRight = const ContainerStyleUtilities().borderRight;

// Border Directional.
final borderDirectionalTop =
    const ContainerStyleUtilities().borderDirectionalTop;
final borderDirectionalBottom =
    const ContainerStyleUtilities().borderDirectionalBottom;
final borderDirectionalStart =
    const ContainerStyleUtilities().borderDirectionalStart;
final borderDirectionalEnd =
    const ContainerStyleUtilities().borderDirectionalEnd;

/// Box shadow utility.
final shadow = const ContainerStyleUtilities().shadow;

final squared = const ContainerStyleUtilities().squared;

final rounded = const ContainerStyleUtilities().rounded;
final roundedOnly = const ContainerStyleUtilities().roundedOnly;
final roundedHorizontal = const ContainerStyleUtilities().roundedHorizontal;
final roundedVertical = const ContainerStyleUtilities().roundedVertical;
final roundedDirectionalHorizontal =
    const ContainerStyleUtilities().roundedDirectionalHorizontal;
final roundedDirectionalVertical =
    const ContainerStyleUtilities().roundedDirectionalVertical;

final alignment = const ContainerStyleUtilities().alignment;

/// Elevation.
final elevation = const ContainerStyleUtilities().elevation;

/// Gradient.
final linearGradient = const ContainerStyleUtilities().linearGradient;
final radialGradient = const ContainerStyleUtilities().radialGradient;

const kShortAliasDeprecation =
    'Short aliases will be deprecated, you can create your own. Example: final p = padding;';

@Deprecated(kShortAliasDeprecation)
final p = padding;

@Deprecated(kShortAliasDeprecation)
final pt = paddingTop;

@Deprecated(kShortAliasDeprecation)
final pb = paddingBottom;

@Deprecated(kShortAliasDeprecation)
final pr = paddingRight;

@Deprecated(kShortAliasDeprecation)
final pl = paddingLeft;

@Deprecated(kShortAliasDeprecation)
final ps = paddingStart;

@Deprecated(kShortAliasDeprecation)
final pe = paddingEnd;

@Deprecated(kShortAliasDeprecation)
final px = paddingHorizontal;

@Deprecated(kShortAliasDeprecation)
final py = paddingVertical;

@Deprecated(kShortAliasDeprecation)
final pi = const ContainerStyleUtilities().paddingInsets;

@Deprecated(kShortAliasDeprecation)
final m = WrapWithSpaceTokens(const ContainerStyleUtilities().margin);
@Deprecated(kShortAliasDeprecation)
final mt = WrapWithSpaceTokens(const ContainerStyleUtilities().marginTop);
@Deprecated(kShortAliasDeprecation)
final mb = WrapWithSpaceTokens(const ContainerStyleUtilities().marginBottom);
@Deprecated(kShortAliasDeprecation)
final mr = WrapWithSpaceTokens(const ContainerStyleUtilities().marginRight);
@Deprecated(kShortAliasDeprecation)
final ml = WrapWithSpaceTokens(const ContainerStyleUtilities().marginLeft);
@Deprecated(kShortAliasDeprecation)
final ms = WrapWithSpaceTokens(const ContainerStyleUtilities().marginStart);
@Deprecated(kShortAliasDeprecation)
final me = WrapWithSpaceTokens(const ContainerStyleUtilities().marginEnd);
@Deprecated(kShortAliasDeprecation)
final mx =
    WrapWithSpaceTokens(const ContainerStyleUtilities().marginHorizontal);
@Deprecated(kShortAliasDeprecation)
final my = WrapWithSpaceTokens(const ContainerStyleUtilities().marginVertical);
@Deprecated(kShortAliasDeprecation)
final mi = const ContainerStyleUtilities().marginInsets;

@Deprecated(kShortAliasDeprecation)
final marginX = marginHorizontal;

@Deprecated(kShortAliasDeprecation)
final marginY = marginVertical;

@Deprecated(kShortAliasDeprecation)
final r = const ContainerStyleUtilities().rounded;

@Deprecated(kShortAliasDeprecation)
final roundedH = const ContainerStyleUtilities().roundedHorizontal;

@Deprecated(kShortAliasDeprecation)
final roundedV = const ContainerStyleUtilities().roundedVertical;

@Deprecated(kShortAliasDeprecation)
final roundedDH = const ContainerStyleUtilities().roundedDirectionalHorizontal;

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedTL(double value) {
  return const ContainerStyleUtilities().roundedOnly(topLeft: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedTR(double value) {
  return const ContainerStyleUtilities().roundedOnly(topRight: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedBL(double value) {
  return const ContainerStyleUtilities().roundedOnly(bottomLeft: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedBR(double value) {
  return const ContainerStyleUtilities().roundedOnly(bottomRight: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedTS(double value) {
  return const ContainerStyleUtilities()
      .roundedDirectionalOnly(topStart: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedTE(double value) {
  return const ContainerStyleUtilities().roundedDirectionalOnly(topEnd: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedBS(double value) {
  return const ContainerStyleUtilities()
      .roundedDirectionalOnly(bottomStart: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedBE(double value) {
  return const ContainerStyleUtilities()
      .roundedDirectionalOnly(bottomEnd: value);
}

@Deprecated(kShortAliasDeprecation)
final bgColor = const ContainerStyleUtilities().backgroundColor;

@Deprecated(kShortAliasDeprecation)
final h = const ContainerStyleUtilities().height;

@Deprecated(kShortAliasDeprecation)
final w = const ContainerStyleUtilities().width;

@Deprecated(kShortAliasDeprecation)
final maxH = const ContainerStyleUtilities().maxHeight;

@Deprecated(kShortAliasDeprecation)
final maxW = const ContainerStyleUtilities().maxWidth;

@Deprecated(kShortAliasDeprecation)
final minH = const ContainerStyleUtilities().minHeight;

@Deprecated(kShortAliasDeprecation)
final minW = const ContainerStyleUtilities().minWidth;

@Deprecated(kShortAliasDeprecation)
final bt = const ContainerStyleUtilities().borderTop;

@Deprecated(kShortAliasDeprecation)
final bb = const ContainerStyleUtilities().borderBottom;

@Deprecated(kShortAliasDeprecation)
final bl = const ContainerStyleUtilities().borderLeft;

@Deprecated(kShortAliasDeprecation)
final br = const ContainerStyleUtilities().borderRight;

@Deprecated(kShortAliasDeprecation)
final bs = const ContainerStyleUtilities().borderStart;

@Deprecated(kShortAliasDeprecation)
final be = const ContainerStyleUtilities().borderEnd;

@Deprecated('Use paddingDirectionalStart instead')
final paddingStart =
    WrapWithSpaceTokens(const ContainerStyleUtilities().paddingStart);
@Deprecated('Use paddingDirectionalEnd instead')
final paddingEnd =
    WrapWithSpaceTokens(const ContainerStyleUtilities().paddingEnd);

@Deprecated('Use borderDirectionalStart instead')
final borderStart = const ContainerStyleUtilities().borderStart;

@Deprecated('Use borderDirectionalEnd instead')
final borderEnd = const ContainerStyleUtilities().borderEnd;

@Deprecated('Use border(color:color) instead')
final borderColor = const ContainerStyleUtilities().borderColor;

@Deprecated('Use border(width:width) instead')
final borderWidth = const ContainerStyleUtilities().borderWidth;

@Deprecated('Use border(color:color) instead')
final borderStyle = const ContainerStyleUtilities().borderStyle;

@Deprecated('Use alignment instead')
final align = alignment;

@Deprecated('Use marginDirectionalStart instead')
final marginStart =
    WrapWithSpaceTokens(const ContainerStyleUtilities().marginStart);
@Deprecated('Use marginDirectionalEnd instead')
final marginEnd =
    WrapWithSpaceTokens(const ContainerStyleUtilities().marginEnd);
