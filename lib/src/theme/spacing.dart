import 'package:mix/src/theme/refs.dart';

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

    if (SizeToken.xsmall.ref == value) {
      return xsmall;
    }

    if (SizeToken.small.ref == value) {
      return small;
    }

    if (SizeToken.medium.ref == value) {
      return medium;
    }

    if (SizeToken.large.ref == value) {
      return large;
    }

    if (SizeToken.xlarge.ref == value) {
      return xlarge;
    }

    if (SizeToken.xxlarge.ref == value) {
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
