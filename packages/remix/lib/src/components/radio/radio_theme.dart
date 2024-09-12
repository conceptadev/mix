part of 'radio.dart';

class FortalezaRadioStyle extends RadioStyle {
  static const soft = Variant('for.radio.soft');
  static const surface = Variant('for.radio.surface');

  const FortalezaRadioStyle();

  static List<Variant> get variants => [soft, surface];

  @override
  Style makeStyle(SpecConfiguration<RadioSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);
    final baseOverrides = Style($.indicator.wrap.padding.all(3.5));

    final softVariant = Style(
      $.container.border.none(),
      $.container.color.$accent(4),
      $.indicator.color.$accent(10),
      spec.on.hover($.container.color.$accent(5)),
      spec.on.disabled(
        $.container.color.$neutral(3),
        $.container.border.color.black26(),
        $.indicator.color.$neutral(8),
      ),
    );

    final surfaceVariant = Style(
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

    return Style.create(
      [
        baseStyle(),
        baseOverrides(),
        spec.on.disabled(disabledVariant()),
        surface(surfaceVariant()),
        soft(softVariant()),
      ],
    );
  }
}
