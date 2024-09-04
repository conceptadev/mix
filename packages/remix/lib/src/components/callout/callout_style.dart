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
      _container.chain
        ..borderRadius(6)
        ..color.white()
        ..border.all.color.black12(),
    );

Style get _flexStyle => Style(
      _flex.chain
        ..wrap.padding(12)
        ..gap(8)
        ..mainAxisSize.min()
        ..direction.horizontal(),
    );

Style get _iconStyle => Style(_icon.color.black(), _icon.size(16));

Style get _textStyle => Style(
      _text.chain
        ..style.color.black()
        ..style.fontSize(14)
        ..style.fontWeight.w500(),
    );
