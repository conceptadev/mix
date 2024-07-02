// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/button/button.variants.dart';
import 'package:remix/components/button/button_spec.dart';
import 'package:remix/tokens/remix_tokens.dart';

final _button = ButtonSpecUtility.self;
final _label = _button.label;
final _spinner = _button.spinner;
final _container = _button.container;
final _flex = _button.flex;

/// This applies to the icon, label, and spinner
final _foreground = _button.foreground;

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

final _onDisabledBackground = Style(
  $on.disabled(
    _container.color(
      $rx.neutral3A(),
    ),
  ),
);

final _onDisabledForeground = Style(
  $on.disabled(
    _foreground(color: $rx.neutral7A()),
  ),
);

final _solidVariant = Style(
  _container.color($rx.accent9()),
  _foreground(color: $rx.neutral1()),
  $on.hover(
    _container.color($rx.accent12()),
  ),
  _onDisabledBackground(),
);

final _softVariant = Style(
  _container.color($rx.accent3A()),
  _foreground(color: $rx.accent11A()),
  $on.hover(
    _container.color($rx.accent4A()),
  ),
  _onDisabledBackground(),
);

final _outlineVariant = Style(
  _container.color(Colors.transparent),
  _container.border.width(1),
  _container.border.strokeAlign(0),
  _container.border.color($rx.accent8A()),
  _foreground(color: $rx.accent11A()),
  $on.hover(
    _container.color(
      $rx.accent2A(),
    ),
  ),
  $on.disabled(
    _container.border.color(
      $rx.neutral8A(),
    ),
    _container.color.transparent(),
  ),
);
final _surfaceVariant = Style(
  _outlineVariant(),
  _container.color($rx.accent2A()),
  $on.hover(
    _container.color($rx.accent3A()),
    _container.border.color($rx.accent8A()),
  ),
  $on.disabled(
    _container.color(
      $rx.neutral2A(),
    ),
  ),
);

final _ghostVariant = Style(
  _container.border.style.none(),
  _container.color(Colors.transparent),
  _foreground(color: $rx.accent11A()),
  $on.hover(
    _container.color($rx.accent3A()),
  ),
);

final _smallVariant = Style(
  _label.style.as($rx.text1()),
  _container.padding.vertical($rx.space1()),
  _container.padding.horizontal($rx.space2()),
  _flex.gap($rx.space1()),
  _foreground(size: 12),
);

final _mediumVariant = Style(
  _container.padding.vertical($rx.space2()),
  _container.padding.horizontal($rx.space3()),
  _flex.gap($rx.space2()),
  _label.style.as($rx.text2()),
  _foreground(size: 14),
);

final _largeVariant = Style(
  _container.padding.vertical($rx.space2()),
  _container.padding.horizontal($rx.space4()),
  _flex.gap($rx.space3()),
  _label.style.as($rx.text3()),
  _foreground(size: 16),
);

final _xLargeVariant = Style(
  _container.padding.vertical($rx.space3()),
  _container.padding.horizontal($rx.space5()),
  _flex.gap($rx.space3()),
  _label.style.as($rx.text4()),
  _foreground(size: 18),
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
  Attribute foreground({Color? color, double? size}) {
    final style = Style.create([
      if (color != null) ...[
        label.style.color(color),
        icon.color(color),
        spinner.color(color),
      ],
      if (size != null) ...[icon.size(size), spinner.size(size)],
    ]);

    return style();
  }
}
