part of 'radio.dart';

final _radio = RadioSpecUtility.self;
final _container = _radio.container;
final _indicator = _radio.indicator;

Style get _baseStyle {
  return Style(
    _container.borderRadius(99),
    _container.alignment.center(),
    _indicator.borderRadius(99),
    _indicator.wrap.opacity(0),
    _indicator.wrap.scale(0.5),
    $on.selected(_indicator.wrap.opacity(1), _indicator.wrap.scale(1)),
  );
}

Style get _solidVariant {
  return Style(
    _container.color.$accent(),
    _indicator.color.white(),
    $on.hover(_container.color.$accent(10)),
    $on.disabled(_container.color.$neutralAlpha(3)),
  );
}

Style get _softVariant {
  return Style(
    _container.color.$accentAlpha(3),
    _indicator.color.$accentAlpha(11),
    $on.hover(_container.color.$accentAlpha(4)),
    $on.disabled(_container.color.$neutralAlpha(3)),
  );
}

Style get _outlineVariant {
  return Style(
    _container.color.transparent(),
    _container.border.color.$accentAlpha(8),
    _container.border.width(1.5),
    _indicator.color.$accentAlpha(11),
    $on.hover(_container.color.$accentAlpha(2)),
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
    $on.disabled(_container.color.$neutralAlpha(3)),
  );
}

Style get _smallVariant {
  return Style(_container.size(16), _indicator.size(8));
}

Style get _mediumVariant {
  return Style(_container.size(20), _indicator.size(10));
}

Style get _largeVariant {
  return Style(_container.size(24), _indicator.size(12));
}

Style get _disabledVariant {
  return Style(
    _container.color.$neutralAlpha(3),
    _container.border.color.$neutralAlpha(5),
    _indicator.color.$neutralAlpha(7),
  );
}

Style _buildDefaultRadioStyle(Style? style, List<IRadioVariant> variants) {
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
    $on.disabled(_disabledVariant()),
  ).merge(style).applyVariants(variants).animate(
        duration: Duration(milliseconds: 150),
        curve: Curves.easeInOutQuad,
      );
}
