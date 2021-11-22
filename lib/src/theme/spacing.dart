import './theme_data.dart';

// ignore: constant_identifier_names

class MixThemeSpaceData {
  const MixThemeSpaceData._({
    required this.xsmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.xlarge,
    required this.xxlarge,
  });

  static get defaults {
    return const MixThemeSpaceData._(
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

    if (SizeToken.xsmall.value == value) {
      return xsmall;
    }

    if (SizeToken.small.value == value) {
      return small;
    }

    if (SizeToken.medium.value == value) {
      return medium;
    }

    if (SizeToken.large.value == value) {
      return large;
    }

    if (SizeToken.xlarge.value == value) {
      return xlarge;
    }

    if (SizeToken.xxlarge.value == value) {
      return xxlarge;
    }
    return value;
  }

  MixThemeSpaceData merge(MixThemeSpaceData? other) {
    return MixThemeSpaceData._(
      xsmall: other?.xsmall ?? xsmall,
      small: other?.small ?? small,
      medium: other?.medium ?? medium,
      large: other?.large ?? large,
      xlarge: other?.xlarge ?? xlarge,
      xxlarge: other?.xxlarge ?? xxlarge,
    );
  }
}

class WithSpaceUtils<T> {
  const WithSpaceUtils(T Function(double value) fn) : _fn = fn;

  final T Function(double value) _fn;

  T call(double value) => _fn(value);

  T get xsmall => call(SizeToken.xsmall.value);
  T get xs => xsmall;

  T get small => call(SizeToken.small.value);
  T get sm => small;

  T get medium => call(SizeToken.medium.value);
  T get md => medium;

  T get large => call(SizeToken.large.value);
  T get lg => large;

  T get xlarge => call(SizeToken.xlarge.value);
  T get xl => xlarge;

  T get xxlarge => call(SizeToken.xxlarge.value);
  T get xxl => xxlarge;
}
