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

class FortalezaDarkSwitchStyle extends FortalezaSwitchStyle {
  const FortalezaDarkSwitchStyle();

  @override
  Style makeStyle(SpecConfiguration<SwitchSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = Style(super.makeStyle(spec).call());

    final soft = Style(
      $.indicator.color.$neutral(12),
      $.container.chain
        ..color.$neutral(2)
        ..padding.all(1)
        ..border.color.$neutralAlpha(7)
        ..border.width(1.2),
      spec.on.selected($.container.color.$accent(9)),
      spec.on.disabled(
        $.container.color.$neutral(2),
        $.indicator.color.$neutral(4),
      ),
    );

    final surface = Style(
      $.indicator.color.$neutral(12),
      spec.on.disabled(
        $.container.color.$neutral(4),
        $.indicator.color.$neutral(2),
      ),
    );

    return Style(
      baseStyle(),
      FortalezaSwitchStyle.surface(soft()),
      FortalezaSwitchStyle.soft(surface()),
    );
  }
}
