part of 'select.dart';

final _button = $select.button;
final _menu = $select.menu;
final _item = $select.item;
final _position = $select.position;

class XSelectStyle {
  static Style get base => Style(
        _itemStyle(),
        _buttonStyle(),
        _menuStyle(),
        _positionStyle(),
      );
}

Style get _positionStyle => Style(
      _position.targetAnchor.bottomLeft(),
      _position.followerAnchor.topLeft(),
      _position.offset(0, 4),
    );

Style get _buttonStyle => Style(
      _button.container.color.white(),
      _button.container.padding.all(10),
      _button.container.border.color.black12(),
      _button.container.borderRadius(6),
      _button.icon.size(20),
      _button.icon.color.black45(),
      _button.flex.mainAxisAlignment.spaceBetween(),
      _button.label.style.fontSize(14),
      _button.label.style.color.black(),
    );

Style get _menuStyle => Style(
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

Style get _itemStyle => Style(
      _item.container.borderRadius(6),
      _item.text.style.color.black(),
      _item.text.style.fontSize(14),
      _item.icon.size(20),
      _item.flex.gap(6),
      _item.container.padding.vertical(8),
      _item.container.padding.horizontal(6),
      _item.container.width.infinity(),
      $on.hover(_item.container.color.black()),
    );
