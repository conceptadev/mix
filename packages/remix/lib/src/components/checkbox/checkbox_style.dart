// ignore_for_file: camel_case_types

part of 'checkbox.dart';

final _util = CheckboxSpecUtility.self;
final _container = _util.container;
final _indicator = _util.indicator;

class XCheckboxStyle {
  static Style get base => Style(_containerStyle(), _indicatorStyle());
}

Style get _containerStyle => Style(
      _container.borderRadius(4),
      _container.border.all.color.black(),
      $on.selected(_container.color.black()),
      $on.disabled(
        _container.border.all.color.black(),
        _container.border.all.color.brighten(50),
        $on.selected(
          _container.color.black(),
          _container.color.brighten(50),
        ),
      ),
    );

Style get _indicatorStyle => Style(
      _indicator.size(16),
      _indicator.color.white(),
      _indicator.wrap.opacity(0),
      $on.selected(_indicator.wrap.opacity(1), _indicator.color.white()),
    );
