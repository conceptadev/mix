// Allow to use space tokens references within mix.
import '../../mix.dart';

final $space = _SpaceTokensRef();

class _SpaceTokensRef {
  static final instance = _SpaceTokensRef._();

  final xsmall = SpaceTokens.xsmall.ref;
  final small = SpaceTokens.small.ref;
  final medium = SpaceTokens.medium.ref;
  final large = SpaceTokens.large.ref;
  final xlarge = SpaceTokens.xlarge.ref;
  final xxlarge = SpaceTokens.xxlarge.ref;
  _SpaceTokensRef._();

  factory _SpaceTokensRef() => instance;
}
