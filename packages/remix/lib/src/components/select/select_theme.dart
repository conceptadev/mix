part of 'select.dart';

class FortalezaSelectStyle extends SelectStyle {
  static const soft = Variant('for.select.soft');
  static const ghost = Variant('for.select.ghost');

  const FortalezaSelectStyle();

  static List<Variant> get variants => [soft, ghost];

  @override
  Style makeStyle(SpecConfiguration<SelectSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);

    final baseThemeOverrides = Style(
      $.menu.autoWidth.off(),
      $.item.container.padding.horizontal.$space(3),
      $.button.icon.color.$accentAlpha(12),
      $.menu.container.chain
        ..color.$neutral(1)
        ..border.all.color.$neutral(5)
        ..wrap.intrinsicWidth()
        ..elevation.e2()
        ..padding.all.$space(2),
      $.button.flex.chain
        ..gap.$space(1)
        ..mainAxisSize.min(),
      spec.on.disabled(
        $.button.chain
          ..container.color.$neutral(2)
          ..container.border.all.color.$neutral(8)
          ..label.style.color.$neutral(11)
          ..icon.color.$neutral(9),
      ),
      spec.on.hover(
        $.button.container.border.all.color.$neutral(8),
        $.item.container.color.$accent(9),
        $.item.text.style.color.$white(),
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
        $.item.chain
          ..container.color.$accent(4)
          ..text.style.color.$accent(12),
      ),
    );

    final ghostVariant = Style(
      $.button.container.chain
        ..color.transparent()
        ..border.none(),
      spec.on.hover(
        $.button.container.color.$accent(4),
        $.item.chain
          ..container.color.$accent(4)
          ..text.style.color.$accent(12),
      ),
      spec.on.disabled(
        $.button.chain
          ..container.color.transparent()
          ..label.style.color.$neutral(11)
          ..icon.color.$neutral(9),
      ),
    );

    return Style.create(
      [
        baseStyle(),
        baseThemeOverrides(),
        soft(softVariant()),
        ghost(ghostVariant()),
      ],
    );
  }
}

class FortalezaDarkSelectStyle extends FortalezaSelectStyle {
  const FortalezaDarkSelectStyle();

  @override
  Style makeStyle(SpecConfiguration<SelectSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = Style(super.makeStyle(spec).call());

    final baseThemeOverrides = Style(
      $.button.chain
        ..label.style.color.$neutral(12)
        ..container.color.$neutral(1)
        ..container.border.all.color.$neutral(7),
      $.menu.container.color.$neutral(1),
      $.item.text.style.color.$neutral(12),
      spec.on.hover($.button.container.border.all.color.$neutral(8)),
    );

    final ghost = Style(
      $.button.chain
        ..label.style.color.$accent(12)
        ..icon.color.$accent(12)
        ..container.color.transparent()
        ..container.border.all.color.$neutral(7),
      $.item.text.style.color.$neutral(12),
    );

    return Style.create([
      baseStyle(),
      baseThemeOverrides(),
      FortalezaSelectStyle.ghost(ghost()),
    ]);
  }
}
