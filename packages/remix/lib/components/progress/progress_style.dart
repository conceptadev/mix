part of 'progress.dart';

final _progress = ProgressSpecUtility.self;
final _container = _progress.container;
final _track = _progress.track;
final _fill = _progress.fill;

Style get _baseStyle {
  return Style(
    _container.borderRadius(99),
    _track.color.$neutralAlpha(3),
    _fill.color.$accent(),
  );
}

Style get _smallVariant {
  return Style(
    _container.height(4),
  );
}

Style get _mediumVariant {
  return Style(
    _container.height(8),
  );
}

Style get _largeVariant {
  return Style(
    _container.height(12),
  );
}

Style get _classicVariant {
  return Style(
    _track.color.$neutralAlpha(3),
    _fill.color.$accent(),
  );
}

Style get _surfaceVariant {
  return Style(
    _track.color.$neutralAlpha(2),
    _fill.color.$accent(),
  );
}

Style get _softVariant {
  return Style(
    _track.color.$accentAlpha(3),
    _fill.color.$accent(),
  );
}

Style get _noneRadiusVariant {
  return Style(
    _container.borderRadius(0),
  );
}

Style get _smallRadiusVariant {
  return Style(
    _container.borderRadius(4),
  );
}

Style get _mediumRadiusVariant {
  return Style(
    _container.borderRadius(8),
  );
}

Style get _largeRadiusVariant {
  return Style(
    _container.borderRadius(12),
  );
}

Style get _fullRadiusVariant {
  return Style(
    _container.borderRadius(99),
  );
}

Style _buildProgressStyle(Style? style, List<IProgressVariant> variants) {
  return Style(
    _baseStyle(),

    /// Size Variants
    ProgressSize.small(_smallVariant()),
    ProgressSize.medium(_mediumVariant()),
    ProgressSize.large(_largeVariant()),

    // Type variants
    ProgressVariant.classic(_classicVariant()),
    ProgressVariant.surface(_surfaceVariant()),
    ProgressVariant.soft(_softVariant()),

    // Radius variants
    ProgressRadius.none(_noneRadiusVariant()),
    ProgressRadius.small(_smallRadiusVariant()),
    ProgressRadius.medium(_mediumRadiusVariant()),
    ProgressRadius.large(_largeRadiusVariant()),
    ProgressRadius.full(_fullRadiusVariant()),
  ).merge(style).applyVariants(variants);
}
