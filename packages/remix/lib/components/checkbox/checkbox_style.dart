// ignore_for_file: camel_case_types

part of 'checkbox.dart';

final _util = CheckboxSpecUtility.self;
final _container = _util.container;
final _indicator = _util.indicator;

Style get _baseStyle {
  return Style(
    _container.borderRadius(4),
  );
}

Style get _onDisabledForeground {
  return Style(
    $on.disabled(
      _indicator.color.$neutralAlpha(7),
    ),
  );
}

Style get _solidVariant {
  return Style(
    _container.color.$accent(),
    _indicator.color.white(),
    $on.hover(
      _container.color.$accent(10),
    ),
    $on.disabled(
      _container.color.$neutralAlpha(3),
    ),
  );
}

Style get _softVariant {
  return Style(
    _container.color.$accentAlpha(3),
    _indicator.color.$accentAlpha(11),
    $on.hover(
      _container.color.$accentAlpha(4),
    ),
    $on.disabled(
      _container.color.$neutralAlpha(3),
    ),
  );
}

Style get _outlineVariant {
  return Style(
    _container.color.transparent(),
    _container.border.color.$accentAlpha(8),
    _container.border.width(1.5),
    _indicator.color.$accentAlpha(11),
    $on.hover(
      _container.color.$accentAlpha(2),
    ),
    $on.disabled(
      _container.border.color.$neutralAlpha(8),
      _container.color.transparent(),
    ),
  );
}

Style get _surfaceVariant {
  return Style(
    _outlineVariant(),
    _container.color.$accentAlpha(3),
    $on.hover(
      _container.color.$accentAlpha(4),
      _container.border.color.$accentAlpha(8),
    ),
    $on.disabled(
      _container.color.$neutralAlpha(2),
    ),
  );
}

final _ghostVariant = Style(
  _container.border.style.none(),
  _container.color.transparent(),
  _indicator.color.$accentAlpha(11),
  $on.hover(
    _container.color.$accentAlpha(3),
  ),
);

Style get _disabledVariant {
  return Style(
    _container.color.$neutralAlpha(3),
    _container.border.color.$neutralAlpha(5),
    _indicator.color.$neutralAlpha(7),
  );
}

Style get _smallVariant {
  return Style(
    _container.size(16),
    _indicator.size(12),
  );
}

Style get _mediumVariant {
  return Style(
    _container.size(20),
    _indicator.size(16),
  );
}

Style get _largeVariant {
  return Style(
    _container.size(24),
    _indicator.size(20),
  );
}

Style _buildCheckboxStyle(Style? style, List<ICheckboxVariant> variants) {
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
  ).merge(style).applyVariants(variants);
}
