part of '../remix_theme.dart';

class RemixSpace {
  final space1 = const SpaceToken('--space-1');
  final space2 = const SpaceToken('--space-2');
  final space3 = const SpaceToken('--space-3');
  final space4 = const SpaceToken('--space-4');
  final space5 = const SpaceToken('--space-5');
  final space6 = const SpaceToken('--space-6');
  final space7 = const SpaceToken('--space-7');
  final space8 = const SpaceToken('--space-8');
  final space9 = const SpaceToken('--space-9');

  RemixSpace();

  operator [](int index) {
    return call(index);
  }

  SpaceToken call(int step) {
    return switch (step) {
      1 => space1,
      2 => space2,
      3 => space3,
      4 => space4,
      5 => space5,
      6 => space6,
      7 => space7,
      8 => space8,
      9 => space9,
      _ => throw ArgumentError('Invalid space step: $step'),
    };
  }
}

final _s = RemixSpace();
final remixSpaceTokens = {
  _s.space1: 4.0,
  _s.space2: 8.0,
  _s.space3: 12.0,
  _s.space4: 16.0,
  _s.space5: 24.0,
  _s.space6: 32.0,
  _s.space7: 40.0,
  _s.space8: 48.0,
  _s.space9: 64.0,
};
