// ignore_for_file: camel_case_types

import 'package:mix/mix.dart';
import 'package:remix/components/progress/progress.variants.dart';
import 'package:remix/components/progress/progress_spec.dart';
import 'package:remix/tokens/remix_tokens.dart';

final _progress = ProgressSpecUtility.self;
final _container = _progress.container;
final _track = _progress.track;
final _fill = _progress.fill;

Style get _baseStyle => Style(
      _container.borderRadius(99),
      _track.color($rx.neutral3A()),
      _fill.color($rx.accent9()),
    );

final _smallVariant = Style(
  _container.height(4),
);

final _mediumVariant = Style(
  _container.height(8),
);

final _largeVariant = Style(
  _container.height(12),
);

final _classicVariant = Style(
  _track.color($rx.neutral3A()),
  _fill.color($rx.accent9()),
);

final _surfaceVariant = Style(
  _track.color($rx.neutral2A()),
  _fill.color($rx.accent9()),
);

final _softVariant = Style(
  _track.color($rx.accent3A()),
  _fill.color($rx.accent9()),
);

final _noneRadiusVariant = Style(
  _container.borderRadius(0),
);

final _smallRadiusVariant = Style(
  _container.borderRadius(4),
);

final _mediumRadiusVariant = Style(
  _container.borderRadius(8),
);

final _largeRadiusVariant = Style(
  _container.borderRadius(12),
);

final _fullRadiusVariant = Style(
  _container.borderRadius(99),
);

Style buildDefaultProgressStyle() {
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
  );
}
