import '../refs/space_ref.dart';

const $space = SpaceRef();

class MixThemeSpace {
  final double xsmall;
  final double small;
  final double medium;
  final double large;
  final double xlarge;
  final double xxlarge;

  const MixThemeSpace.raw({
    required this.xsmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.xlarge,
    required this.xxlarge,
  });

  factory MixThemeSpace({
    double? xsmall,
    double? small,
    double? medium,
    double? large,
    double? xlarge,
    double? xxlarge,
  }) {
    return MixThemeSpace.raw(
      xsmall: xsmall ?? 2,
      small: small ?? 4,
      medium: medium ?? 8,
      large: large ?? 16,
      xlarge: xlarge ?? 32,
      xxlarge: xxlarge ?? 64,
    );
  }

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

  MixThemeSpace copyWith({
    double? xsmall,
    double? small,
    double? medium,
    double? large,
    double? xlarge,
    double? xxlarge,
  }) {
    return MixThemeSpace.raw(
      xsmall: xsmall ?? this.xsmall,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      xlarge: xlarge ?? this.xlarge,
      xxlarge: xxlarge ?? this.xxlarge,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixThemeSpace &&
        other.xsmall == xsmall &&
        other.small == small &&
        other.medium == medium &&
        other.large == large &&
        other.xlarge == xlarge &&
        other.xxlarge == xxlarge;
  }

  @override
  int get hashCode {
    return xsmall.hashCode ^
        small.hashCode ^
        medium.hashCode ^
        large.hashCode ^
        xlarge.hashCode ^
        xxlarge.hashCode;
  }

  @override
  String toString() {
    return 'MixThemeSpace(xsmall: $xsmall, small: $small, medium: $medium, large: $large, xlarge: $xlarge, xxlarge: $xxlarge)';
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
