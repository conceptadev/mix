// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/button/button.variants.dart';
import 'package:remix/components/button/button_spec.dart';
import 'package:remix/tokens/remix_tokens.dart';

final _util = ButtonSpecUtility.self;
final _label = _util.label;
final _spinner = _util.spinner;
final _container = _util.container;
final _flex = _util.flex;

/// This applies to the icon, label, and spinner
final _foreground = _util.foreground;

Style get _baseStyle => Style(
      _flex.gap(0),
      _flex.mainAxisAlignment.center(),
      _flex.crossAxisAlignment.center(),
      _flex.mainAxisSize.min(),
      _container.borderRadius(6),
      _spinner.strokeWidth(1),
      _label.style.fontWeight(FontWeight.w500),
      _label.textHeightBehavior(
        const TextHeightBehavior(
          applyHeightToFirstAscent: false,
          applyHeightToLastDescent: true,
        ),
      ),
    );

Style get _onDisabledForeground => Style(
      $on.disabled(
        _foreground.color.ref($rx.neutral7A),
      ),
    );

Style get _solidVariant => Style(
      _container.color.ref($rx.accent9),
      _foreground.color.ref($rx.neutral1),
      $on.hover(
        _container.color.ref($rx.accent12),
      ),
      $on.disabled(
        _container.color.ref($rx.neutral3A),
      ),
    );

Style get _softVariant => Style(
      _container.color.ref($rx.accent3A),
      _foreground.color.ref($rx.accent11A),
      $on.hover(
        _container.color.ref($rx.accent4A),
      ),
      $on.disabled(
        _container.color.ref($rx.neutral3A),
      ),
    );

Style get _outlineVariant => Style(
      _container.color(Colors.transparent),
      _container.border.width(1.5),
      _container.border.strokeAlign(0),
      _container.border.color.ref($rx.accent8A),
      _foreground.color.ref($rx.accent11A),
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

Style get _ghostVariant => Style(
      _container.border.style.none(),
      _container.color(Colors.transparent),
      _foreground.color.ref($rx.accent11A),
      $on.hover(
        _container.color.ref($rx.accent3A),
      ),
    );

Style get _smallVariant => Style(
      _label.style.ref($rx.text1),
      _container.padding.vertical.ref($rx.space1),
      _container.padding.horizontal.ref($rx.space2),
      _flex.gap.ref($rx.space1),
      _foreground.size(12),
    );

Style get _mediumVariant => Style(
      _container.padding.vertical.ref($rx.space2),
      _container.padding.horizontal.ref($rx.space3),
      _flex.gap.ref($rx.space2),
      _label.style.ref($rx.text2),
      _foreground.size(14),
    );

Style get _largeVariant => Style(
      _container.padding.vertical.ref($rx.space2),
      _container.padding.horizontal.ref($rx.space4),
      _flex.gap.ref($rx.space3),
      _label.style.ref($rx.text3),
      _foreground.size(16),
    );

Style get _xLargeVariant => Style(
      _container.padding.vertical.ref($rx.space3),
      _container.padding.horizontal.ref($rx.space5),
      _flex.gap.ref($rx.space3),
      _label.style.ref($rx.text4),
      _foreground.size(18),
    );

Style buildDefaultButtonStyle() {
  return Style(
    _baseStyle(),

    /// Size Variants
    ButtonSize.small(_smallVariant()),
    ButtonSize.medium(_mediumVariant()),
    ButtonSize.large(_largeVariant()),
    ButtonSize.xlarge(_xLargeVariant()),

    _onDisabledForeground(),

    // Type variants
    ButtonVariant.solid(_solidVariant()),
    ButtonVariant.surface(_surfaceVariant()),
    ButtonVariant.soft(_softVariant()),
    ButtonVariant.outline(_outlineVariant()),
    ButtonVariant.ghost(_ghostVariant()),
  );
}

extension ButtonSpecUtilityX<T extends Attribute> on ButtonSpecUtility<T> {
  ForegroundUtility<T> get foreground => ForegroundUtility((v) {
        return only().merge(label.style
            .only(color: v.color)
            .merge(icon.only(color: v.color, size: v.size))
            .merge(spinner.only(color: v.color, size: v.size))) as T;
      });
}

class ForegroundUtility<T extends Attribute>
    extends MixUtility<T, ({ColorDto? color, double? size})> {
  ForegroundUtility(super.builder);
  late final color = ColorUtility((v) => only(color: v));

  late final size = FontSizeUtility((v) => only(size: v));
  T only({ColorDto? color, double? size}) {
    return builder((color: color, size: size));
  }
}
