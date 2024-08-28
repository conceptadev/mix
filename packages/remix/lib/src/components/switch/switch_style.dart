part of 'switch.dart';

final _util = SwitchSpecUtility.self;

final _container = _util.container;
final _indicator = _util.indicator;

class XSwitchStyle {
  static Style get base => Style(_containerStyle(), _indicatorStyle());
}

Style get _containerStyle => Style(
      _container.height(24),
      _container.width(44),
      _container.borderRadius(99),
      _container.padding.all(2),
      _container.alignment.centerLeft(),
      _container.color.black87(),
      $on.selected(
        _container.alignment.centerRight(),
        _container.color.black(),
      ),
    );

Style get _indicatorStyle => Style(
      _indicator.color.white(),
      _indicator.shape.circle(),
      _indicator.width(20),
      _indicator.shadow.color.black12(),
      _indicator.shadow.offset(0, 2),
      _indicator.shadow.blurRadius(4),
      _indicator.shadow.spreadRadius(1),
    );
