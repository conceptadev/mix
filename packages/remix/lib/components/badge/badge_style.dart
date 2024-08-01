// ignore_for_file: camel_case_types

import 'package:mix/mix.dart';
import 'package:remix/components/badge/badge_spec.dart';
import 'package:remix/components/badge/badge_variants.dart';
import 'package:remix/tokens/remix_tokens.dart';

final _badge = BadgeSpecUtility.self;
final _container = _badge.container;
final _label = _badge.label;

Style get _baseStyle {
  return Style(
    _container.borderRadius(99),
    _label.style.fontWeight.w500(),
  );
}

Style get _solidVariant {
  return Style(
    _container.color.$accent(),
    _label.style.color.$neutral(1),
  );
}

Style get _softVariant {
  return Style(
    _container.color.$accentAlpha(3),
    _label.style.color.$accentAlpha(11),
  );
}

Style get _surfaceVariant {
  return Style(
    _container.color.$accentAlpha(2),
    _label.style.color.$accentAlpha(11),
  );
}

Style get _outlineVariant {
  return Style(
    _container.color.transparent(),
    _container.border.width(1),
    _container.border.color.$accentAlpha(8),
    _label.style.color.$accentAlpha(11),
  );
}

Style get _smallVariant {
  return Style(
    _container.padding.vertical.$space(1),
    _container.padding.horizontal.$space(2),
    _label.style.$text(1),
  );
}

Style get _mediumVariant {
  return Style(
    _container.padding.vertical.$space(1),
    _container.padding.horizontal.$space(3),
    _label.style.$text(2),
  );
}

Style get _largeVariant {
  return Style(
    _container.padding.vertical.$space(2),
    _container.padding.horizontal.$space(4),
    _label.style.$text(3),
  );
}

Style badgeStyle(Style? style, List<IBadgeVariant> variants) {
  return Style(
    _baseStyle(),

    /// Size Variants
    BadgeSize.small(_smallVariant()),
    BadgeSize.medium(_mediumVariant()),
    BadgeSize.large(_largeVariant()),

    // Type variants
    BadgeVariant.solid(_solidVariant()),
    BadgeVariant.soft(_softVariant()),
    BadgeVariant.surface(_surfaceVariant()),
    BadgeVariant.outline(_outlineVariant()),
  ).merge(style).applyVariants(variants);
}
