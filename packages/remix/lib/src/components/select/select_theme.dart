part of 'select.dart';

class FortalezaSelectStyle extends SelectStyle {
  static const soft = Variant('for.select.soft');
  static const surface = Variant('for.select.surface');
  static const ghost = Variant('for.select.ghost');

  const FortalezaSelectStyle();

  static List<Variant> get variants => [soft, surface, ghost];

  @override
  Style makeStyle(SpecConfiguration<SelectSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);
    final baseThemeOverrides = Style(
      $.menu.autoWidth.off(),
      $.button.icon.color.$accentAlpha(12),
      $.menu.container.chain
        ..wrap.intrinsicWidth()
        ..elevation.e2()
        ..padding.all.$space(2),
      $.button.flex.chain
        ..gap.$space(1)
        ..mainAxisSize.min(),
    );

    final ghostVariant = Style(
      $.button.container.chain
        ..color.transparent()
        ..border.none(),
      spec.on.hover(
        $.button.container.color.$accent(4),
        $.item.container.color.$accent(4),
      ),
    );

    final softVariant = Style(
      $.button.container.chain
        ..color.$accent(3)
        ..border.none(),
      $.button.label.style.color.$accent(12),
      $.item.text.style.color.$accent(12),
      spec.on.hover(
        $.button.container.color.$accent(4),
        $.item.container.color.$accent(4),
      ),
    );

    final surfaceVariant = Style(
      spec.on.hover(
        $.button.container.border.all.color.$neutral(8),
        $.item.container.color.$accent(9),
        $.item.text.style.color.$white(),
      ),
    );

    return Style.create(
      [
        baseStyle(),
        baseThemeOverrides(),
        surface(surfaceVariant()),
        soft(softVariant()),
        ghost(ghostVariant()),
      ],
    );
  }
}
