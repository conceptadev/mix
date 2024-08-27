part of 'button.dart';

class ButtonThemeVariant extends Variant {
  static const solid = ButtonThemeVariant('solid');
  static const soft = ButtonThemeVariant('soft');
  static const outline = ButtonThemeVariant('outline');
  static const surface = ButtonThemeVariant('surface');
  static const ghost = ButtonThemeVariant('ghost');

  static const values = [solid, soft, outline, surface, ghost];

  const ButtonThemeVariant(String value) : super('button.$value');
}

class XButtonThemeStyle extends XButtonStyle {
  static Style get light => Style(
        XButtonStyle.base(),
        _tokenOverrides(),
        _onDisabledForeground(),

        // Type variants
        ButtonThemeVariant.solid(_solidVariant()),
        ButtonThemeVariant.surface(_surfaceVariant()),
        ButtonThemeVariant.soft(_softVariant()),
        ButtonThemeVariant.outline(_outlineVariant()),
        ButtonThemeVariant.ghost(_ghostVariant()),
      );
}

Style get _onDisabledForeground {
  return Style(
    $on.disabled(
      _icon.color.$neutralAlpha(7),
      _label.style.color.$neutralAlpha(7),
      _spinner.color.$neutralAlpha(7),
    ),
  );
}

Style get _tokenOverrides {
  return Style(
    _container.padding.vertical.$space(2),
    _container.padding.horizontal.$space(3),
    _flex.gap.$space(2),
    _label.style.$text(2),
    _icon.size(14),
    _spinner.size(14),
  );
}

Style get _solidVariant {
  return Style(
    _container.color.$accent(),
    _label.style.color.white(),
    _spinner.color.white(),
    _icon.color.white(),
    $on.hover(_container.color.$accent(10)),
    $on.disabled(_container.color.$neutralAlpha(3)),
  );
}

Style get _softVariant {
  return Style(
    _container.color.$accentAlpha(3),
    _label.style.color.$accentAlpha(11),
    _spinner.color.$accentAlpha(11),
    _icon.color.$accentAlpha(11),
    $on.hover(_container.color.$accentAlpha(4)),
    $on.disabled(_container.color.$neutralAlpha(3)),
  );
}

Style get _outlineVariant {
  return Style(
    _container.color.transparent(),
    _container.border.width(1.5),
    _container.border.strokeAlign(0),
    _container.border.color.$accentAlpha(8),
    _spinner.color.$accentAlpha(11),
    _icon.color.$accentAlpha(11),
    _label.style.color.$accentAlpha(11),
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
    $on.disabled(_container.color.$neutralAlpha(2)),
  );
}

Style get _ghostVariant {
  return Style(
    _container.border.style.none(),
    _container.color.transparent(),
    _spinner.color.$accentAlpha(11),
    _icon.color.$accentAlpha(11),
    _label.style.color.$accentAlpha(11),
    $on.hover(_container.color.$accentAlpha(3)),
  );
}
