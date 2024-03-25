import 'package:meta/meta.dart';

import '../tokens/radius_token.dart';
import '../tokens/space_token.dart';

@immutable
class MixTokens {
  final space = const _MixSpaces();
  final radius = const _MixRadii();

  const MixTokens();
}

@immutable
class _MixSpaces {
  final large = const SpaceToken('mix.space.large');
  final medium = const SpaceToken('mix.space.medium');
  final small = const SpaceToken('mix.space.small');

  const _MixSpaces();
}

@immutable
class _MixRadii {
  final small = const RadiusToken('mix.radius.small');
  final medium = const RadiusToken('mix.radius.medium');
  final large = const RadiusToken('mix.radius.large');

  const _MixRadii();
}
