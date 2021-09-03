import 'package:mix/src/attributes/primitives/painting/alignment.dart';
import 'package:mix/src/attributes/primitives/painting/border_radius.dart';
import 'package:mix/src/utilities/apply_mix.dart';
import 'package:mix/src/utilities/dynamic/dark_mode.dart';
import 'package:mix/src/utilities/dynamic/media_query.dart';
import 'package:mix/src/utilities/gap.dart';
import 'package:mix/src/utilities/modifiers/text_modifier.dart';

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
