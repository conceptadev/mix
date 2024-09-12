part of 'segmented_control.dart';

class FortalezaSegmentedControlStyle extends SegmentedControlStyle {
  const FortalezaSegmentedControlStyle();

  @override
  Style makeStyle(SpecConfiguration<SegmentedControlSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);

    final style = Style(
      $.container.padding(0),
      $.item.container.padding.vertical.$space(2),
      $.showDivider.on(),
      $.container.color.$neutral(3),
      $.item.label.style.color.$neutral(11),
      $.divider.color.$neutral(7),
      spec.on.selected(
        $.item.container.color.$neutral(1),
        $.item.chain
          ..container.shadow.color.transparent()
          ..container.border.all.color.$neutral(7),
      ),
    );

    return Style.create([baseStyle(), style()]);
  }
}

class FortalezaDarkSegmentedControlStyle
    extends FortalezaSegmentedControlStyle {
  const FortalezaDarkSegmentedControlStyle();

  @override
  Style makeStyle(SpecConfiguration<SegmentedControlSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);

    final style = Style(
      $.container.color.$neutral(2),
      $.container.borderRadius.all.$radius(1),
      $on.selected(
        $.item.container.borderRadius.all.$radius(1),
        $.item.container.color.$neutral(4),
        $.item.chain
          ..label.style.color.$neutral(12)
          ..container.shadow.color.transparent()
          ..container.border.all.color.$neutral(7),
      ),
    );

    return Style.create([baseStyle(), style()]);
  }
}
