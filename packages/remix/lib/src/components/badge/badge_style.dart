// ignore_for_file: camel_case_types

part of 'badge.dart';

final _container = $badge.container;
final _label = $badge.label;

class XBadgeStyle {
  static final Style base = Style(_containerStyle(), _labelStyle());
}

Style get _containerStyle => Style(
      _container.color.black(),
      _container.borderRadius.all(10),
      _container.padding.horizontal(10),
      _container.padding.vertical(2),
    );

Style get _labelStyle => Style(
      _label.textAlign.center(),
      _label.style.fontWeight.w400(),
      _label.style.fontSize(12),
      _label.style.color.white(),
    );
