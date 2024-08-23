part of 'button.dart';

final _util = ButtonSpecUtility.self;
final _label = _util.label;
final _spinner = _util.spinner;
final _container = _util.container;
final _flex = _util.flex;
final _icon = _util.icon;

class XButtonStyle {
  static Style get flex => Style(
        _flex.mainAxisAlignment.center(),
        _flex.crossAxisAlignment.center(),
        _flex.mainAxisSize.min(),
        _flex.gap(8),
        _flex.wrap.padding.vertical(8),
        _flex.wrap.padding.horizontal(16),
      );

  static Style get icon => Style(
        _icon.size(24),
        _icon.color.white(),
        $on.dark(_icon.color.black()),
      );

  static Style get label => Style(
        _label.textHeightBehavior(
          const TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: true,
          ),
        ),
        _label.style.fontSize(14),
        _label.style.height(1.5),
        _label.style.color.white(),
        _label.style.fontWeight.w400(),
        $on.dark(_label.style.color.black()),
      );

  static Style get spinner => Style(
        _spinner.strokeWidth(0.9),
        _spinner.size(15),
        _spinner.color.white(),
        $on.dark(_spinner.color.black()),
      );

  static Style get container => Style(
        _container.borderRadius(6),
        _container.color.black(),
        $on.hover(_container.color.brighten(20)),
        $on.press(_container.color.brighten(10)),
        $on.disabled(_container.color.grey.shade400()),
        $on.dark(
          _container.color.white(),
          $on.hover(_container.color.darken(10)),
          $on.press(_container.color.darken(10)),
          $on.disabled(_container.color.grey.shade600()),
        ),
      );

  static Style get base => Style(
        flex(),
        container(),
        spinner(),
        label(),
        icon(),
      );
}
