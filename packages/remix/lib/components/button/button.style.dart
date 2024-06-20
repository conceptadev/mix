// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/button/button.variants.dart';
import 'package:remix/components/button/button_spec.dart';

final _button = ButtonSpecUtility.self;

Style get defaultButtonStyle => Style(
      _button.flex.gap(6),
      _button.flex.mainAxisAlignment.center(),
      _button.flex.crossAxisAlignment.center(),
      _button.flex.mainAxisSize.min(),
      _button.container.borderRadius(6),
      _button.label.style.height(1.1),
      _button.label.style.letterSpacing(0.5),
      _button.label.style.fontWeight(FontWeight.w600),

      /// Size Variants
      _xsmallVariant(),
      _smallVariant(),
      _mediumVariant(),
      _largeVariant(),

      // Type variants
      _primaryVariant(),
      _secondaryVariant(),
      _outlineVariant(),
      _ghostVariant(),
      _linkVariant(),
      _destructiveVariant(),
    );

Style get _xsmallVariant {
  return Style(ButtonSize.xsmall(
    _button.container.padding.horizontal(8),
    _button.container.padding.vertical(4),
    _button.label.style.fontSize(12),
    _button.icon.size(12),
  ));
}

Style get _smallVariant {
  return Style(
    ButtonSize.small(
      _button.container.padding.horizontal(12),
      _button.container.padding.vertical(6),
      _button.label.style.fontSize(14),
      _button.icon.size(14),
    ),
  );
}

Style get _mediumVariant {
  return Style(
    ButtonSize.medium(
      _button.container.padding.horizontal(16),
      _button.container.padding.vertical(8),
      _button.label.style.fontSize(16),
      _button.icon.size(16),
    ),
  );
}

Style get _largeVariant {
  return Style(
    ButtonSize.large(
      _button.container.padding.horizontal(20),
      _button.container.padding.vertical(10),
      _button.label.style.fontSize(18),
      _button.icon.size(18),
    ),
  );
}

Style get _primaryVariant {
  return Style(
    ButtonType.primary(
      _button.container.color.black(),
      _button.icon.color(Colors.white),
      _button.label.style.color.white(),
      $on.hover(
        _button.container.color.black87(),
      ),
    ),
  );
}

Style get _secondaryVariant {
  return Style(
    ButtonType.secondary(
      _button.container.color.grey.shade200(),
      _button.icon.color(Colors.black),
      _button.label.style.color.black87(),
      $on.hover(
        _button.container.color.grey.shade100(),
      ),
    ),
  );
}

Style get _destructiveVariant {
  return Style(
    ButtonType.destructive(
      _button.container.color.redAccent(),
      _button.icon.color(Colors.white),
      _button.label.style.color.white(),
      $on.hover(
        _button.container.color.redAccent.shade200(),
      ),
    ),
  );
}

Style get _outlineVariant {
  return Style(
    ButtonType.outline(
      _button.container.color.transparent(),
      _button.label.style.color.black(),
      _button.container.border.width(1.5),
      _button.container.border.color.black12(),
      _button.container.shadow.color(Colors.black12.withOpacity(0.1)),
      _button.container.shadow.blurRadius(1),
      _button.icon.color(Colors.black),
    ),
  );
}

Style get _ghostVariant {
  return Style(
    ButtonType.ghost(
      _button.container.color.transparent(),
      _button.label.style.color.black(),
      $on.hover(
        _button.container.color.black12(),
      ),
    ),
  );
}

Style get _linkVariant {
  return Style(
    ButtonType.link(
      _button.label.style.color.black(),
      _button.container.color.transparent(),
      _button.icon.color(Colors.black),
      $on.hover(
        _button.label.style.decoration(TextDecoration.underline),
        _button.container.color.black12(),
      ),
    ),
  );
}
