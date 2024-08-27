part of 'checkbox.dart';

class XCheckboxThemeVariant extends Variant {
  static const soft = XCheckboxThemeVariant('soft');
  static const surface = XCheckboxThemeVariant('surface');

  static const values = [soft, surface];

  const XCheckboxThemeVariant(String value) : super('checkbox.$value');
}

class XCheckboxThemeStyle {
  static Style get value => Style(
        XCheckboxStyle.base(),
        _baseStyle(),
        $on.disabled(_disabledVariant()),
        XCheckboxThemeVariant.soft(_softVariant()),
        XCheckboxThemeVariant.surface(_surfaceVariant()),
      );
}

Style get _baseStyle {
  return Style(
    _container.border.all.width(0),
    _container.border.all.style.none(),
    _indicator.wrap.opacity(0),
    _indicator.wrap.scale(0.5),
    $on.selected(_indicator.wrap.opacity(1), _indicator.wrap.scale(1)),
  );
}

Style get _softVariant {
  return Style(
    _container.color.$accentAlpha(6),
    _indicator.color.$accentAlpha(11),
    $on.hover(_container.color.$accentAlpha(5)),
    ($on.hover & $on.selected)(_container.color.$accentAlpha(5)),
    $on.selected(
      _container.color.$accentAlpha(6),
      _indicator.color.$accentAlpha(11),
    ),
    $on.disabled(_container.color.$neutralAlpha(3)),
  );
}

Style get _surfaceVariant {
  return Style(
    _container.border.strokeAlign(BorderSide.strokeAlignInside),
    _container.border.color.$neutral(8),
    _container.border.style.solid(),
    _indicator.color.$white(),
    $on.hover(_container.color.$neutral(3)),
    $on.selected(
      _container.color.transparent(),
      _container.border.width(0),
      _container.border.style.none(),
      _container.color.$accent(9),
    ),
    ($on.hover & $on.selected)(_container.color.$accent(11)),
    $on.disabled(_container.color.$neutralAlpha(2)),
  );
}

Style get _disabledVariant {
  return Style(
    _container.color.$neutralAlpha(3),
    _container.border.color.$neutralAlpha(5),
    _indicator.color.$neutralAlpha(7),
  );
}
