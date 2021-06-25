// ignore_for_file: camel_case_types
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

final marginUtility = SpaceUtility<MarginAttribute>();

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

final paddingUtility = SpaceUtility<PaddingAttribute>();

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
final rotate = RotateUtility();

/// Opacity
final opacity = OpacityUtility();

/// Flex
final flex = FlexUtility();

/// Flex fit
final flexFit = FlexFitUtility();

/// Flexible
final flexible = flexFit.loose;

/// Expand
final expanded = flexFit.tight;

/// Flex Align
final mainAxis = MainAxisAlignmentUtility();
final crossAxis = CrossAxisAligmentUtility();

final axisSize = MainAxisSizeUtility();

/// Axis
// final axis = AxisUtility();

/// Fitting
final fit = BoxFitUtility();

/// Aspect Ratio
final aspectRatio = AspectRationUtility();

/// Border radius
final borderRadius = BorderRadiusUtility();
final rounded = borderRadius.fromParams;
final roundedTopLeft = borderRadius.topLeft;
final roundedTopRight = borderRadius.topRight;
final roundedBottomLeft = borderRadius.bottomLeft;
final roundedBottomRight = borderRadius.bottomRight;

/// Background color attribute
final backgroundColor = ColorUtility<BackgroundColorAttribute>();
final bgColor = backgroundColor;

/// Text color attribute
final textColor = ColorUtility<TextColorAttribute>();

/// Aligment
final align = AlignmentUtility();

/// Alignment center
final center = align.center;

/// Height
final h = SizeUtility<HeightAttribute>();

/// Width
final w = SizeUtility<WidthAttribute>();

/// Max height attribute
final maxH = SizeUtility<MaxHeightAttribute>();

/// Min height attribute
final minH = SizeUtility<MinHeightAttribute>();

/// Max width attribute
final maxW = SizeUtility<MaxWidthAttribute>();

/// Min width attribute
final minW = SizeUtility<MinWidthAttribute>();

/// Gap
final gap = SizeUtility<GapAttribute>();

/// Hide attribute
final hide = HideUtility();

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

final boxShadow = BoxShadowUtility();

final textAlign = TextAlignUtility();
final fontWeight = FontWeightUtility();
final textBaseline = TextBaselineUtility();
final fontStyle = FontStyleUtility();
final textDirection = TextDirectionUtility();
final textWidthBasis = TextWidthBasisUtility();
final textOverflow = TextOverflowUtility();
final locale = LocaleUtility();
final fontFamily = FontFamilyUtility();
final maxLines = MaxLinesUtility();
final fontSize = FontSizeUtility();

final wordSpacing = WordSpacingUtility();
final letterSpacing = LetterSpacingUtility();
final softWrap = SoftWrapUtility();
final textScaleFactor = TextScaleFactorUtility();
final debugLabel = DebugLabelUtility();
final textHeight = TextHeightUtility();

/// Dynamic Attributes

final dark = DarkModeUtility();
final iconSize = IconSizeUtility();
