part of 'card.dart';

final _util = CardSpecUtility.self;
final _container = _util.container;
final _flex = _util.flex;

class XCardStyle {
  static Style get container => Style(
        _container.shadow.color.withOpacity(0.05),
        _container.shadow.color.black(),
        _container.shadow.spreadRadius(1),
        _container.shadow.blurRadius(4),
        _container.shadow.offset(0, 2),
        _container.borderRadius(4),
        _container.color.white(),
        _container.border.all.color.black12(),
      );

  static Style get flex => Style(
        _flex.wrap.padding.all(8),
        _flex.mainAxisSize.min(),
        _flex.direction.vertical(),
      );

  static Style get base => Style(container(), flex());
}
