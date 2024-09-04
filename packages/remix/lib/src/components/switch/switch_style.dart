part of 'switch.dart';

final _util = SwitchSpecUtility.self;

final _container = _util.container;
final _indicator = _util.indicator;

class XSwitchStyle {
  static Style get base => Style(_containerStyle(), _indicatorStyle());
}

Style get _containerStyle => Style(
      _container.chain
        ..height(24)
        ..width(44)
        ..borderRadius(99)
        ..padding.all(2)
        ..alignment.centerLeft()
        ..color.grey.shade300(),
      $on.selected(
        _container.chain
          ..alignment.centerRight()
          ..color.black(),
      ),
      ($on.disabled & $on.selected)(_container.color.grey.shade500()),
    );

Style get _indicatorStyle => Style(
      _indicator.chain
        ..color.white()
        ..shape.circle()
        ..width(20)
        ..shadow.color.black12()
        ..shadow.offset(0, 2)
        ..shadow.blurRadius(4)
        ..shadow.spreadRadius(1),
      $on.disabled(_indicator.color.grey.shade100()),
    );
