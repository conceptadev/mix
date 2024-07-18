// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/callout/callout_spec.dart';
import 'package:remix/components/callout/callout_variants.dart';
import 'package:remix/tokens/remix_tokens.dart';

final _callout = CalloutSpecUtility.self;
final _container = _callout.container;
final _flex = _callout.flex;
final _icon = _callout.icon;
final _text = _callout.text;

Style get _baseStyle => Style(
      _container.borderRadius(8),
      _container.padding(16),
      _flex.gap(16),
      _icon.size(24),
      _icon.color.ref($rx.color.accentAlpha(11)),
      _text.style.color.ref($rx.color.accentAlpha(11)),
      _icon.size(20),
    );

Style get _softVariant => Style(
      _container.color.ref($rx.color.accentAlpha(3)),
    );

Style get _surfaceVariant => Style(
      _container.color.ref($rx.color.accentAlpha(2)),
      _container.border.width(1),
      _container.border.color.ref($rx.color.accentAlpha(5)),
    );

Style get _outlineVariant => Style(
      _container.color(Colors.transparent),
      _container.border.width(1),
      _container.border.color.ref($rx.color.accentAlpha(8)),
    );

Style calloutStyle(Style? style, List<ICalloutVariant> variants) {
  return Style(
    _baseStyle(),

    // variants
    CalloutVariant.soft(_softVariant()),
    CalloutVariant.surface(_surfaceVariant()),
    CalloutVariant.outline(_outlineVariant()),
  ).merge(style).applyVariants(variants);
}
