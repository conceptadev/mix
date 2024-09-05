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
  static Style get value => Style(
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
    _container.chain
      ..padding.vertical.$space(2)
      ..padding.horizontal.$space(3),
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
    $on.disabled(_container.color.$neutralAlpha(3), _spinnerDisable()),
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
    $on.dark(_softOnDark()),
  );
}

Style get _softOnDark {
  return Style(
    _container.color.$accent(12),
    _label.style.color.$accent(8),
    _icon.color.$accent(8),
    $on.hover(_container.color.$accentAlpha(12)),
    $on.disabled(
      _container.color.$neutral(12),
      _icon.color.$neutral(10),
      _label.style.color.$neutral(10),
      _spinner.color.$neutral(11),
    ),
  );
}

Style get _outlineVariant {
  return Style(
    _container.chain
      ..color.transparent()
      ..border.width(1)
      ..border.strokeAlign(0)
      ..border.color.$accentAlpha(8),
    _spinner.color.$accentAlpha(11),
    _icon.color.$accentAlpha(11),
    _label.style.color.$accentAlpha(11),
    $on.hover(_container.color.$accentAlpha(2)),
    $on.disabled(
      _container.chain
        ..border.color.$neutralAlpha(8)
        ..color.transparent(),
    ),
    $on.dark(_outlineOnDark()),
  );
}

Style get _outlineOnDark {
  return Style(
    _label.style.color.$accent(8),
    _icon.color.$accent(8),
    _container.border.color.$accent(11),
    $on.hover(_container.color.$accentAlpha(12)),
    $on.disabled(
      _container.border.color.$neutral(11),
      _icon.color.$neutral(10),
      _label.style.color.$neutral(10),
      _spinnerDisable(),
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
    $on.dark(_surfaceOnDark()),
  );
}

Style get _surfaceOnDark {
  return Style(
    _outlineOnDark(),
    _container.color.$accent(12),
    $on.hover(
      _container.color.$accent(12),
      _container.border.color.$accent(11),
    ),
    $on.disabled(_container.color.$neutral(12), _spinnerDisable()),
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
    $on.dark(_ghostOnDark()),
  );
}

Style get _ghostOnDark {
  return Style(
    _container.color.transparent(),
    _label.style.color.$accent(8),
    _icon.color.$accent(8),
    $on.disabled(
      _container.color.transparent(),
      _label.style.color.$neutral(11),
      _icon.color.$neutral(11),
      _spinnerDisable(),
    ),
  );
}

Style get _spinnerDisable {
  return Style(_spinner.color.$neutral(11));
}
