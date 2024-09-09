part of 'segmented_control.dart';

class XSegmentedControlThemeStyle {
  static final Style value = Style(
    XSegmentedControlStyle.base(),
    $segmentedControl.showDivider.on(),
    _container.padding(0),
    _container.chain.color.$neutral(3),
    _item.container.padding.vertical.$space(2),
    _item.label.style.color.$neutral(11),
    _divider.color.$neutral(7),
    $on.selected(
      _item.chain
        ..container.shadow.color.transparent()
        ..container.border.all.color.$neutral(7),
    ),
  );
}
