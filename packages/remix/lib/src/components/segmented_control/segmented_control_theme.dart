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
        $.item.chain
          ..container.shadow.color.transparent()
          ..container.border.all.color.$neutral(7),
      ),
    );

    return Style.create([baseStyle(), style()]);
  }
}
