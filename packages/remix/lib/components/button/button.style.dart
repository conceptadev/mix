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

Style buildDefaultButtonStyle() {
  final baseStyle = Style(
    _flex.gap(0),
    _flex.mainAxisAlignment.center(),
    _flex.crossAxisAlignment.center(),
    _flex.mainAxisSize.min(),
    _container.borderRadius(6),
    _label.style.fontWeight(FontWeight.w500),
    _spinner.strokeWidth(1),
    _label.textHeightBehavior(const TextHeightBehavior(
      applyHeightToFirstAscent: false,
      applyHeightToLastDescent: false,
    )),
  );

  final smallVariant = Style(
    ButtonSize.small(
      _label.style.as($rx.text1()),
      _container.padding.vertical($rx.space1()),
      _container.padding.horizontal($rx.space2()),
      _flex.gap($rx.space1()),
      _foreground(size: 12),
    ),
  );

  final mediumVariant = Style(
    ButtonSize.medium(
      _container.padding.vertical($rx.space2()),
      _container.padding.horizontal($rx.space3()),
      _flex.gap($rx.space2()),
      _label.style.as($rx.text2()),
      _foreground(size: 14),
    ),
  );

  final largeVariant = Style(
    ButtonSize.large(
      _container.padding.vertical($rx.space2()),
      _container.padding.horizontal($rx.space4()),
      _flex.gap($rx.space3()),
      _label.style.as($rx.text3()),
      _foreground(size: 16),
    ),
  );

  final xLargeVariant = Style(
    ButtonSize.xlarge(
      _container.padding.vertical($rx.space3()),
      _container.padding.horizontal($rx.space5()),
      _flex.gap($rx.space3()),
      _label.style.as($rx.text4()),
      _foreground(size: 18),
    ),
  );

  final solidVariant = Style(
    ButtonVariant.solid(
      _container.color($rx.accent9()),
      _foreground(color: Colors.white),
      $on.dark(
        _foreground(color: Colors.black),
      ),
      $on.hover(
        _container.color($rx.accent12()),
      ),
      $on.disabled(
        _container.color($rx.neutral2A()),
      ),
    ),
  );

  final softVariant = Style(
    ButtonVariant.soft(
      _container.color($rx.accent3A()),
      _foreground(color: $rx.accent11A()),
      $on.hover(
        _container.color($rx.accent4A()),
      ),
      $on.disabled(
        _container.color($rx.neutral2A()),
      ),
    ),
  );

  final surfaceVariant = Style(
    ButtonVariant.surface(
      _container.color($rx.accent2A()),
      _container.border.width(1),
      _container.border.color($rx.accent7A()),
      _foreground(color: $rx.accent11()),
      $on.hover(
        _container.color($rx.accent3A()),
        _container.border.color($rx.accent8A()),
      ),
      $on.disabled(
        _container.color($rx.neutral2A()),
        _container.border.color(
          $rx.neutral6A(),
        ),
      ),
    ),
  );

  final outlineVariant = Style(
    ButtonVariant.outline(
      _container.color(Colors.transparent),
      _container.border.width(1),
      _container.border.color($rx.accent8A()),
      _foreground(color: $rx.accent8A()),
      $on.hover(
        _container.color($rx.accent2A()),
      ),
      $on.disabled(
        _container.border.color(
          $rx.neutral6A(),
        ),
      ),
    ),
  );

  final ghostVariant = Style(
    ButtonVariant.ghost(
      _container.border.style.none(),
      _container.color(Colors.transparent),
      _foreground(color: $rx.accent11A()),
      $on.hover(
        _container.color($rx.accent3A()),
      ),
    ),
  );

  return Style(
    baseStyle(),

    /// Size Variants
    smallVariant(),
    mediumVariant(),
    largeVariant(),
    xLargeVariant(),

    // Type variants
    solidVariant(),
    surfaceVariant(),
    softVariant(),
    outlineVariant(),
    ghostVariant(),
    $on.disabled(
      _label.style.color(
        $rx.neutral6A(),
      ),
      _spinner.color($rx.neutral6A()),
    ),
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
