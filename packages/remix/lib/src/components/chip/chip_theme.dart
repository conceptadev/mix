part of 'chip.dart';

class FortalezaChipStyle extends ChipStyle {
  static const ghost = Variant('for.chip.ghost');

  const FortalezaChipStyle();

  static List<Variant> get variants => [ghost];

  @override
  Style makeStyle(SpecConfiguration<ChipSpecUtility> spec) {
    final $ = spec.utilities;

    final iconStyle = [$.icon.color.$accent()];

    final labelStyle = [
      $.label.chain
        ..style.$text(2)
        ..style.color.$accent(),
    ];

    final flexContainerStyle = [
      $.flexContainer.chain
        ..flex.gap.$space(2)
        ..borderRadius(20)
        ..color.$accent(2)
        ..border.color.$accent(6)
        ..padding.vertical(8)
        ..padding.horizontal(12),
      (spec.on.hover & spec.on.unselected)($.flexContainer.color.$accent(3)),
      spec.on.selected($.flexContainer.color.$accent(4)),
    ];

    final disabledStyle = [
      spec.on.disabled(
        $.flexContainer.border.color.$neutral(4),
        $.flexContainer.color.$neutral(2),
        $.label.style.color.$neutral(8),
        $.icon.color.$neutral(8),
        spec.on.selected($.flexContainer.color.$neutral(4)),
      ),
    ];

    final ghostStyle = Style.create([
      $.flexContainer.chain
        ..borderRadius(6)
        ..color.$accent(1)
        ..border.style.none()
        ..padding.vertical(8)
        ..padding.horizontal(12),
      (spec.on.hover & spec.on.unselected)($.flexContainer.color.$accent(3)),
      spec.on.selected($.flexContainer.color.$accent(4)),
      spec.on.disabled(
        $.flexContainer.color.$neutral(2),
        $.icon.color.$neutral(8),
        (spec.on.selected)($.flexContainer.color.$neutral(4)),
      ),
    ]);

    return Style.create([
      super.makeStyle(spec).call(),
      ...flexContainerStyle,
      ...iconStyle,
      ...labelStyle,
      ...flexContainerStyle,
      ...disabledStyle,
      ghost(ghostStyle()),
    ]).animate(duration: const Duration(milliseconds: 150));
  }
}
