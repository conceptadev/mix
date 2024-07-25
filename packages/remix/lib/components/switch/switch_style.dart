part of 'switch.dart';

final _util = SwitchSpecUtility.self;

final _container = _util.container;
final _indicator = _util.indicator;

Style get _baseStyle => Style(
      _container.borderRadius(99),
      _indicator.borderRadius(99),
      $on.selected(
        _container.alignment.centerRight(),
      ),
      $on.unselected(
        _container.alignment.centerLeft(),
      ),
    );

Style get _solidVariant => Style(
      _indicator.color.ref($rx.color.white()),
      $on.selected(
        _container.color.ref($rx.color.accent()),
      ),
      $on.unselected(
        _container.color.ref($rx.color.neutral(3)),
      ),
      $on.disabled(
        _container.color.ref($rx.color.neutralAlpha(3)),
        _indicator.color.ref($rx.color.neutralAlpha(7)),
      ),
    );

Style get _softVariant => Style(
      _indicator.color.ref($rx.color.accentAlpha(11)),
      $on.selected(
        _container.color.ref($rx.color.accentAlpha(3)),
      ),
      $on.unselected(
        _container.color.ref($rx.color.neutral(4)),
      ),
      $on.disabled(
        _container.color.ref($rx.color.neutralAlpha(3)),
        _indicator.color.ref($rx.color.neutralAlpha(7)),
      ),
    );

Style get _outlineVariant => Style(
      _container.color.transparent(),
      _container.border.width(1.5),
      _container.border.strokeAlign(1),
      _indicator.color.ref($rx.color.accentAlpha(11)),
      $on.selected(
        _container.border.color.ref($rx.color.accentAlpha(8)),
      ),
      $on.unselected(
        _container.border.color.ref($rx.color.neutral(4)),
      ),
      $on.disabled(
        _container.border.color.ref($rx.color.neutralAlpha(8)),
        _indicator.color.ref($rx.color.neutralAlpha(7)),
      ),
    );

Style get _surfaceVariant => Style(
      _outlineVariant(),
      $on.selected(
        _container.color.ref($rx.color.accentAlpha(3)),
      ),
      $on.unselected(
        _container.color.ref($rx.color.neutralAlpha(3)),
        _container.border.color.ref($rx.color.neutral(4)),
      ),
      $on.disabled(
        _container.color.ref($rx.color.neutralAlpha(2)),
      ),
    );

Style get _smallVariant => Style(
      _container.width(24),
      _container.padding.horizontal(2),
      _container.height(16),
      _indicator.size(12),
      $on.unselected(
        _indicator.size(8),
        _container.padding.horizontal(2),
      ),
    );

Style get _mediumVariant => Style(
      _container.width(32),
      _container.padding.horizontal(3),
      _container.height(20),
      _indicator.size(14),
      $on.unselected(
        _indicator.size(12),
      ),
    );

Style get _largeVariant => Style(
      _container.width(40),
      _container.padding.horizontal(3),
      _container.height(24),
      _indicator.size(18),
      $on.unselected(_indicator.size(16)),
    );

Style buildSwitchStyle() {
  return Style(
    _baseStyle(),
    // Sizes
    SwitchSize.small(_smallVariant()),
    SwitchSize.medium(_mediumVariant()),
    SwitchSize.large(_largeVariant()),
    SwitchVariant.solid(_solidVariant()),
    SwitchVariant.soft(_softVariant()),
    SwitchVariant.outline(_outlineVariant()),
    SwitchVariant.surface(_surfaceVariant()),
  );
}
