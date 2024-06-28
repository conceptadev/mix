import 'package:mix/mix.dart';

const _space1 = SpaceToken('space1');
const _space2 = SpaceToken('space2');
const _space3 = SpaceToken('space3');
const _space4 = SpaceToken('space4');
const _space5 = SpaceToken('space5');
const _space6 = SpaceToken('space6');
const _space7 = SpaceToken('space7');
const _space8 = SpaceToken('space8');
const _space9 = SpaceToken('space9');

class RemixSpace {
  const RemixSpace();

  final s1 = _space1;
  final s2 = _space2;
  final s3 = _space3;
  final s4 = _space4;
  final s5 = _space5;
  final s6 = _space6;
  final s7 = _space7;
  final s8 = _space8;
  final s9 = _space9;
}

const _radii = RemixSpace();
final remixSpaceTokens = <SpaceToken, double>{
  _radii.s1: 4,
  _radii.s2: 8,
  _radii.s3: 12,
  _radii.s4: 16,
  _radii.s5: 24,
  _radii.s6: 32,
  _radii.s7: 40,
  _radii.s8: 48,
  _radii.s9: 64,
};
