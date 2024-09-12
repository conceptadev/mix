part of 'progress.dart';

class FortalezaProgressStyle extends ProgressStyle {
  static const surface = Variant('for.progress.surface');
  static const soft = Variant('for.progress.soft');

  const FortalezaProgressStyle();

  static List<Variant> get variants => [surface, soft];

  @override
  Style makeStyle(SpecConfiguration<ProgressSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);
    final baseOverrides = Style(
      $.track.color.$neutral(6),
      $.fill.color.$accent(),
      $.container.clipBehavior.hardEdge(),
      $.outerContainer.clipBehavior.hardEdge(),
      $.outerContainer.shapeDecoration.shape.roundedRectangle(),
    );

    final surfaceVariant = Style(
      $.track.color.$neutral(3),
      $.fill.color.$accent(9),
      $.outerContainer.chain
        ..border.width(1)
        ..border.color.$neutralAlpha(6),
    );

    final softVariant = Style($.track.color.$neutral(4));

    return Style.create(
      [
        baseStyle(),
        baseOverrides(),
        surface(surfaceVariant()),
        soft(softVariant()),
      ],
    );
  }
}
