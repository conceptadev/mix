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

  // const XButtonStyle();
  // static final dark = XButtonStyle._(light._style.merge(_darkStyle));

  // Style call([Style? styleOverride, List<Variant>? variants]) {
  //   return _style.merge(styleOverride).applyVariants(variants ?? []);
  // }
}

final _flexStyle = Style(
  _flex.mainAxisAlignment.center(),
  _flex.crossAxisAlignment.center(),
  _flex.mainAxisSize.min(),
  _flex.gap(8),
);

final _iconStyle = Style(_icon.size(24), _icon.color.white());

final _labelStyle = Style(
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
);

final _spinnerStyle = Style(
  _spinner.strokeWidth(0.9),
  _spinner.size(15),
  _spinner.color.white(),
);

final _containerStyle = Style(
  _container.borderRadius(6),
  _container.color.black(),
  $on.hover(_container.color.brighten(20)),
  $on.press(_container.color.brighten(10)),
  $on.disabled(_container.color.grey.shade400()),
);

final _darkStyle = Style(
  _icon.color.black(),
  _label.style.color.black(),
  _container.color.white(),
  _spinner.color.black(),
  _container.color.white(),
  $on.hover(_container.color.darken(10)),
  $on.press(_container.color.darken(10)),
  $on.disabled(_container.color.grey.shade600()),
);
