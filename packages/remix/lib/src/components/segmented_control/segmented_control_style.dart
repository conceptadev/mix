// ignore_for_file: camel_case_types

part of 'segmented_control.dart';

final _container = $segmentedControl.container;
final _divider = $segmentedControl.divider;
final _flex = $segmentedControl.flex;
final _item = $segmentedControl.item;

class XSegmentedControlStyle {
  static final Style base = Style(
    _containerStyle(),
    _flexStyle(),
    _segmentStyle(),
    _dividerStyle(),
    $segmentedControl.showDivider.off(),
    $on.selected(_onSelectSegmentStyle()),
  );
}

Style get _containerStyle => Style(
      _container.chain
        ..wrap.intrinsicHeight()
        ..padding.all(4)
        ..borderRadius.all(8)
        ..color(Colors.black.withOpacity(0.07)),
    );

Style get _dividerStyle => Style(
      _divider.chain
        ..width(1)
        ..margin.vertical(4)
        ..color.black26(),
    );

Style get _flexStyle => Style(
      _flex.chain
        ..row()
        ..mainAxisSize.min(),
    );

Style get _segmentStyle => Style(
      _item.label.chain
        ..style.color(Colors.black.withOpacity(0.6))
        ..style.fontSize(14),
      _item.icon.chain
        ..size(20)
        ..color(Colors.black.withOpacity(0.6)),
      _item.container.chain
        ..padding.vertical(6)
        ..padding.horizontal(12)
        ..borderRadius.all(6),
    );
Style get _onSelectSegmentStyle => Style(
      $segmentedControl.item.container.chain
        ..color.white()
        ..shadow.color(Colors.black.withOpacity(0.1))
        ..shadow.offset(0, 2)
        ..shadow.spreadRadius(1)
        ..shadow.blurRadius(4),
      $segmentedControl.item.chain
        ..icon.color(Colors.black.withOpacity(1))
        ..label.style.color(Colors.black.withOpacity(1)),
    );
