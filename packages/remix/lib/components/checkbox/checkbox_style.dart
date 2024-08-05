// ignore_for_file: camel_case_types

part of 'checkbox.dart';

final _util = CheckboxSpecUtility.self;
final _container = _util.container;
final _indicator = _util.indicator;

Style get _baseStyle {
  return Style(
    _container.borderRadius(4),
    _indicator.wrap.opacity(0),
    _indicator.wrap.scale(0.5),
    $on.selected(
      _indicator.wrap.opacity(1),
      _indicator.wrap.scale(1),
    ),
  );
}

Style get _softVariant {
  return Style(
    _container.color.$accentAlpha(4),
    _indicator.color.$accentAlpha(11),
    $on.hover(
      _container.color.$accentAlpha(5),
    ),
    ($on.hover & $on.selected)(
      _container.color.$accentAlpha(5),
    ),
    $on.selected(
      _container.color.$accentAlpha(4),
    ),
    $on.disabled(
      _container.color.$neutralAlpha(3),
    ),
  );
}

Style get _surfaceVariant {
  return Style(
    _container.border.color.$neutral(4),
    _container.border.width(2),
    _indicator.color.$white(),
    $on.hover(
      _container.color.$neutral(2),
    ),
    $on.selected(
      _container.color.transparent(),
      _container.border.width(0),
      _container.color.$accent(9),
    ),
    ($on.hover & $on.selected)(
      _container.color.$accent(10),
    ),
    $on.disabled(
      _container.color.$neutralAlpha(2),
    ),
  );
}

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

    // State variants
    CheckboxVariant.soft(_softVariant()),
    CheckboxVariant.surface(_surfaceVariant()),
    $on.disabled(_disabledVariant()),
  )
      .merge(style)
      .applyVariants(variants)
      .animate(duration: Duration(milliseconds: 150), curve: Curves.easeInOut);
}
