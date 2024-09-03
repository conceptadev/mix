part of 'card.dart';

final _util = CardSpecUtility.self;
final _container = _util.container;
final _flex = _util.flex;

class XCardStyle {
  static Style get base => Style(_containerStyle(), _flexStyle());
}

Style get _containerStyle => Style(
      _container.chain
        ..borderRadius(4)
        ..color.white()
        ..border.all.color.black12()
        ..padding.all(8),
    );

Style get _flexStyle => Style(
      _flex.chain
        ..mainAxisSize.min()
        ..direction.vertical(),
    );
