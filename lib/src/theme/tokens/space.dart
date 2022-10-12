import 'size.dart';

class MixThemeSpace extends MixThemeSize {
  const MixThemeSpace({
    double? xsmall,
    double? small,
    double? medium,
    double? large,
    double? xlarge,
    double? xxlarge,
  }) : super(
          xsmall: xsmall ?? 2,
          small: small ?? 4,
          medium: medium ?? 8,
          large: large ?? 16,
          xlarge: xlarge ?? 32,
          xxlarge: xxlarge ?? 64,
        );

  @override
  MixThemeSpace copyWith({
    double? xsmall,
    double? small,
    double? medium,
    double? large,
    double? xlarge,
    double? xxlarge,
  }) {
    return MixThemeSpace(
      xsmall: xsmall ?? this.xsmall,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      xlarge: xlarge ?? this.xlarge,
      xxlarge: xxlarge ?? this.xxlarge,
    );
  }
}
