import 'package:flutter/rendering.dart';
import 'package:mix/mix.dart';
import 'package:remix/helpers/color_palette.dart';

const _accent1 = ColorToken('accent.1');
const _accent2 = ColorToken('accent.2');
const _accent3 = ColorToken('accent.3');
const _accent4 = ColorToken('accent.4');
const _accent5 = ColorToken('accent.5');
const _accent6 = ColorToken('accent.6');
const _accent7 = ColorToken('accent.7');
const _accent8 = ColorToken('accent.8');
const _accent9 = ColorToken('accent.9');
const _accent10 = ColorToken('accent.10');
const _accent11 = ColorToken('accent.11');
const _accent12 = ColorToken('accent.12');
const _accent1A = ColorToken('accent.1.alpha');
const _accent2A = ColorToken('accent.2.alpha');
const _accent3A = ColorToken('accent.3.alpha');
const _accent4A = ColorToken('accent.4.alpha');
const _accent5A = ColorToken('accent.5.alpha');
const _accent6A = ColorToken('accent.6.alpha');
const _accent7A = ColorToken('accent.7.alpha');
const _accent8A = ColorToken('accent.8.alpha');
const _accent9A = ColorToken('accent.9.alpha');
const _accent10A = ColorToken('accent.10.alpha');
const _accent11A = ColorToken('accent.11.alpha');
const _accent12A = ColorToken('accent.12.alpha');

const _neutral1 = ColorToken('neutral.1');
const _neutral2 = ColorToken('neutral.2');
const _neutral3 = ColorToken('neutral.3');
const _neutral4 = ColorToken('neutral.4');
const _neutral5 = ColorToken('neutral.5');
const _neutral6 = ColorToken('neutral.6');
const _neutral7 = ColorToken('neutral.7');
const _neutral8 = ColorToken('neutral.8');
const _neutral9 = ColorToken('neutral.9');
const _neutral10 = ColorToken('neutral.10');
const _neutral11 = ColorToken('neutral.11');
const _neutral12 = ColorToken('neutral.12');
const _neutral1A = ColorToken('neutral.1.alpha');
const _neutral2A = ColorToken('neutral.2.alpha');
const _neutral3A = ColorToken('neutral.3.alpha');
const _neutral4A = ColorToken('neutral.4.alpha');
const _neutral5A = ColorToken('neutral.5.alpha');
const _neutral6A = ColorToken('neutral.6.alpha');
const _neutral7A = ColorToken('neutral.7.alpha');
const _neutral8A = ColorToken('neutral.8.alpha');
const _neutral9A = ColorToken('neutral.9.alpha');
const _neutral10A = ColorToken('neutral.10.alpha');
const _neutral11A = ColorToken('neutral.11.alpha');
const _neutral12A = ColorToken('neutral.12.alpha');

class RemixColor {
  const RemixColor();

  final accent1 = _accent1;
  final accent2 = _accent2;
  final accent3 = _accent3;
  final accent4 = _accent4;
  final accent5 = _accent5;
  final accent6 = _accent6;
  final accent7 = _accent7;
  final accent8 = _accent8;
  final accent9 = _accent9;
  final accent10 = _accent10;
  final accent11 = _accent11;
  final accent12 = _accent12;
  final accent1A = _accent1A;
  final accent2A = _accent2A;
  final accent3A = _accent3A;
  final accent4A = _accent4A;
  final accent5A = _accent5A;
  final accent6A = _accent6A;
  final accent7A = _accent7A;
  final accent8A = _accent8A;
  final accent9A = _accent9A;
  final accent10A = _accent10A;
  final accent11A = _accent11A;
  final accent12A = _accent12A;

  final neutral1 = _neutral1;
  final neutral2 = _neutral2;
  final neutral3 = _neutral3;
  final neutral4 = _neutral4;
  final neutral5 = _neutral5;
  final neutral6 = _neutral6;
  final neutral7 = _neutral7;
  final neutral8 = _neutral8;
  final neutral9 = _neutral9;
  final neutral10 = _neutral10;
  final neutral11 = _neutral11;
  final neutral12 = _neutral12;
  final neutral1A = _neutral1A;
  final neutral2A = _neutral2A;
  final neutral3A = _neutral3A;
  final neutral4A = _neutral4A;
  final neutral5A = _neutral5A;
  final neutral6A = _neutral6A;
  final neutral7A = _neutral7A;
  final neutral8A = _neutral8A;
  final neutral9A = _neutral9A;
  final neutral10A = _neutral10A;
  final neutral11A = _neutral11A;
  final neutral12A = _neutral12A;
}

Map<ColorToken, Color> _mapColorRadixTokens({
  required RadixColors accent,
  required RadixColors neutral,
}) {
  const color = RemixColor();
  return {
    color.accent1: accent.s1,
    color.accent2: accent.s2,
    color.accent3: accent.s3,
    color.accent4: accent.s4,
    color.accent5: accent.s5,
    color.accent6: accent.s6,
    color.accent7: accent.s7,
    color.accent8: accent.s8,
    color.accent9: accent.s9,
    color.accent10: accent.s10,
    color.accent11: accent.s11,
    color.accent12: accent.s12,
    color.accent1A: accent.s1Alpha,
    color.accent2A: accent.s2Alpha,
    color.accent3A: accent.s3Alpha,
    color.accent4A: accent.s4Alpha,
    color.accent5A: accent.s5Alpha,
    color.accent6A: accent.s6Alpha,
    color.accent7A: accent.s7Alpha,
    color.accent8A: accent.s8Alpha,
    color.accent9A: accent.s9Alpha,
    color.accent10A: accent.s10Alpha,
    color.accent11A: accent.s11Alpha,
    color.accent12A: accent.s12Alpha,
    color.neutral1: neutral.s1,
    color.neutral2: neutral.s2,
    color.neutral3: neutral.s3,
    color.neutral4: neutral.s4,
    color.neutral5: neutral.s5,
    color.neutral6: neutral.s6,
    color.neutral7: neutral.s7,
    color.neutral8: neutral.s8,
    color.neutral9: neutral.s9,
    color.neutral10: neutral.s10,
    color.neutral11: neutral.s11,
    color.neutral12: neutral.s12,
    color.neutral1A: neutral.s1Alpha,
    color.neutral2A: neutral.s2Alpha,
    color.neutral3A: neutral.s3Alpha,
    color.neutral4A: neutral.s4Alpha,
    color.neutral5A: neutral.s5Alpha,
    color.neutral6A: neutral.s6Alpha,
    color.neutral7A: neutral.s7Alpha,
    color.neutral8A: neutral.s8Alpha,
    color.neutral9A: neutral.s9Alpha,
    color.neutral10A: neutral.s10Alpha,
    color.neutral11A: neutral.s11Alpha,
    color.neutral12A: neutral.s12Alpha,
  };
}

final remixColorTokens = _mapColorRadixTokens(
  accent: RadixColors.indigo,
  neutral: RadixColors.gray,
);
final remixDarkColorTokens = _mapColorRadixTokens(
  accent: RadixColors.indigoDark,
  neutral: RadixColors.grayDark,
);
