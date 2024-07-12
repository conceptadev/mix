// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/badge/badge_spec.dart';
import 'package:remix/components/badge/badge_variants.dart';
import 'package:remix/tokens/remix_tokens.dart';

final _badge = BadgeSpecUtility.self;
final _container = _badge.container;
final _label = _badge.label;

Style get _baseStyle => Style(
      _container.borderRadius(99),
      _label.style.fontWeight(FontWeight.w500),
    );

Style get _solidVariant => Style(
      _container.color($rx.color.accent()()),
      _label.style.color($rx.color.neutral(1)()),
    );

Style get _softVariant => Style(
      _container.color($rx.color.accentAlpha(3)()),
      _label.style.color($rx.color.accentAlpha(11)()),
    );

Style get _surfaceVariant => Style(
      _container.color($rx.color.accentAlpha(2)()),
      _label.style.color($rx.color.accentAlpha(11)()),
    );

Style get _outlineVariant => Style(
      _container.color(Colors.transparent),
      _container.border.width(1),
      _container.border.color($rx.color.accentAlpha(8)()),
      _label.style.color($rx.color.accentAlpha(11)()),
    );

final _smallVariant = Style(
  _container.padding.vertical.ref($rx.space.space1),
  _container.padding.horizontal.ref($rx.space.space2),
  _label.style.as($rx.text.text1()),
);

final _mediumVariant = Style(
  _container.padding.vertical.ref($rx.space.space1),
  _container.padding.horizontal.ref($rx.space.space3),
  _label.style.as($rx.text.text2()),
);

final _largeVariant = Style(
  _container.padding.vertical.ref($rx.space.space2),
  _container.padding.horizontal.ref($rx.space.space4),
  _label.style.as($rx.text.text3()),
);

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
