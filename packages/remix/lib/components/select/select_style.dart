part of 'select.dart';

final _util = SelectSpecUtility.self;
final _button = _util.button;
final _menu = _util.menu;
final _item = _util.item;
final _position = _util.position;

class XSelectStyle {
  static Style get position => Style(
        _position.targetAnchor.bottomLeft(),
        _position.followerAnchor.topLeft(),
        _position.offset(0, 4),
      );

  static Style get button => Style(
        _button.container.color.white(),
        _button.container.padding.all(10),
        _button.container.border.color.black12(),
        _button.container.borderRadius(6),
        _button.icon.size(20),
        _button.icon.color.black45(),
        _button.flex.mainAxisAlignment.spaceBetween(),
        _button.label.style.fontSize(14),
        _button.label.style.color.black(),
        position(),
      );

  static Style get menu => Style(
        _menu.container.borderRadius(6),
        _menu.container.shadow.color(Colors.black.withOpacity(0.07)),
        _menu.container.shadow.blurRadius(5),
        _menu.container.color.white(),
        _menu.container.border.color.black12(),
        _menu.container.padding.all(4),

        _menu.flex.mainAxisSize.min(),
        _menu.flex.crossAxisAlignment.start(),
        _menu.wrap.transform.scale(1.5),
        // animation
        _menu.container.wrap.transform.scale(0.95),
        _menu.container.wrap.opacity(0),
        _menu.container.wrap.padding.top(0),
        $on.selected(
          _menu.container.wrap.transform.scale(1),
          _menu.container.wrap.opacity(1),
          _menu.container.wrap.padding.top(4),
        ),
      );

  static Style get item => Style(
        _item.container.borderRadius(6),
        _item.text.style.color.black(),
        _item.text.style.fontSize(14),
        _item.icon.size(20),
        _item.flex.gap(6),
        _item.container.padding.vertical(8),
        _item.container.padding.horizontal(6),
        _item.container.width.infinity(),
        _item.container.color.black.withOpacity(0),
        $on.hover(
          _item.container.color.black.withOpacity(0.08),
        ),
      );

  static Style get base => Style(
        item(),
        button(),
        menu(),
        position(),
      );
}
