part of 'select.dart';

class XSelectThemeVariant extends Variant {
  static const soft = XSelectThemeVariant('soft');
  static const surface = XSelectThemeVariant('surface');
  static const ghost = XSelectThemeVariant('ghost');

  static const values = [soft, surface, ghost];

  const XSelectThemeVariant(String value) : super('select.$value');
}

class XSelectThemeStyle {
  static Style get value => Style(
        XSelectStyle.base(),
        _baseThemeStyle(),
        XSelectThemeVariant.surface(_surface()),
        XSelectThemeVariant.soft(_soft()),
        XSelectThemeVariant.ghost(_ghost()),
      );
}

Style get _baseThemeStyle => Style(
      _menu.autoWidth.off(),
      // Icon
      _button.icon.color.$accentAlpha(12),
      // Container
      _menu.container.chain
        ..wrap.intrinsicWidth()
        ..elevation.e2()
        ..padding.all.$space(2),
      // Flex
      _button.flex.chain
        ..gap.$space(1)
        ..mainAxisSize.min(),
    );

Style get _ghost => Style(
      _button.container.chain
        ..color.transparent()
        ..border.none(),
      $on.hover(
        _button.container.color.$accent(4),
        _item.container.color.$accent(4),
      ),
      $on.dark(
        _button.chain
          ..container.color.transparent()
          ..icon.color.$accent(5)
          ..label.style.color.$accent(5),
        $on.hover(
          _button.container.color.$accent(12),
          _item.container.color.$accent(11),
        ),
        _menuOnDark(),
      ),
    );

Style get _soft => Style(
      _button.container.chain
        ..color.$accent(3)
        ..border.none(),
      _button.label.style.color.$accent(12),
      _item.text.style.color.$accent(12),
      $on.hover(
        _button.container.color.$accent(4),
        _item.container.color.$accent(4),
      ),
      $on.dark(_softOnDark()),
    );

Style get _softOnDark => Style(
      $on.dark(
        _button.chain
          ..container.color.$accent(12)
          ..label.style.color.$accent(6)
          ..icon.color.$accent(6),
        _menuOnDark(),
        $on.hover(
          _button.container.color.$accent(11),
          _item.container.color.$accent(11),
        ),
      ),
    );

Style get _surface => Style(
      $on.hover(
        _button.container.border.all.color.$neutral(8),
        _item.container.color.$accent(9),
        _item.text.style.color.$white(),
      ),
      $on.dark(
        _button.chain
          ..container.color.black()
          ..container.border.color.$neutral(11)
          ..label.style.color.$neutral(4)
          ..icon.color.$neutral(4),
        _menuOnDark(),
        $on.hover(_button.container.border.color.$neutral(10)),
      ),
    );

Style get _menuOnDark => Style(
      _menu.container.color.$neutral(12),
      _item.text.style.color.$neutral(7),
    );
