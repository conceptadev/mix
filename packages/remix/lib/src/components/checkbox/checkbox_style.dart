// ignore_for_file: camel_case_types

part of 'checkbox.dart';

final _util = CheckboxSpecUtility.self;
final _container = _util.container;
final _indicator = _util.indicator;

class XCheckboxStyle {
  static Style get base => Style(_containerStyle(), _indicatorStyle());
}

Style get _containerStyle => Style(
      _container.chain
        ..borderRadius(4)
        ..border.all.color.black(),
      $on.selected(_container.color.black()),
      $on.disabled(
        _container.border.all.color.black(),
        $on.selected(_container.color.black()),
      ),
    );

Style get _indicatorStyle => Style(
      _indicator.chain
        ..size(16)
        ..color.white()
        ..wrap.opacity(0),
      $on.selected(_indicator.wrap.opacity(1), _indicator.color.white()),
    );
