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
    _container.chain
      ..border.all.width(0)
      ..border.all.style.none(),
    _indicator.chain
      ..wrap.opacity(0)
      ..wrap.scale(0.5),
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
    $on.disabled(
      _container.color.$neutralAlpha(3),
      $on.selected(_container.color.$neutralAlpha(3)),
    ),
    $on.dark(_softOnDark()),
  );
}

Style get _softOnDark {
  return Style(
    _container.color.$accent(11),
    $on.selected(_container.color.$accent(11), _indicator.color.$accent(6)),
    $on.disabled(_container.color.$accent(11)),
    $on.hover(_container.color.$accent(9)),
    $on.disabled(
      _container.color.$neutral(12),
      _indicator.color.$neutral(10),
    ),
  );
}

Style get _surfaceVariant {
  return Style(
    _container.chain
      ..border.strokeAlign(BorderSide.strokeAlignInside)
      ..border.color.$neutral(8)
      ..border.style.solid(),
    _indicator.color.$white(),
    $on.hover(_container.color.$neutral(3)),
    $on.selected(
      _container.chain
        ..color.transparent()
        ..border.width(0)
        ..border.style.none()
        ..color.$accent(9),
    ),
    ($on.hover & $on.selected)(_container.color.$accent(11)),
    $on.disabled(
      _container.color.$neutralAlpha(2),
      $on.selected(_container.color.$neutral(4)),
    ),
    $on.dark(_surfaceOnDark()),
  );
}

Style get _surfaceOnDark {
  return Style(
    _container.border.color.$neutral(10),
    ($on.hover & $on.unselected)(_container.color.$neutral(12)),
    $on.disabled(
      _container.color.$neutral(12),
      _indicator.color.$neutral(10),
    ),
  );
}

Style get _disabledVariant {
  return Style(
    _container.chain
      ..color.$neutralAlpha(3)
      ..border.color.$neutralAlpha(5),
    _indicator.color.$neutralAlpha(7),
  );
}
