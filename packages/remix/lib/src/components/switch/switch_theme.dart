part of 'switch.dart';

class FortalezaSwitchStyle extends SwitchStyle {
  static const soft = Variant('for.switch.soft');
  static const surface = Variant('for.switch.surface');

  const FortalezaSwitchStyle();

  static List<Variant> get variants => [soft, surface];

  @override
  Style makeStyle(SpecConfiguration<SwitchSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);

    final softVariant = Style(
      $.indicator.color.$neutral(1),
      $.container.color.$neutral(6),
      spec.on.selected($.container.color.$accent(8)),
      spec.on.disabled(
        $.container.color.$neutral(6),
        $.indicator.color.$neutral(4),
      ),
    );

    final surfaceVariant = Style(
      $.indicator.color.$neutral(1),
      $.container.chain
        ..padding.all(1)
        ..color.$neutral(4)
        ..border.all.width(1)
        ..border.all.color.$neutral(7),
      spec.on.disabled(
        $.container.chain
          ..color.$neutral(4)
          ..border.all.color.$neutral(7),
        $.indicator.color.$neutral(3),
      ),
      spec.on.selected(
        $.container.chain
          ..color.$accent(9)
          ..border.all.color.$accent(10),
      ),
    );

    return Style.create(
      [baseStyle(), soft(softVariant()), surface(surfaceVariant())],
    );
  }
}
