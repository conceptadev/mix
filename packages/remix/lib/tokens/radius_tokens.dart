part of 'remix_tokens.dart';

class RemixRadius {
  RemixRadius();

  final radius1 = const RadiusToken('--radius-1');
  final radius2 = const RadiusToken('--radius-2');
  final radius3 = const RadiusToken('--radius-3');
  final radius4 = const RadiusToken('--radius-4');
  final radius5 = const RadiusToken('--radius-5');
  final radius6 = const RadiusToken('--radius-6');
}

final _r = RemixRadius();
final remixRadiusTokens = <RadiusToken, Radius>{
  _r.radius1: const Radius.circular(4),
  _r.radius2: const Radius.circular(8),
  _r.radius3: const Radius.circular(12),
  _r.radius4: const Radius.circular(16),
  _r.radius5: const Radius.circular(24),
  _r.radius6: const Radius.circular(32),
};
