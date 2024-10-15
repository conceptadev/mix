part of 'menu_item.dart';

class MenuItemStyle extends SpecStyle<MenuItemSpecUtility> {
  const MenuItemStyle();

  @override
  Style makeStyle(SpecConfiguration<MenuItemSpecUtility> spec) {
    final $ = spec.utilities;

    final textFlex = $.textFlex.chain
      ..mainAxisAlignment.start()
      ..crossAxisAlignment.start()
      ..mainAxisSize.min()
      ..wrap.expanded()
      ..gap(4.0);
    final mainFlex = $.mainFlex.chain..gap(12.0);
    final title = $.title.style.fontSize(14.0);
    final subtitle = $.subtitle.chain
      ..style.fontSize(12.0)
      ..style.color.black.withValue(0.5)
      ..maxLines(2);

    final container = $.container.chain
      ..padding(12)
      ..borderRadius(12);

    final icon = $.icon.chain
      ..size(20)
      ..color.black87();

    return Style.create([textFlex, mainFlex, title, subtitle, container, icon]);
  }
}
