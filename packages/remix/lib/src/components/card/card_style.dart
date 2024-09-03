part of 'card.dart';

final _util = CardSpecUtility.self;
final _container = _util.container;
final _flex = _util.flex;

class XCardStyle {
  static Style get base => Style(_containerStyle(), _flexStyle());
}

Style get _containerStyle => Style(
      _container.borderRadius(4),
      _container.color.white(),
      _container.border.all.color.black12(),
      _container.padding.all(8),
    );

Style get _flexStyle => Style(
      _flex.mainAxisSize.min(),
      _flex.direction.vertical(),
    );
