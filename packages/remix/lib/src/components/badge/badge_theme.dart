part of 'badge.dart';

class FortalezaBadgeStyle extends BadgeStyle {
  static const solid = Variant('for.badge.solid');
  static const soft = Variant('for.badge.soft');
  static const surface = Variant('for.badge.surface');
  static const outline = Variant('for.badge.outline');

  const FortalezaBadgeStyle();

  static List<Variant> get variants => [solid, soft, surface, outline];

  @override
  Style makeStyle(SpecConfiguration<BadgeSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);

    final solidVariant = Style(
      $.container.color.$accent(),
      $.label.style.color.$neutral(1),
    );

    final softVariant = Style(
      $.container.color.$accent(3),
      $.label.style.color.$accent(11),
      spec.on.dark(
        $.container.color.$accentAlpha(12),
        $.label.style.color.$accent(7),
      ),
    );

    final surfaceVariant = Style(
      $.container.chain
        ..color.$accentAlpha(2)
        ..border.all.width(1)
        ..border.all.color.$accentAlpha(6),
      $.label.style.color.$accentAlpha(11),
      spec.on.dark(
        $.container.chain
          ..border.all.color.$accent(9)
          ..color.$accentAlpha(12),
        $.label.style.color.$accent(7),
      ),
    );

    final outlineVariant = Style(
      $.container.chain
        ..color.transparent()
        ..border.width(1)
        ..border.color.$accentAlpha(8),
      $.label.style.color.$accentAlpha(11),
      spec.on.dark(
        $.container.border.all.color.$accent(9),
        $.label.style.color.$accent(7),
      ),
    );

    return Style.create(
      [
        baseStyle(),
        solid(solidVariant()),
        soft(softVariant()),
        surface(surfaceVariant()),
        outline(outlineVariant()),
      ],
    );
  }
}
