part of 'checkbox.dart';

final _c = CheckboxSpecUtility.self;
Style get _checkboxStyle => Style(
      _base(),
      _indicatorContainer(),
      _indicator(),
      _label(),
    );

Style get _base => Style(
      _c.container.chain
        ..flex.mainAxisSize.min()
        ..flex.gap(8),
    );

Style get _indicatorContainer => Style(
      _c.indicatorContainer.chain
        ..padding(1)
        ..color.black()
        ..borderRadius(4)
        ..border.color.black()
        ..border.width(1)
        ..color.white(),
      $on.selected(
        _c.indicatorContainer.color.black(),
      ),
    );

Style get _indicator => Style(
      _c.indicator.chain
        ..color.white()
        ..size(15),
    );

Style get _label => Style(
      _c.label.chain
        ..color.black()
        ..fontSize(14)
        ..fontWeight.w500,
    );
