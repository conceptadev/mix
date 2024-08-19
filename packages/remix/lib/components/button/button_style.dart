part of 'button.dart';

final _util = ButtonSpecUtility.self;
final _label = _util.label;
final _spinner = _util.spinner;
final _container = _util.container;
final _flex = _util.flex;

/// This applies to the icon, label, and spinner
final _items = _util.items;

Style get _baseStyle {
  return Style(
    _flex.mainAxisAlignment.center(),
    _flex.crossAxisAlignment.center(),
    _flex.mainAxisSize.min(),
    _container.borderRadius(6),
    _spinner.strokeWidth(1),
    _label.style.fontWeight.w500(),
    _label.textHeightBehavior(
      const TextHeightBehavior(
        applyHeightToFirstAscent: false,
        applyHeightToLastDescent: true,
      ),
    ),
  );
}

Style get _onDisabledForeground {
  return Style(
    $on.disabled(
      _items.color.$neutralAlpha(7),
    ),
  );
}

Style get _solidVariant {
  return Style(
    _container.color.$accent(),
    _items.color.white(),
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
    _items.color.$accentAlpha(11),
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
    _container.border.width(1.5),
    _container.border.strokeAlign(0),
    _container.border.color.$accentAlpha(8),
    _items.color.$accentAlpha(11),
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

Style get _ghostVariant {
  return Style(
    _container.border.style.none(),
    _container.color.transparent(),
    _items.color.$accentAlpha(11),
    $on.hover(
      _container.color.$accentAlpha(3),
    ),
  );
}

Style get _smallVariant {
  return Style(
    _label.style.$text(1),
    _container.padding.vertical.$space(1),
    _container.padding.horizontal.$space(2),
    _flex.gap.$space(1),
    _items.size(12),
  );
}

Style get _mediumVariant {
  return Style(
    _container.padding.vertical.$space(2),
    _container.padding.horizontal.$space(3),
    _flex.gap.$space(2),
    _label.style.$text(2),
    _items.size(14),
  );
}

Style get _largeVariant {
  return Style(
    _container.padding.vertical.$space(2),
    _container.padding.horizontal.$space(4),
    _flex.gap.$space(3),
    _label.style.$text(3),
    _items.size(16),
  );
}

Style get _xLargeVariant {
  return Style(
    _container.padding.vertical.$space(3),
    _container.padding.horizontal.$space(5),
    _flex.gap.$space(3),
    _label.style.$text(4),
    _items.size(18),
  );
}

Style get _buttonSize {
  return Style(
    ButtonSize.small(_smallVariant()),
    ButtonSize.medium(_mediumVariant()),
    ButtonSize.large(_largeVariant()),
    ButtonSize.xlarge(_xLargeVariant()),
  );
}

Style get _buttonVariant {
  return Style(
    ButtonVariant.solid(_solidVariant()),
    ButtonVariant.surface(_surfaceVariant()),
    ButtonVariant.soft(_softVariant()),
    ButtonVariant.outline(_outlineVariant()),
    ButtonVariant.ghost(_ghostVariant()),
  );
}

Style _buildButtonStyle(Style? style, List<IButtonVariant> variants) {
  return Style(
    _baseStyle(),
    _buttonSize(),
    _onDisabledForeground(),
    _buttonVariant(),
  ).merge(style).applyVariants(variants);
}

extension ButtonSpecUtilityX<T extends Attribute> on ButtonSpecUtility<T> {
  ForegroundUtility<T> get items => ForegroundUtility((v) {
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
