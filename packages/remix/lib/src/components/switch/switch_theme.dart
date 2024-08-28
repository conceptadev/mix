part of 'switch.dart';

class XSwitchThemeVariant extends Variant {
  static const soft = XSwitchThemeVariant('soft');
  static const surface = XSwitchThemeVariant('surface');

  static const values = [soft, surface];

  const XSwitchThemeVariant(String value) : super('switch.$value');
}

class XSwitchThemeStyle {
  static Style get value => Style(
        XSwitchStyle.base(),

        // Variant

        XSwitchThemeVariant.soft(_softVariant()),
        XSwitchThemeVariant.surface(_surfaceVariant()),
      );
}

Style get _softVariant {
  return Style(
    _indicator.color.$neutral(1),
    _container.color.$neutral(6),
    $on.selected(_container.color.$accent(8)),
    $on.disabled(_container.color.$neutral(6), _indicator.color.$neutral(4)),
  );
}

Style get _surfaceVariant {
  return Style(
    _indicator.color.$neutral(1),
    _container.padding.all(0),
    _container.color.$neutral(4),
    _container.border.all.width(1.5),
    _container.border.all.color.$neutral(7),
    $on.selected(
      _container.color.$accent(8),
      _container.border.color.$accent(8),
    ),
    $on.disabled(
      _container.color.$neutral(4),
      _indicator.color.$neutral(3),
      _container.border.all.color.$neutral(7),
    ),
  );
}
