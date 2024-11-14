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
      $.menu.autoWidth.on(),
      $.menu.flexContainer.chain
        ..color.$neutral(1)
        ..border.all.color.$neutral(6)
        ..wrap.intrinsicWidth()
        ..padding.all.$space(2),
      $.button.chain
        ..flexContainer.border.all.color.$neutral(6)
        ..flexContainer.color.$neutral(1)
        ..icon.color.$accentAlpha(12)
        ..flexContainer.flex.gap.$space(1)
        ..flexContainer.flex.mainAxisSize.min(),
      $.item.flexContainer.padding.horizontal.$space(3),
      spec.on.disabled(
        $.button.chain
          ..flexContainer.color.$neutral(2)
          ..flexContainer.border.all.color.$neutral(8)
          ..label.style.color.$neutral(11)
          ..icon.color.$neutral(9),
      ),
      spec.on.hover(
        $.button.flexContainer.border.all.color.$neutral(8),
        $.item.flexContainer.color.$accent(9),
        $.item.text.style.color.$white(),
      ),
    );

    final softVariant = Style(
      $.button.flexContainer.chain
        ..color.$accent(3)
        ..border.none(),
      $.button.label.style.color.$accent(12),
      $.item.text.style.color.$accent(12),
      spec.on.hover(
        $.button.flexContainer.color.$accent(4),
        $.item.chain
          ..flexContainer.color.$accent(4)
          ..text.style.color.$accent(12),
      ),
    );

    final ghostVariant = Style(
      $.button.flexContainer.chain
        ..color.transparent()
        ..border.none(),
      spec.on.hover(
        $.button.flexContainer.color.$accent(4),
        $.item.chain
          ..flexContainer.color.$accent(4)
          ..text.style.color.$accent(12),
      ),
      spec.on.disabled(
        $.button.chain
          ..flexContainer.color.transparent()
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
        ..flexContainer.color.$neutral(1)
        ..flexContainer.border.all.color.$neutral(7),
      $.menu.flexContainer.color.$neutral(1),
      $.item.text.style.color.$neutral(12),
      spec.on.hover($.button.flexContainer.border.all.color.$neutral(8)),
    );

    final ghost = Style(
      $.button.chain
        ..label.style.color.$accent(12)
        ..icon.color.$accent(12)
        ..flexContainer.color.transparent()
        ..flexContainer.border.all.color.$neutral(7),
      $.item.text.style.color.$neutral(12),
    );

    return Style.create([
      baseStyle(),
      baseThemeOverrides(),
      FortalezaSelectStyle.ghost(ghost()),
    ]);
  }
}
