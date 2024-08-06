part of 'progress.dart';

final _progress = ProgressSpecUtility.self;
final _container = _progress.container;
final _track = _progress.track;
final _fill = _progress.fill;
final _outer = _progress.outerContainer;

Style get _baseStyle {
  return Style(
    _track.color.$neutral(6),
    _fill.color.$accent(),
    _container.clipBehavior.hardEdge(),
    _outer.clipBehavior.hardEdge(),
    _outer.shapeDecoration.shape.roundedRectangle(),
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
    _fill.color.$accent(8),
    _outer.border.width(1),
    _outer.border.color.$neutralAlpha(6),
  );
}

Style get _softVariant {
  return Style(
    _fill.color.$accent(),
  );
}

Style get _noneRadiusVariant {
  return Style(
    _outer.shapeDecoration.shape.roundedRectangle.borderRadius(0),
    _container.borderRadius(0),
  );
}

Style get _smallRadiusVariant {
  return Style(
    _outer.shapeDecoration.shape.roundedRectangle.borderRadius(1),
    _container.borderRadius(1),
  );
}

Style get _mediumRadiusVariant {
  return Style(
    _outer.shapeDecoration.shape.roundedRectangle.borderRadius(2),
    _container.borderRadius(2),
  );
}

Style get _largeRadiusVariant {
  return Style(
    _outer.shapeDecoration.shape.roundedRectangle.borderRadius(3),
    _container.borderRadius(3),
  );
}

Style get _fullRadiusVariant {
  return Style(
    _outer.shapeDecoration.shape.roundedRectangle.borderRadius(99),
    _container.borderRadius(99),
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
