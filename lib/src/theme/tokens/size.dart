// Used as a reference for sizes on design tokens
// Use negative doubles as Flutter does not use negative values as part of layout.
// However can be assigned as normal double values within widgets and later replaced

const $xsmall = -0.1;
const $small = -0.2;
const $medium = -0.3;
const $large = -0.4;
const $xlarge = -0.5;
const $xxlarge = -0.6;

abstract class MixThemeSize {
  final double xsmall;
  final double small;
  final double medium;
  final double large;
  final double xlarge;
  final double xxlarge;

  const MixThemeSize({
    required this.xsmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.xlarge,
    required this.xxlarge,
  });

  double? fromValue(double? value) {
    if ($xsmall == value) {
      return xsmall;
    }

    if ($small == value) {
      return small;
    }

    if ($medium == value) {
      return medium;
    }

    if ($large == value) {
      return large;
    }

    if ($xlarge == value) {
      return xlarge;
    }

    if ($xxlarge == value) {
      return xxlarge;
    }

    return value;
  }

  MixThemeSize copyWith({
    double? xsmall,
    double? small,
    double? medium,
    double? large,
    double? xlarge,
    double? xxlarge,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixThemeSize &&
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
    return 'MixThemeSize(xsmall: $xsmall, small: $small, medium: $medium, large: $large, xlarge: $xlarge, xxlarge: $xxlarge)';
  }
}

class WithSizeTokens<T> {
  const WithSizeTokens(T Function(double value) fn) : _fn = fn;

  final T Function(double value) _fn;

  T call(double value) => _fn(value);

  T get xsmall => call($xsmall);
  T get xs => xsmall;

  T get small => call($small);
  T get sm => small;

  T get medium => call($medium);
  T get md => medium;

  T get large => call($large);
  T get lg => large;

  T get xlarge => call($xlarge);
  T get xl => xlarge;

  T get xxlarge => call($xxlarge);
  T get xxl => xxlarge;
}
