// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/radio/radio_spec.dart';
import 'package:remix/components/radio/radio_variants.dart';
import 'package:remix/helpers/utility_extension.dart';
import 'package:remix/tokens/remix_tokens.dart';

final _radio = RadioSpecUtility.self;
final _container = _radio.container;
final _indicator = _radio.indicator;

Style get _baseStyle => Style(
      _container.borderRadius(99),
      _container.alignment.center(),
      _indicator.borderRadius(99),
    );

Style get _solidVariant => Style(
      _container.color.ref($rx.accent9),
      _indicator.color.ref($rx.neutral1),
      $on.hover(
        _container.color.ref($rx.accent12),
      ),
      $on.disabled(
        _container.color.ref($rx.neutral3A),
      ),
    );

Style get _softVariant => Style(
      _container.color.ref($rx.accent3A),
      _indicator.color.ref($rx.accent11A),
      $on.hover(
        _container.color.ref($rx.accent4A),
      ),
      $on.disabled(
        _container.color.ref($rx.neutral3A),
      ),
    );

Style get _outlineVariant => Style(
      _container.color(Colors.transparent),
      _container.border.color.ref($rx.accent8A),
      _container.border.width(1.5),
      _indicator.color.ref($rx.accent11A),
      $on.hover(
        _container.color.ref($rx.accent2A),
      ),
      $on.disabled(
        _container.border.color.ref($rx.neutral8A),
        _container.color.transparent(),
      ),
    );

Style get _surfaceVariant => Style(
      _outlineVariant(),
      _container.color.ref($rx.accent3A),
      $on.hover(
        _container.color.ref($rx.accent4A),
        _container.border.color.ref($rx.accent8A),
      ),
      $on.disabled(
        _container.color.ref($rx.neutral3A),
      ),
    );

Style get _ghostVariant => Style(
      _container.border.style.none(),
      _container.color(Colors.transparent),
      _indicator.color.ref($rx.accent11A),
      $on.hover(
        _container.color.ref($rx.accent3A),
      ),
    );
Style get _smallVariant => Style(
      _container.size(16),
      _indicator.size(8),
    );

Style get _mediumVariant => Style(
      _container.size(20),
      _indicator.size(10),
    );

Style get _largeVariant => Style(
      _container.size(24),
      _indicator.size(12),
    );

Style get _disabledVariant => Style(
      _container.color.ref($rx.neutral3A),
      _container.border.color.ref($rx.neutral5A),
      _indicator.color.ref($rx.neutral7A),
    );

Style buildDefaultRadioStyle() {
  return Style(
    _baseStyle(),

    /// Size Variants
    RadioSize.small(_smallVariant()),
    RadioSize.medium(_mediumVariant()),
    RadioSize.large(_largeVariant()),

    // State variants
    RadioVariant.solid(_solidVariant()),
    RadioVariant.soft(_softVariant()),
    RadioVariant.outline(_outlineVariant()),
    RadioVariant.surface(_surfaceVariant()),
    RadioVariant.ghost(_ghostVariant()),
    $on.disabled(_disabledVariant()),
  );
}
