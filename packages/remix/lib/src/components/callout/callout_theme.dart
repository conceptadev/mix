part of 'callout.dart';

class FortalezaCalloutStyle extends CalloutStyle {
  static const soft = Variant('for.callout.soft');
  static const surface = Variant('for.callout.surface');
  static const outline = Variant('for.callout.outline');

  const FortalezaCalloutStyle();

  static List<Variant> get variants => [soft, surface, outline];

  @override
  Style makeStyle(SpecConfiguration<CalloutSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);
    final baseOverrides = Style(
      baseStyle(),
      $.flex.chain
        ..gap.$space(3)
        ..crossAxisAlignment.center()
        ..mainAxisAlignment.start()
        ..wrap.padding(16),
      $.container.borderRadius(8),
      $.icon.chain
        ..color.$accentAlpha(11)
        ..size(20),
      $.text.chain
        ..style.color.$accentAlpha(11)
        ..style.fontWeight.w400(),
    );

    final softVariant = Style(
      $.container.chain
        ..color.$accentAlpha(3)
        ..border.all.width(0)
        ..border.all.style.none(),
      spec.on.dark(
        $.container.color.$accent(12),
        $.text.style.color.$accent(8),
        $.icon.color.$accent(8),
      ),
    );

    final surfaceVariant = Style(
      $.container.chain
        ..color.$accentAlpha(2)
        ..border.width(1)
        ..border.color.$accentAlpha(5),
      spec.on.dark(
        $.container.color.$accentAlpha(6),
        $.container.border.color.$accent(11),
        $.text.style.color.$accent(8),
        $.icon.color.$accent(8),
      ),
    );

    final outlineVariant = Style(
      $.container.chain
        ..color.transparent()
        ..border.width(1)
        ..border.color.$accentAlpha(8),
      spec.on.dark(
        $.container.chain
          ..color.transparent()
          ..border.color.$accent(11),
        $.text.style.color.$accent(8),
        $.icon.color.$accent(8),
      ),
    );

    return Style.create(
      [
        baseOverrides(),
        soft(softVariant()),
        surface(surfaceVariant()),
        outline(outlineVariant()),
      ],
    );
  }
}
