import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

const _text1 = TextStyleToken('text1');
const _text2 = TextStyleToken('text2');
const _text3 = TextStyleToken('text3');
const _text4 = TextStyleToken('text4');
const _text5 = TextStyleToken('text5');
const _text6 = TextStyleToken('text6');
const _text7 = TextStyleToken('text7');
const _text8 = TextStyleToken('text8');
const _text9 = TextStyleToken('text9');

class RemixTypography {
  const RemixTypography();

  final t1 = _text1;
  final t2 = _text2;
  final t3 = _text3;
  final t4 = _text4;
  final t5 = _text5;
  final t6 = _text6;
  final t7 = _text7;
  final t8 = _text8;
  final t9 = _text9;
}

const _typography = RemixTypography();

final remixTextTokens = <TextStyleToken, TextStyle>{
  _typography.t1: const TextStyle(
    inherit: false,
    fontSize: 12,
    letterSpacing: 0.0025,
    height: 1.2,
  ),
  _typography.t2: const TextStyle(
    inherit: false,
    fontSize: 14,
    letterSpacing: 0,
    height: 1.4,
  ),
  _typography.t3: const TextStyle(
    inherit: false,
    fontSize: 16,
    letterSpacing: 0,
    height: 1.2,
  ),
  _typography.t4: const TextStyle(
    inherit: false,
    fontSize: 18,
    letterSpacing: -0.0025,
    height: 1.2,
  ),
  _typography.t5: const TextStyle(
    fontSize: 20,
    letterSpacing: -0.005,
    height: 1.4,
  ),
  _typography.t6: const TextStyle(
    fontSize: 24,
    letterSpacing: -0.00625,
    height: 1.4,
  ),
  _typography.t7: const TextStyle(
    fontSize: 28,
    letterSpacing: -0.0075,
    height: 1.4,
  ),
  _typography.t8: const TextStyle(
    fontSize: 35,
    letterSpacing: -0.01,
    height: 1.4,
  ),
  _typography.t9: const TextStyle(
    fontSize: 60,
    letterSpacing: -0.025,
    height: 1.4,
  ),
};
