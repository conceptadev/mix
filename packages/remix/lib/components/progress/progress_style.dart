part of 'progress.dart';

final _progress = ProgressSpecUtility.self;
final _container = _progress.container;
final _track = _progress.track;
final _fill = _progress.fill;

Style get _baseStyle {
  return Style(
    _track.color.$neutral(6),
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
    _container.height(6),
  );
}

Style get _largeVariant {
  return Style(
    _container.height(8),
  );
}

Style get _surfaceVariant {
  return Style(
    _track.color.$neutral(4),
    _track.border.color.$neutral(7),
    _track.border.width(1),
    _fill.border.width(1),
    _fill.border.right.width.zero(),
    _fill.border.right.style.none(),
    _fill.border.color.$accentAlpha(9),
    _fill.color.$accent(8),
  );
}

Style get _softVariant {
  return Style(
    _fill.color.$accent(),
  );
}

Style get _noneRadiusVariant {
  return Style(
    _container.borderRadius(0),
    _fill.borderRadius(0),
    _track.borderRadius(0),
  );
}

Style get _smallRadiusVariant {
  return Style(
    _container.borderRadius(1),
    _track.borderRadius(1),
    _fill.borderRadius(1),
    _fill.borderRadius.right(0),
  );
}

Style get _mediumRadiusVariant {
  return Style(
    _container.borderRadius(2),
    _track.borderRadius(2),
    _fill.borderRadius(2),
    _fill.borderRadius.right(0),
  );
}

Style get _largeRadiusVariant {
  return Style(
    _container.borderRadius(3),
    _track.borderRadius(3),
    _fill.borderRadius(3),
    _fill.borderRadius.right(0),
  );
}

Style get _fullRadiusVariant {
  return Style(
    _container.borderRadius(99),
    _track.borderRadius(99),
    _fill.borderRadius(99),
    _fill.borderRadius.right(0),
  );
}

Style _buildProgressStyle(Style? style, List<IProgressVariant> variants) {
  return Style(
    _baseStyle(),

    /// Size Variants
    ProgressSize.size1(_smallVariant()),
    ProgressSize.size2(_mediumVariant()),
    ProgressSize.size3(_largeVariant()),

    // Type variants
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
