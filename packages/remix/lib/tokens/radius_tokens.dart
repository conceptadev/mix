import 'package:flutter/rendering.dart';
import 'package:mix/mix.dart';

const _radius1 = RadiusToken('r1');
const _radius2 = RadiusToken('r2');
const _radius3 = RadiusToken('r3');
const _radius4 = RadiusToken('r4');
const _radius5 = RadiusToken('r5');
const _radius6 = RadiusToken('r6');

class RemixRadius {
  const RemixRadius();

  final r1 = _radius1;
  final r2 = _radius2;
  final r3 = _radius3;
  final r4 = _radius4;
  final r5 = _radius5;
  final r6 = _radius6;
}

const _radii = RemixRadius();
final remixRadiusTokens = <RadiusToken, Radius>{
  _radii.r1: const Radius.circular(4),
  _radii.r2: const Radius.circular(8),
  _radii.r3: const Radius.circular(12),
  _radii.r4: const Radius.circular(16),
  _radii.r5: const Radius.circular(24),
  _radii.r6: const Radius.circular(32),
};
