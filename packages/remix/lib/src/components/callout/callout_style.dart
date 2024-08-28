// ignore_for_file: camel_case_types

part of 'callout.dart';

final _container = $callout.container;
final _flex = $callout.flex;
final _icon = $callout.icon;
final _text = $callout.text;

class XCalloutStyle {
  static final Style base = Style(
    _containerStyle(),
    _flexStyle(),
    _iconStyle(),
    _textStyle(),
  );
}

Style get _containerStyle => Style(
      _container.borderRadius(6),
      _container.color.white(),
      _container.border.all.color.black12(),
    );

Style get _flexStyle => Style(
      _flex.wrap.padding(12),
      _flex.gap(8),
      _flex.mainAxisSize.min(),
      _flex.direction.horizontal(),
    );

Style get _iconStyle => Style(_icon.color.black(), _icon.size(16));

Style get _textStyle => Style(
      _text.style.color.black(),
      _text.style.fontSize(14),
      _text.style.fontWeight.w500(),
    );
