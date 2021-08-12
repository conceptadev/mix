// ignore_for_file: camel_case_types
import 'package:mix/src/attributes/directives/text_modifier.dart';
import 'package:mix/src/attributes/dynamic/media_query.dart';
import 'package:mix/src/attributes/text/text_style.dart';
import 'package:mix/src/mixer/mix_attribute.dart';

import '../attributes/dynamic/dark_mode.dart';
import 'dynamic/hidden.dart';
import 'icon/icon_size.dart';
import 'layout/aspect_ratio.dart';
import 'layout/flex.dart';
import 'painting/alignment.dart';
import 'painting/border_radius.dart';
import 'painting/border_side.dart';
import 'painting/box_fit.dart';
import 'painting/opacity.dart';
import 'painting/rotate.dart';
import 'painting/shadow.dart';
import 'primitives/color.dart';
import 'primitives/size.dart';
import 'primitives/space.dart';
import 'rendering/flex/cross_axis_alignment.dart';
import 'rendering/flex/flex_fit.dart';
import 'rendering/flex/main_axis_alignment.dart';
import 'rendering/flex/main_axis_size.dart';
import 'text/debug_label.dart';
import 'text/font_family.dart';
import 'text/font_size.dart';
import 'text/font_style.dart';
import 'text/font_weight.dart';
import 'text/letter_spacing.dart';
import 'text/locale.dart';
import 'text/max_lines.dart';
import 'text/soft_wrap.dart';
import 'text/text_align.dart';
import 'text/text_baseline.dart';
import 'text/text_direction.dart';
import 'text/text_height.dart';
import 'text/text_overflow.dart';
import 'text/text_scale_factor.dart';
import 'text/text_width_basis.dart';
import 'text/word_spacing.dart';

const marginUtility = SpaceUtility<MarginAttribute>();

/// Margin all
final m = marginUtility.all;

/// Margin top

final mt = marginUtility.top;

/// Margin bottom
final mb = marginUtility.bottom;

/// Margin right
final mr = marginUtility.right;

/// Margin left
final ml = marginUtility.left;

/// Margin horizontal
final mx = marginUtility.horizontal;

/// Margin verttical
final my = marginUtility.vertical;

const paddingUtility = SpaceUtility<PaddingAttribute>();

/// Padding all
final p = paddingUtility.all;

/// Padding top
final pt = paddingUtility.top;

/// Padding bottom
final pb = paddingUtility.bottom;

/// Padding right
final pr = paddingUtility.right;

/// Padding left
final pl = paddingUtility.left;

/// Padding horizontal
final px = paddingUtility.horizontal;

/// Padding verttical
final py = paddingUtility.vertical;

/// Rotate widget
const rotate = RotateUtility();

/// Opacity
const opacity = OpacityUtility();

/// Flex
const flex = FlexUtility();

/// Flex fit
const flexFit = FlexFitUtility();

/// Flexible
final flexible = flexFit.loose;

/// Expand
final expanded = flexFit.tight;

/// Flex Align
const mainAxis = MainAxisAlignmentUtility();
const crossAxis = CrossAxisAligmentUtility();

const axisSize = MainAxisSizeUtility();

/// Axis
// final axis = AxisUtility();

/// Fitting
const fit = BoxFitUtility();

/// Aspect Ratio
const aspectRatio = AspectRatioUtility();

/// Border radius
const borderRadius = BorderRadiusUtility();
final rounded = borderRadius.fromParams;
final roundedTopLeft = borderRadius.topLeft;
final roundedTopRight = borderRadius.topRight;
final roundedBottomLeft = borderRadius.bottomLeft;
final roundedBottomRight = borderRadius.bottomRight;

/// Background color attribute
const backgroundColor = ColorUtility<BackgroundColorAttribute>();
const bgColor = backgroundColor;

/// Text color attribute
const textColor = ColorUtility<TextColorAttribute>();

/// Aligment
const align = AlignmentUtility();

/// Alignment center
final center = align.center;

/// Alignment bottomCenter
final bottomCenter = align.bottomCenter;

/// Alignment bottomLeft
final bottomLeft = align.bottomLeft;

/// Alignment bottomRight
final bottomRight = align.bottomRight;

/// Alignment topCenter
final topCenter = align.topCenter;

/// Alignment topLeft
final topLeft = align.topLeft;

/// Alignment topRight
final topRight = align.topRight;

/// Height
const h = SizeUtility<HeightAttribute>();

/// Width
const w = SizeUtility<WidthAttribute>();

/// Max height attribute
const maxH = SizeUtility<MaxHeightAttribute>();

/// Min height attribute
const minH = SizeUtility<MinHeightAttribute>();

/// Max width attribute
const maxW = SizeUtility<MaxWidthAttribute>();

/// Min width attribute
const minW = SizeUtility<MinWidthAttribute>();

/// Gap
const gap = SizeUtility<GapAttribute>();

/// Hide attribute
const hide = HideUtility();

final _borderAllUtility = BorderSideUtility.all();

/// Border color for all borde sides
final borderColor = _borderAllUtility.color;

/// Border width for all border sides
final borderWidth = _borderAllUtility.width;

/// Border style for all border sides
final borderStyle = _borderAllUtility.style;

final _borderLeftUtility = BorderSideUtility.left();

/// Border color for left borde side
final borderLeftColor = _borderLeftUtility.color;

/// Border width for left border side
final borderLeftWidth = _borderLeftUtility.width;

/// Border style for left border side
final borderLeftStyle = _borderLeftUtility.style;

final _borderTopUtility = BorderSideUtility.top();

/// Border color for top borde side
final borderTopColor = _borderTopUtility.color;

/// Border width for top border side
final borderTopWidth = _borderTopUtility.width;

/// Border style for top border side
final borderTopStyle = _borderTopUtility.style;

final _borderRightUtility = BorderSideUtility.right();

/// Border color for right borde side
final borderRightColor = _borderRightUtility.color;

/// Border width for right border side
final borderRightWidth = _borderRightUtility.width;

/// Border style for right border side
final borderRightStyle = _borderRightUtility.style;

final _borderBottomUtility = BorderSideUtility.bottom();

/// Border color for bottom borde side
final borderBottomColor = _borderBottomUtility.color;

/// Border width for bottom border side
final borderBottomWidth = _borderBottomUtility.width;

/// Border style for bottom border side
final borderBottomStyle = _borderBottomUtility.style;

/// Box shadow utility
const shadow = BoxShadowUtility();

/// Shadow offset
final shadowOffset = shadow.offset;

/// Shadow spread radius
final shadowSpread = shadow.spreadRadius;

/// Shadow blur radius
final shadowBlur = shadow.blurRadius;

/// Shadow color
final shadowColor = shadow.color;

/// Text align
const textAlign = TextAlignUtility();
const fontWeight = FontWeightUtility();
const textBaseline = TextBaselineUtility();
const fontStyle = FontStyleUtility();
const textDirection = TextDirectionUtility();
const textWidthBasis = TextWidthBasisUtility();
const textOverflow = TextOverflowUtility();
const locale = LocaleUtility();
const fontFamily = FontFamilyUtility();
const maxLines = MaxLinesUtility();
const fontSize = FontSizeUtility();

const wordSpacing = WordSpacingUtility();
const letterSpacing = LetterSpacingUtility();
const softWrap = SoftWrapUtility();
const textScaleFactor = TextScaleFactorUtility();
const debugLabel = DebugLabelUtility();
const textHeight = TextHeightUtility();
const textStyle = TextStyleUtility();

/// Icon Size
const iconSize = IconSizeUtility();

/// Icon color attribute
const iconColor = ColorUtility<IconColorAttribute>();

/// Dynamic Attributes
const dark = DarkModeUtility();

/// Media query utility
const mq = MediaQueryUtility();

// Modifiers
/// Capitalizes text
const capitalize = TextDirectiveAttribute(CapitalizeDirective());
const upperCase = TextDirectiveAttribute(UpperCaseDirective());
const lowerCase = TextDirectiveAttribute(LowerCaseDirective());
const titleCase = TextDirectiveAttribute(TitleCaseDirective());
const sentenceCase = TextDirectiveAttribute(SentenceCaseDirective());

const apply = ApplyMixUtility();
