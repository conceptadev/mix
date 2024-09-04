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
    $on.dark(_softOnDark()),
  );
}

Style get _softOnDark {
  return Style(
    _container.color.$neutral(3),
    _container.color.$accent(11),
    _indicator.color.$accent(4),
    $on.hover(_container.color.$accent(10)),
    $on.disabled(_container.color.$neutral(12)),
  );
}

Style get _surfaceVariant {
  return Style(
    _container.chain
      ..color.$white()
      ..border.width(1)
      ..border.color.$neutral(8),
    _indicator.chain..color.$white(),
    $on.hover(
      _container.chain
        ..color.$accentAlpha(4)
        ..border.color.$accentAlpha(8),
    ),
    $on.selected(
      _container.chain
        ..border.none()
        ..color.$accent(9),
    ),
    ($on.selected & $on.hover)(_container.color.$accent(11)),
    ($on.disabled & $on.selected)(
      _container.chain
        ..color.$neutral(3)
        ..border.style.solid(),
    ),
    $on.dark(_surfaceOnDark()),
  );
}

Style get _surfaceOnDark {
  return Style(
    _container.chain
      ..color.transparent()
      ..border.color.$neutral(11),
    $on.hover(
      _container.chain
        ..color.transparent()
        ..border.color.$accent(11),
      $on.selected(_container.color.$accent(11)),
    ),
    $on.disabled(
      _container.chain
        ..color.$neutral(12)
        ..border.color.$neutral(11),
      _indicator.color.$neutral(11),
    ),
  );
}

Style get _disabledVariant {
  return Style(
    _container.chain
      ..color.$neutral(3)
      ..border.color.$neutral(5),
    _indicator.color.$neutral(7),
  );
}
