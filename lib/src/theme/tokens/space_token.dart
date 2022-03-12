import '../refs/space_ref.dart';

const $space = SpaceRef();

class MixThemeSpace {
  const MixThemeSpace._({
    required this.xsmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.xlarge,
    required this.xxlarge,
  });

  static MixThemeSpace get defaults {
    return const MixThemeSpace._(
      xsmall: 2,
      small: 4,
      medium: 8,
      large: 16,
      xlarge: 32,
      xxlarge: 64,
    );
  }

  final double xsmall;
  final double small;
  final double medium;
  final double large;
  final double xlarge;
  final double xxlarge;

  double fromValue(double? value) {
    if (value == null) return 0.0;

    if ($space.xsmall == value) {
      return xsmall;
    }

    if ($space.small == value) {
      return small;
    }

    if ($space.medium == value) {
      return medium;
    }

    if ($space.large == value) {
      return large;
    }

    if ($space.xlarge == value) {
      return xlarge;
    }

    if ($space.xxlarge == value) {
      return xxlarge;
    }
    return value;
  }

  MixThemeSpace merge(MixThemeSpace? other) {
    return MixThemeSpace._(
      xsmall: other?.xsmall ?? xsmall,
      small: other?.small ?? small,
      medium: other?.medium ?? medium,
      large: other?.large ?? large,
      xlarge: other?.xlarge ?? xlarge,
      xxlarge: other?.xxlarge ?? xxlarge,
    );
  }
}

class WithSpaceTokens<T> {
  const WithSpaceTokens(T Function(double value) fn) : _fn = fn;

  final T Function(double value) _fn;

  T call(double value) => _fn(value);

  T get xsmall => call($space.xsmall);
  T get xs => xsmall;

  T get small => call($space.small);
  T get sm => small;

  T get medium => call($space.medium);
  T get md => medium;

  T get large => call($space.large);
  T get lg => large;

  T get xlarge => call($space.xlarge);
  T get xl => xlarge;

  T get xxlarge => call($space.xxlarge);
  T get xxl => xxlarge;
}
