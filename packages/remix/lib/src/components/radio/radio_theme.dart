part of 'radio.dart';

class XRadioThemeVariant extends Variant {
  static const soft = XRadioThemeVariant('soft');
  static const surface = XRadioThemeVariant('surface');

  static const values = [soft, surface];

  const XRadioThemeVariant(String value) : super('radio.$value');
}

class XRadioThemeStyle {
  static Style get value => Style(
        XRadioStyle.base(),
        _indicator.wrap.padding.all(3.5),
        $on.disabled(_disabledVariant()),
        XRadioThemeVariant.surface(_surfaceVariant()),
        XRadioThemeVariant.soft(_softVariant()),
      );
}

Style get _softVariant {
  return Style(
    _container.border.none(),
    _container.color.$accent(4),
    _indicator.color.$accent(10),
    $on.hover(_container.color.$accent(5)),
    $on.disabled(
      _container.color.$neutral(3),
      _container.border.color.black26(),
      _indicator.color.$neutral(8),
    ),
  );
}

Style get _surfaceVariant {
  return Style(
    _container.color.$white(),
    _container.border.width(1),
    _container.border.color.$neutral(8),
    _indicator.color.$white(),
    $on.hover(
      _container.color.$accentAlpha(4),
      _container.border.color.$accentAlpha(8),
    ),
    $on.selected(_container.border.none(), _container.color.$accent(9)),
    ($on.selected & $on.hover)(_container.color.$accent(11)),
    ($on.disabled & $on.selected)(
      _container.color.$neutral(3),
      _container.border.style.solid(),
    ),
  );
}

Style get _disabledVariant {
  return Style(
    _container.color.$neutral(3),
    _container.border.color.$neutral(5),
    _indicator.color.$neutral(7),
  );
}
