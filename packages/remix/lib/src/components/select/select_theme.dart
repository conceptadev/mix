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
      _menu.container.wrap.intrinsicWidth(),
      _menu.container.elevation.e2(),
      _item.container.padding.horizontal.$space(2),
      _menu.container.padding.all.$space(2),
      _button.flex.gap.$space(1),
      _button.flex.mainAxisSize.min(),
      _button.icon.color.$accentAlpha(12),
    );

Style get _ghost => Style(
      XSelectThemeVariant.ghost(
        _button.container.color.transparent(),
        _button.container.border.none(),
        $on.hover(
          _button.container.color.$accent(4),
          _item.container.color.$accent(4),
        ),
      ),
    );

Style get _soft => Style(
      _button.container.color.$accent(3),
      _button.container.border.none(),
      _button.label.style.color.$accent(12),
      _item.text.style.color.$accent(12),
      $on.hover(
        _button.container.color.$accent(4),
        _item.container.color.$accent(4),
      ),
    );

Style get _surface => Style(
      $on.hover(
        _button.container.border.all.color.$neutral(8),
        _item.container.color.$accent(9),
        _item.text.style.color.$white(),
      ),
    );
