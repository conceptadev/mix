part of 'segmented_control.dart';

class XSegmentedControlThemeStyle {
  static final Style value = Style(
    XSegmentedControlStyle.base(),
    _container.padding(0),
    _item.container.padding.vertical.$space(2),
    _themedLight(),
    $on.dark(_themedDark()),
  );
}

Style get _themedLight => Style(
      $segmentedControl.showDivider.on(),
      _container.chain.color.$neutral(3),
      _item.label.style.color.$neutral(11),
      _divider.color.$neutral(7),
      $on.selected(
        _item.chain
          ..container.shadow.color.transparent()
          ..container.border.all.color.$neutral(7),
      ),
    );

Style get _themedDark => Style(
      $segmentedControl.showDivider.on(),
      _container.color.$neutral(12),
      _item.label.style.color.$neutral(4),
      _divider.color.$neutral(11),
      $on.selected(
        _item.chain
          ..container.color.$neutral(11)
          ..container.color.withOpacity(0.2)
          ..label.style.color.$neutral(1)
          ..container.shadow.color.transparent()
          ..container.border.all.color.withOpacity(0.4)
          ..container.border.all.color.$neutral(11),
      ),
    );
