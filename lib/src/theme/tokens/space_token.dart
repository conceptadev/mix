import 'package:mix/src/theme/refs/refs.dart';

// ignore: constant_identifier_names

class SpaceToken {
  const SpaceToken._({
    required this.xsmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.xlarge,
    required this.xxlarge,
  });

  static get defaults {
    return const SpaceToken._(
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

    if (SizeRefName.xsmall.ref == value) {
      return xsmall;
    }

    if (SizeRefName.small.ref == value) {
      return small;
    }

    if (SizeRefName.medium.ref == value) {
      return medium;
    }

    if (SizeRefName.large.ref == value) {
      return large;
    }

    if (SizeRefName.xlarge.ref == value) {
      return xlarge;
    }

    if (SizeRefName.xxlarge.ref == value) {
      return xxlarge;
    }
    return value;
  }

  SpaceToken merge(SpaceToken? other) {
    return SpaceToken._(
      xsmall: other?.xsmall ?? xsmall,
      small: other?.small ?? small,
      medium: other?.medium ?? medium,
      large: other?.large ?? large,
      xlarge: other?.xlarge ?? xlarge,
      xxlarge: other?.xxlarge ?? xxlarge,
    );
  }
}
