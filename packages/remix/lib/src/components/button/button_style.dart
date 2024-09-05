part of 'button.dart';

final _label = $button.label;
final _spinner = $button.spinner;
final _container = $button.container;
final _flex = $button.flex;
final _icon = $button.icon;

class XButtonStyle {
  static final base = Style(
    _flexStyle(),
    _iconStyle(),
    _labelStyle(),
    _containerStyle(),
    _spinnerStyle(),
  );
}

final _flexStyle = Style(
  _flex.chain
    ..mainAxisAlignment.center()
    ..crossAxisAlignment.center()
    ..mainAxisSize.min()
    ..gap(8),
);

final _iconStyle = Style(_icon.size(24), _icon.color.white());

final _labelStyle = Style(
  _label.chain
    ..textHeightBehavior(
      const TextHeightBehavior(
        applyHeightToFirstAscent: false,
        applyHeightToLastDescent: true,
      ),
    )
    ..style.fontSize(14)
    ..style.height(1.5)
    ..style.color.white()
    ..style.fontWeight.w500(),
);

final _spinnerStyle = Style(
  _spinner.strokeWidth(0.9),
  _spinner.size(15),
  _spinner.color.white(),
);

final _containerStyle = Style(
  _container.chain
    ..borderRadius(6)
    ..color.black()
    ..padding.vertical(8)
    ..padding.horizontal(12),
  $on.disabled(_container.color.grey.shade400()),
);
