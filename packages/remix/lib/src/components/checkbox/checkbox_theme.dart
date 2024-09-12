part of 'checkbox.dart';

class FortalezaCheckboxStyle extends CheckboxStyle {
  static const soft = Variant('for.checkbox.soft');
  static const surface = Variant('for.checkbox.surface');

  const FortalezaCheckboxStyle();

  static List<Variant> get variants => [soft, surface];

  @override
  Style makeStyle(SpecConfiguration<CheckboxSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);
    final baseOverrides = Style(
      $.container.chain
        ..border.all.width(0)
        ..border.all.style.none(),
      $.indicator.chain
        ..wrap.opacity(0)
        ..wrap.scale(0.5),
      spec.on.selected($.indicator.wrap.opacity(1), $.indicator.wrap.scale(1)),
    );

    final softVariant = Style(
      $.container.color.$accentAlpha(6),
      $.indicator.color.$accentAlpha(11),
      spec.on.hover($.container.color.$accentAlpha(5)),
      (spec.on.hover & spec.on.selected)($.container.color.$accentAlpha(5)),
      spec.on.selected(
        $.container.color.$accentAlpha(6),
        $.indicator.color.$accentAlpha(11),
      ),
      spec.on.disabled(
        $.container.color.$neutralAlpha(3),
        spec.on.selected($.container.color.$neutralAlpha(3)),
      ),
    );

    final surfaceVariant = Style(
      $.container.chain
        ..border.strokeAlign(BorderSide.strokeAlignInside)
        ..border.color.$neutral(9)
        ..border.style.solid(),
      $.indicator.color.$white(),
      spec.on.hover($.container.color.$neutral(3)),
      spec.on.selected(
        $.container.chain
          ..color.transparent()
          ..border.width(0)
          ..border.style.none()
          ..color.$accent(9),
      ),
      (spec.on.hover & spec.on.selected)($.container.color.$accent(11)),
      spec.on.disabled(
        $.container.color.$neutral(3),
        $.container.border.all.color.$neutral(9),
        spec.on.selected(
          $.indicator.color.$neutral(8),
          $.container.chain
            ..color.$neutral(3)
            ..border.width(1)
            ..border.all.color.$neutral(8)
            ..border.all.style.solid(),
        ),
      ),
    );

    final disabledVariant = Style(
      $.container.chain
        ..color.$neutral(3)
        ..border.color.$neutral(5),
      $.indicator.color.$neutral(7),
    );

    return Style.create(
      [
        baseStyle(),
        baseOverrides(),
        spec.on.disabled(disabledVariant()),
        soft(softVariant()),
        surface(surfaceVariant()),
      ],
    );
  }
}
