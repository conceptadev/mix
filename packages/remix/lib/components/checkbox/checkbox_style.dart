// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/checkbox/checkbox_spec.dart';
import 'package:remix/components/checkbox/checkbox_variants.dart';
import 'package:remix/helpers/utility_extension.dart';
import 'package:remix/tokens/remix_tokens.dart';

final _util = CheckboxSpecUtility.self;
final _container = _util.container;
final _indicator = _util.indicator;

Style get _baseStyle => Style(
      _container.borderRadius(4),
    );

Style get _onDisabledForeground => Style(
      $on.disabled(
        _indicator.color.ref($rx.neutral7A),
      ),
    );

Style get _solidVariant => Style(
      _container.color.ref($rx.accent9),
      _indicator.color.ref($rx.neutral1),
      $on.hover(
        _container.color.ref($rx.accent10),
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
        _container.color.ref($rx.neutral2A),
      ),
    );

final _ghostVariant = Style(
  _container.border.style.none(),
  _container.color(Colors.transparent),
  _indicator.color.ref($rx.accent11A),
  $on.hover(
    _container.color.ref($rx.accent3A),
  ),
);

Style get _disabledVariant => Style(
      _container.color.ref($rx.neutral3A),
      _container.border.color.ref($rx.neutral5A),
      _indicator.color.ref($rx.neutral7A),
    );

Style get _smallVariant => Style(
      _container.size(16),
      _indicator.size(12),
    );

Style get _mediumVariant => Style(
      _container.size(20),
      _indicator.size(16),
    );

Style get _largeVariant => Style(
      _container.size(24),
      _indicator.size(20),
    );

Style buildDefaultCheckboxStyle() {
  return Style(
    _baseStyle(),

    /// Size Variants
    CheckboxSize.small(_smallVariant()),
    CheckboxSize.medium(_mediumVariant()),
    CheckboxSize.large(_largeVariant()),

    _onDisabledForeground(),

    // State variants
    CheckboxVariant.solid(_solidVariant()),
    CheckboxVariant.soft(_softVariant()),
    CheckboxVariant.surface(_surfaceVariant()),
    CheckboxVariant.outline(_outlineVariant()),
    CheckboxVariant.ghost(_ghostVariant()),
    $on.disabled(_disabledVariant()),
  );
}
