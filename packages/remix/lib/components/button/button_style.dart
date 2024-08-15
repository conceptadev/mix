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
      );

  static Style get icon => Style(
        _icon.size(24),
        _icon.color.white(),
        $on.dark(
          _icon.color.black(),
        ),
      );

  static Style get label => Style(
        _label.textHeightBehavior(
          const TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: true,
          ),
        ),
        _label.style.fontWeight.w500(),
        _label.style.$text(2),
        _label.style.color.white(),
        _label.style.fontSize(18),
        _label.style.fontWeight.w400(),
        $on.dark(
          _label.style.color.black(),
        ),
      );

  static Style get spinner => Style(
      _spinner.strokeWidth(1.5),
      _spinner.color.white(),
      $on.dark(
        _spinner.color.black(),
      ));

  static Style get container => Style(
        _container.borderRadius(16),
        _container.color.black(),
        _container.padding.vertical(16),
        _container.padding.horizontal(24),
        $on.hover(
          _container.color.black87(),
        ),
        $on.press(
          _container.color.black54(),
        ),
        $on.disabled(
          _container.color.grey.shade300(),
        ),
        $on.dark(
          _container.color.white(),
          $on.hover(
            _container.color.white70(),
          ),
          $on.press(
            _container.color.white54(),
          ),
          $on.disabled(
            _container.color.grey.shade600(),
          ),
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
