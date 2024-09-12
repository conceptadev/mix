part of 'card.dart';

class FortalezaCardStyle extends CardStyle {
  static const surface = Variant('surface');
  static const ghost = Variant('ghost');

  const FortalezaCardStyle();

  static List<Variant> get variants => [surface, ghost];

  @override
  Style makeStyle(SpecConfiguration<CardSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);

    final surfaceVariant = Style(
      $.container.borderRadius.all.$radius(2),
      spec.on.hover($.container.color.$neutral(8)),
    );

    final ghostVariant = Style(
      $.container.chain
        ..border.none()
        ..color.transparent(),
      spec.on.hover($.container.color.$neutral(3)),
    );

    return Style.create(
      [
        baseStyle(),
        $.container.padding.all.$space(3),
        surface(surfaceVariant()),
        ghost(ghostVariant()),
      ],
    );
  }
}
