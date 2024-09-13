part of 'radio.dart';

class FortalezaRadioStyle extends RadioStyle {
  static const soft = Variant('for.radio.soft');

  const FortalezaRadioStyle();

  static List<Variant> get variants => [soft];

  @override
  Style makeStyle(SpecConfiguration<RadioSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);

    final surfaceVariant = Style(
      $.indicator.wrap.padding.all(3.5),
      $.container.chain
        ..color.$neutral(1)
        ..border.width(1)
        ..border.color.$neutral(8),
      $.indicator.chain..color.$white(),
      spec.on.hover(
        $.container.chain
          ..color.$accentAlpha(4)
          ..border.color.$accentAlpha(8),
      ),
      spec.on.selected(
        $.container.chain
          ..border.none()
          ..color.$accent(9),
      ),
      (spec.on.selected & spec.on.hover)($.container.color.$accent(11)),
      (spec.on.disabled & spec.on.selected)(
        $.container.chain
          ..color.$neutral(3)
          ..border.style.solid(),
      ),
    );

    final disabledVariant = Style(
      $.container.chain
        ..color.$neutral(3)
        ..border.color.$neutral(5),
      $.indicator.color.$neutral(7),
    );

    final softVariant = Style(
      $.container.border.none(),
      $.container.color.$accent(4),
      $.indicator.color.$accent(10),
      spec.on.selected($.container.color.$accent(4)),
      spec.on.hover($.container.color.$accent(5)),
      (spec.on.hover & spec.on.selected)($.container.color.$accent(5)),
      spec.on.disabled(
        $.container.color.$neutral(3),
        $.container.border.color.black26(),
        $.indicator.color.$neutral(8),
      ),
    );

    return Style.create(
      [
        baseStyle(),
        surfaceVariant(),
        spec.on.disabled(disabledVariant()),
        soft(softVariant()),
      ],
    );
  }
}
