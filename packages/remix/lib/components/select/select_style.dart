part of 'select.dart';

final _util = SelectSpecUtility.self;
final _button = _util.button;
final _menu = _util.menu;
final _item = _util.item;

class XSelectStyle {
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
      );

  static Style menu(double width) => Style(
        _menu.container.borderRadius(6),
        _menu.container.shadow.color(Colors.black.withOpacity(0.07)),
        _menu.container.shadow.blurRadius(5),
        _menu.container.color.white(),
        _menu.container.border.color.black12(),
        _menu.container.padding.all(4),
        _menu.container.width(width),
        _menu.flex.mainAxisSize.min(),
        _menu.flex.crossAxisAlignment.start(),
      );

  static Style get item => Style(
        _item.container.borderRadius(6),
        _item.text.style.color.black(),
        _item.text.style.fontSize(14),
        _item.icon.size(20),
        _item.flex.gap(6),
        _item.container.padding.all(4),
        _item.container.width.infinity(),
        _item.container.color.black.withOpacity(0),
        $on.hover(
          _item.container.color.black.withOpacity(0.08),
        ),
      );
}
