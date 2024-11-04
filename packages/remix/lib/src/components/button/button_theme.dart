part of 'button.dart';

class FortalezaButtonStyle extends ButtonStyle {
  static const soft = Variant('for.button.soft');
  static const outline = Variant('for.button.outline');
  static const surface = Variant('for.button.surface');
  static const ghost = Variant('for.button.ghost');

  const FortalezaButtonStyle();

  static List<Variant> get variants => [soft, outline, surface, ghost];

  @override
  Style makeStyle(SpecConfiguration<ButtonSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);
    final baseOverrides = Style(
      baseStyle(),
      $.container.chain
        ..padding.vertical.$space(2)
        ..padding.horizontal.$space(3),
      $.layout.gap.$space(2),
      $.label.style.$text(2),
      $.icon.size(14),
      $.spinner.size(14),
    );

    final onDisabledForeground = $on.disabled(
      $.container.color.$neutral(7),
      $.label.style.color.$neutral(8),
      $.icon.color.$neutral(8),
      $.spinner.color.$neutral(7),
    );

    final spinnerDisabled = $.spinner.color.$neutralAlpha(7);

    final solidVariant = Style(
      $.container.color.$accent(),
      $.label.style.color.white(),
      $.spinner.color.white(),
      $.icon.color.white(),
      spec.on.hover($.container.color.$accent(10)),
      spec.on.disabled($.container.color.$neutralAlpha(3), spinnerDisabled),
    );

    final softVariant = Style(
      $.container.color.$accentAlpha(3),
      $.label.style.color.$accentAlpha(11),
      $.spinner.color.$accentAlpha(11),
      $.icon.color.$accentAlpha(11),
      spec.on.hover($.container.color.$accentAlpha(4)),
      spec.on.disabled($.container.color.$neutralAlpha(3)),
    );

    final outlineVariant = Style(
      $.container.chain
        ..color.transparent()
        ..border.width(1)
        ..border.strokeAlign(0)
        ..border.color.$accentAlpha(8),
      $.spinner.color.$accentAlpha(11),
      $.icon.color.$accentAlpha(11),
      $.label.style.color.$accentAlpha(11),
      spec.on.hover($.container.color.$accentAlpha(2)),
      spec.on.disabled(
        $.container.chain
          ..border.color.$neutralAlpha(8)
          ..color.transparent(),
      ),
    );

    final surfaceVariant = Style(
      outlineVariant(),
      $.container.color.$accentAlpha(3),
      spec.on.hover(
        $.container.color.$accentAlpha(4),
        $.container.border.color.$accentAlpha(8),
      ),
      spec.on.disabled($.container.color.$neutral(1)),
    );

    final ghostVariant = Style(
      $.container.border.style.none(),
      $.container.color.transparent(),
      $.spinner.color.$accentAlpha(11),
      $.icon.color.$accentAlpha(11),
      $.label.style.color.$accentAlpha(11),
      spec.on.hover($.container.color.$accentAlpha(3)),
      spec.on.disabled($.container.color.transparent()),
    );

    return Style.create(
      [
        baseOverrides(),
        onDisabledForeground,
        solidVariant(),
        soft(softVariant()),
        outline(outlineVariant()),
        surface(surfaceVariant()),
        ghost(ghostVariant()),
      ],
    );
  }
}
