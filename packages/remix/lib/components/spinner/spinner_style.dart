part of 'spinner.dart';

final _util = SpinnerSpecUtility.self;

Style get _baseStyle => Style(
      _util.color.ref($rx.color.accent()),
    );

Style get _smallVariant => Style(
      _util.size(16),
      _util.strokeWidth(1),
    );

Style get _mediumVariant => Style(
      _util.size(24),
      _util.strokeWidth(1.5),
    );

Style get _largeVariant => Style(
      _util.size(32),
      _util.strokeWidth(2),
    );

Style buildSpinnerStyle() {
  return Style(
    _baseStyle(),
    SpinnerSize.small(_smallVariant()),
    SpinnerSize.medium(_mediumVariant()),
    SpinnerSize.large(_largeVariant()),
  );
}
