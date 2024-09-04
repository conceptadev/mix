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
      _position.targetAnchor.bottomCenter(),
      _position.followerAnchor.topCenter(),
      _position.offset(0, 4),
    );

Style get _buttonStyle => Style(
      _button.flex.mainAxisAlignment.spaceBetween(),
      _button.container.chain
        ..color.white()
        ..padding.all(10)
        ..border.color.black12()
        ..borderRadius(6),
      _button.icon.chain
        ..size(20)
        ..color.black45(),
      _button.label.chain
        ..style.fontSize(14)
        ..style.color.black(),
    );

Style get _menuStyle => Style(
      _menu.container.chain
        ..borderRadius(6)
        ..shadow.color(Colors.black.withOpacity(0.07))
        ..shadow.blurRadius(5)
        ..color.white()
        ..border.color.black12()
        ..padding.all(4)
        ..wrap.intrinsicWidth()
        ..wrap.transform.scale(0.95)
        ..wrap.opacity(0)
        ..wrap.padding.top(0),
      // Flex
      _menu.flex.chain
        ..mainAxisSize.min()
        ..crossAxisAlignment.start(),
      _menu.wrap.transform.scale(1.5),
      _menu.autoWidth.off(),
      // Selected
      $on.selected(
        _menu.container.chain
          ..wrap.transform.scale(1)
          ..wrap.opacity(1)
          ..wrap.padding.top(4),
      ),
    );

Style get _itemStyle => Style(
      // Container
      _item.container.chain
        ..borderRadius(6)
        ..padding.vertical(8)
        ..padding.horizontal(6)
        ..width.infinity(),
      // Text
      _item.text.chain
        ..style.color.black()
        ..style.fontSize(14),
      _item.icon.size(20),
      _item.flex.gap(6),
      $on.hover(_item.container.color.black12()),
    );
