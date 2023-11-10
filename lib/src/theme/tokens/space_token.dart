import 'mix_token.dart';

final $space = _SpaceTokenUtil();

class _SpaceTokenUtil {
  final xsmall = SpaceToken.xsmall();
  final small = SpaceToken.small();
  final medium = SpaceToken.medium();
  final large = SpaceToken.large();
  final xlarge = SpaceToken.xlarge();
  final xxlarge = SpaceToken.xxlarge();
  _SpaceTokenUtil();
}

typedef SpaceTokenRef = double;

/// A class representing a space token, which extends `MixToken` class
/// and uses the `SizeTokenMixin` mixin.
///
/// A space token defines a value for controlling the
/// size of UI elements.
class SpaceToken extends MixToken<SpaceTokenRef> {
  static const xsmall = SpaceToken('--mix-space-xsmall');
  static const small = SpaceToken('--mix-space-small');
  static const medium = SpaceToken('--mix-space-medium');
  static const large = SpaceToken('--mix-space-large');
  static const xlarge = SpaceToken('--mix-space-xlarge');
  static const xxlarge = SpaceToken('--mix-space-xxlarge');

  /// A constant constructor that accepts a `String` argument named [name].
  /// Name needs to be unique per token
  ///
  /// [name] is used to initialize the superclass `MixToken`.
  const SpaceToken(super.name);

  double call() => hashCode * -1.0;
}

// Helper class to wrap functions that can return
// Space tokens in their methods
class WithSpaceTokens<T> {
  final T Function(double value) _fn;

  const WithSpaceTokens(T Function(double value) fn) : _fn = fn;

  T get xsmall => call(SpaceToken.xsmall());

  T get small => call(SpaceToken.small());

  T get medium => call(SpaceToken.medium());

  T get large => call(SpaceToken.large());

  T get xlarge => call(SpaceToken.xlarge());

  T get xxlarge => call(SpaceToken.xxlarge());

  @Deprecated('Use xsmall instead')
  T get xs => xsmall;
  @Deprecated('Use small instead')
  T get sm => small;
  @Deprecated('Use medium instead')
  T get md => medium;
  @Deprecated('Use large instead')
  T get lg => large;
  @Deprecated('Use xlarge instead')
  T get xl => xlarge;
  @Deprecated('Use xxlarge instead')
  T get xxl => xxlarge;

  T call(double value) => _fn(value);
}
