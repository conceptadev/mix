import 'mix_token.dart';

// Define default
class SpaceTokens {
  SpaceTokens._();

  // Define your tokens
  static const xsmall = SpaceToken('--mix-space-xsmall');
  static const small = SpaceToken('--mix-space-small');
  static const medium = SpaceToken('--mix-space-medium');
  static const large = SpaceToken('--mix-space-large');
  static const xlarge = SpaceToken('--mix-space-xlarge');
  static const xxlarge = SpaceToken('--mix-space-xxlarge');

  static MixSpaceTokens get tokens => {
        SpaceTokens.xsmall: (context) => 4.0,
        SpaceTokens.small: (context) => 8.0,
        SpaceTokens.medium: (context) => 16.0,
        SpaceTokens.large: (context) => 24.0,
        SpaceTokens.xlarge: (context) => 36.0,
        SpaceTokens.xxlarge: (context) => 72.0,
      };
}

/// A class representing a space token, which extends `MixToken` class
/// and uses the `SizeTokenMixin` mixin.
///
/// A space token defines a value for controlling the
/// size of UI elements.
class SpaceToken extends MixToken<double> with WithReferenceMixin<double> {
  /// A constant constructor that accepts a `String` argument named [name].
  /// Name needs to be unique per token
  ///
  /// [name] is used to initialize the superclass `MixToken`.
  const SpaceToken(super.name);
}

typedef MixSpaceTokens = TokenReferenceMap<SpaceToken, double>;

typedef MixSpaceTokensReference = Map<double, SpaceToken>;

// Helper class to wrap functions that can return
// Space tokens in their methods
class WrapWithSpaceTokens<T> {
  const WrapWithSpaceTokens(T Function(double value) fn) : _fn = fn;

  final T Function(double value) _fn;

  T call(double value) => _fn(value);

  T get xsmall => call(SpaceTokens.xsmall.ref);

  T get small => call(SpaceTokens.small.ref);

  T get medium => call(SpaceTokens.medium.ref);

  T get large => call(SpaceTokens.large.ref);

  T get xlarge => call(SpaceTokens.xlarge.ref);

  T get xxlarge => call(SpaceTokens.xxlarge.ref);

  @Deprecated('Use medium instead')
  T get md => medium;
  @Deprecated('Use small instead')
  T get sm => small;
  @Deprecated('Use large instead')
  T get lg => large;
  @Deprecated('Use xlarge instead')
  T get xl => xlarge;
  @Deprecated('Use xsmall instead')
  T get xs => xsmall;
  @Deprecated('Use xxlarge instead')
  T get xxl => xxlarge;
}
