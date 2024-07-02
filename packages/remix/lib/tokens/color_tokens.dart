import 'package:flutter/rendering.dart';
import 'package:mix/mix.dart';
import 'package:remix/helpers/color_palette.dart';

class RemixColor {
  RemixColor();

  final accent1 = const ColorToken('--accent-1');
  final accent2 = const ColorToken('--accent-2');
  final accent3 = const ColorToken('--accent-3');
  final accent4 = const ColorToken('--accent-4');
  final accent5 = const ColorToken('--accent-5');
  final accent6 = const ColorToken('--accent-6');
  final accent7 = const ColorToken('--accent-7');
  final accent8 = const ColorToken('--accent-8');
  final accent9 = const ColorToken('--accent-9');
  final accent10 = const ColorToken('--accent-10');
  final accent11 = const ColorToken('--accent-11');
  final accent12 = const ColorToken('--accent-12');
  final accent1A = const ColorToken('--accent-1a');
  final accent2A = const ColorToken('--accent-2a');
  final accent3A = const ColorToken('--accent-3a');
  final accent4A = const ColorToken('--accent-4a');
  final accent5A = const ColorToken('--accent-5a');
  final accent6A = const ColorToken('--accent-6a');
  final accent7A = const ColorToken('--accent-7a');
  final accent8A = const ColorToken('--accent-8a');
  final accent9A = const ColorToken('--accent-9a');
  final accent10A = const ColorToken('--accent-10a');
  final accent11A = const ColorToken('--accent-11a');
  final accent12A = const ColorToken('--accent-12a');

  final neutral1 = const ColorToken('--neutral-1');
  final neutral2 = const ColorToken('--neutral-2');
  final neutral3 = const ColorToken('--neutral-3');
  final neutral4 = const ColorToken('--neutral-4');
  final neutral5 = const ColorToken('--neutral-5');
  final neutral6 = const ColorToken('--neutral-6');
  final neutral7 = const ColorToken('--neutral-7');
  final neutral8 = const ColorToken('--neutral-8');
  final neutral9 = const ColorToken('--neutral-9');
  final neutral10 = const ColorToken('--neutral-10');
  final neutral11 = const ColorToken('--neutral-11');
  final neutral12 = const ColorToken('--neutral-12');
  final neutral1A = const ColorToken('--neutral-1a');
  final neutral2A = const ColorToken('--neutral-2a');
  final neutral3A = const ColorToken('--neutral-3a');
  final neutral4A = const ColorToken('--neutral-4a');
  final neutral5A = const ColorToken('--neutral-5a');
  final neutral6A = const ColorToken('--neutral-6a');
  final neutral7A = const ColorToken('--neutral-7a');
  final neutral8A = const ColorToken('--neutral-8a');
  final neutral9A = const ColorToken('--neutral-9a');
  final neutral10A = const ColorToken('--neutral-10a');
  final neutral11A = const ColorToken('--neutral-11a');
  final neutral12A = const ColorToken('--neutral-12a');
}

final _c = RemixColor();

Map<ColorToken, Color> _mapColorRadixTokens({
  required RadixColors accent,
  required RadixColors neutral,
}) {
  return {
    _c.accent1: accent.s1,
    _c.accent2: accent.s2,
    _c.accent3: accent.s3,
    _c.accent4: accent.s4,
    _c.accent5: accent.s5,
    _c.accent6: accent.s6,
    _c.accent7: accent.s7,
    _c.accent8: accent.s8,
    _c.accent9: accent.s9,
    _c.accent10: accent.s10,
    _c.accent11: accent.s11,
    _c.accent12: accent.s12,
    _c.accent1A: accent.s1Alpha,
    _c.accent2A: accent.s2Alpha,
    _c.accent3A: accent.s3Alpha,
    _c.accent4A: accent.s4Alpha,
    _c.accent5A: accent.s5Alpha,
    _c.accent6A: accent.s6Alpha,
    _c.accent7A: accent.s7Alpha,
    _c.accent8A: accent.s8Alpha,
    _c.accent9A: accent.s9Alpha,
    _c.accent10A: accent.s10Alpha,
    _c.accent11A: accent.s11Alpha,
    _c.accent12A: accent.s12Alpha,
    _c.neutral1: neutral.s1,
    _c.neutral2: neutral.s2,
    _c.neutral3: neutral.s3,
    _c.neutral4: neutral.s4,
    _c.neutral5: neutral.s5,
    _c.neutral6: neutral.s6,
    _c.neutral7: neutral.s7,
    _c.neutral8: neutral.s8,
    _c.neutral9: neutral.s9,
    _c.neutral10: neutral.s10,
    _c.neutral11: neutral.s11,
    _c.neutral12: neutral.s12,
    _c.neutral1A: neutral.s1Alpha,
    _c.neutral2A: neutral.s2Alpha,
    _c.neutral3A: neutral.s3Alpha,
    _c.neutral4A: neutral.s4Alpha,
    _c.neutral5A: neutral.s5Alpha,
    _c.neutral6A: neutral.s6Alpha,
    _c.neutral7A: neutral.s7Alpha,
    _c.neutral8A: neutral.s8Alpha,
    _c.neutral9A: neutral.s9Alpha,
    _c.neutral10A: neutral.s10Alpha,
    _c.neutral11A: neutral.s11Alpha,
    _c.neutral12A: neutral.s12Alpha,
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
