part of 'chip.dart';

class FortalezaChipStyle extends ChipStyle {
  static const ghost = Variant('for.chip.ghost');

  const FortalezaChipStyle();

  static List<Variant> get variants => [ghost];

  @override
  Style makeStyle(SpecConfiguration<ChipSpecUtility> spec) {
    final $ = spec.utilities;

    final layoutStyle = [$.layout.gap.$space(2)];

    final iconStyle = [$.icon.color.$accent()];

    final labelStyle = [
      $.label.chain
        ..style.$text(2)
        ..style.color.$accent(),
    ];

    final containerStyle = [
      $.container.chain
        ..borderRadius(20)
        ..color.$accent(2)
        ..border.color.$accent(6)
        ..padding.vertical(8)
        ..padding.horizontal(12),
      (spec.on.hover & spec.on.unselected)($.container.color.$accent(3)),
      spec.on.selected($.container.color.$accent(4)),
    ];

    final disabledStyle = [
      spec.on.disabled(
        $.container.border.color.$neutral(4),
        $.container.color.$neutral(2),
        $.label.style.color.$neutral(8),
        $.icon.color.$neutral(8),
        spec.on.selected($.container.color.$neutral(4)),
      ),
    ];

    final ghostStyle = Style.create([
      $.container.chain
        ..borderRadius(6)
        ..color.$accent(1)
        ..border.style.none()
        ..padding.vertical(8)
        ..padding.horizontal(12),
      (spec.on.hover & spec.on.unselected)($.container.color.$accent(3)),
      spec.on.selected($.container.color.$accent(4)),
      spec.on.disabled(
        $.container.color.$neutral(2),
        $.icon.color.$neutral(8),
        (spec.on.selected)($.container.color.$neutral(4)),
      ),
    ]);

    return Style.create([
      super.makeStyle(spec).call(),
      ...layoutStyle,
      ...iconStyle,
      ...labelStyle,
      ...containerStyle,
      ...disabledStyle,
      ghost(ghostStyle()),
    ]).animate(duration: const Duration(milliseconds: 150));
  }
}
