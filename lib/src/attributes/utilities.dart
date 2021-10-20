import 'package:mix/src/attributes/apply_mix.dart';
import 'package:mix/src/attributes/dynamic/dark_mode.dart';
import 'package:mix/src/attributes/dynamic/media_query.dart';
import 'package:mix/src/attributes/layout/gap.dart';
import 'package:mix/src/attributes/primitives/gestures/disabled.dart';
import 'package:mix/src/attributes/primitives/gestures/focused.dart';
import 'package:mix/src/attributes/primitives/gestures/hovering.dart';
import 'package:mix/src/attributes/primitives/gestures/pressing.dart';
import 'package:mix/src/attributes/primitives/icon/icon_color.dart';
import 'package:mix/src/attributes/primitives/layout/aspect_ratio.dart';
import 'package:mix/src/attributes/primitives/painting/background_color.dart';
import 'package:mix/src/attributes/primitives/text/text_color.dart';
import 'package:mix/src/attributes/primitives/text/text_style.dart';
import 'package:mix/src/directives/text_directive.dart';

import 'animation/animated_text.dart';
import 'base/size.dart';
import 'base/space.dart';
import 'dynamic/hidden.dart';
import 'primitives/icon/icon_size.dart';
import 'primitives/layout/flex.dart';
import 'primitives/painting/alignment.dart';
import 'primitives/painting/border_radius.dart';
import 'primitives/painting/border_side.dart';
import 'primitives/painting/box_fit.dart';
import 'primitives/painting/opacity.dart';
import 'primitives/painting/rotate.dart';
import 'primitives/painting/shadow.dart';
import 'primitives/rendering/flex/cross_axis_alignment.dart';
import 'primitives/rendering/flex/flex_fit.dart';
import 'primitives/rendering/flex/main_axis_alignment.dart';
import 'primitives/rendering/flex/main_axis_size.dart';
import 'primitives/text/debug_label.dart';
import 'primitives/text/font_family.dart';
import 'primitives/text/font_size.dart';
import 'primitives/text/font_style.dart';
import 'primitives/text/font_weight.dart';
import 'primitives/text/letter_spacing.dart';
import 'primitives/text/locale.dart';
import 'primitives/text/max_lines.dart';
import 'primitives/text/soft_wrap.dart';
import 'primitives/text/text_align.dart';
import 'primitives/text/text_baseline.dart';
import 'primitives/text/text_direction.dart';
import 'primitives/text/text_height.dart';
import 'primitives/text/text_overflow.dart';
import 'primitives/text/text_scale_factor.dart';
import 'primitives/text/text_width_basis.dart';
import 'primitives/text/word_spacing.dart';

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

/// Background color attribute
const backgroundColor = BackgroundColorUtility();
const bgColor = backgroundColor;

/// Animated text attribute
const animatedText = AnimatedTextUtility();

/// Text color attribute
const textColor = TextColorUtility();

/// Aligment
const align = AlignmentUtility();

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
const iconColor = IconColorUtility();

/// Rounded utility
const _br = BorderRadiusUtility();
final rounded = _br.fromParams;
final roundedTL = _br.topLeft;
final roundedTR = _br.topRight;
final roundedBL = _br.bottomLeft;
final roundedBR = _br.bottomRight;

/// Aligment
const _align = AlignmentUtility();

/// Alignment center
final center = _align.center;

/// Alignment bottomCenter
final bottomCenter = _align.bottomCenter;

/// Alignment bottomLeft
final bottomLeft = _align.bottomLeft;

/// Alignment bottomRight
final bottomRight = _align.bottomRight;

/// Alignment topCenter
final topCenter = _align.topCenter;

/// Alignment topLeft
final topLeft = _align.topLeft;

/// Alignment topRight
final topRight = _align.topRight;

/// Gap
const gap = GapSizeUtility();

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

// Gestures

const disabled = DisabledUtility();
const focused = FocusedUtility();
const hovering = HoveringUtility();
const pressing = PressingUtility();
