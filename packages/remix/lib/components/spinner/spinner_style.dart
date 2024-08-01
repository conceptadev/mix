part of 'spinner.dart';

final _util = SpinnerSpecUtility.self;

Style get _baseStyle {
  return Style(
    _util.color.$accent(),
  );
}

Style get _smallVariant {
  return Style(
    _util.size(16),
    _util.strokeWidth(1),
  );
}

Style get _mediumVariant {
  return Style(
    _util.size(24),
    _util.strokeWidth(1.5),
  );
}

Style get _largeVariant {
  return Style(
    _util.size(32),
    _util.strokeWidth(2),
  );
}

Style _buildSpinnerStyle(Style? style, List<ISpinnerVariant> variants) {
  return Style(
    _baseStyle(),
    SpinnerSize.small(_smallVariant()),
    SpinnerSize.medium(_mediumVariant()),
    SpinnerSize.large(_largeVariant()),
  ).merge(style).applyVariants(variants);
}
