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
    $on.dark(
      _container.color.$neutral(11),
      _indicator.color.$neutral(1),
      $on.selected(_container.color.$accent(11)),
    ),
  );
}

Style get _surfaceVariant {
  return Style(
    _indicator.color.$neutral(1),
    _container.chain
      ..padding.all(1)
      ..color.$neutral(4)
      ..border.all.width(1)
      ..border.all.color.$neutral(7),
    $on.disabled(
      _container.chain
        ..color.$neutral(4)
        ..border.all.color.$neutral(7),
      _indicator.color.$neutral(3),
    ),
    $on.selected(
      _container.chain
        ..color.$accent(9)
        ..border.all.color.$accent(10),
    ),
    $on.dark(_surfaceOnDark()),
  );
}

Style get _surfaceOnDark => Style(
      $on.selected(_container.border.all.color.$accent(9)),
      $on.disabled(
        _container.chain
          ..color.$neutral(12)
          ..border.all.color.$neutral(11)
          ..border.all.color.withOpacity(0.4),
        _indicator.chain
          ..color.$neutral(11)
          ..color.withOpacity(0.4),
      ),
      _container.chain
        ..border.all.color.$neutral(11)
        ..color.$neutral(12),
    );
