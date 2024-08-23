// ignore_for_file: camel_case_types

part of 'badge.dart';

final _badge = BadgeSpecUtility.self;
final _container = _badge.container;
final _label = _badge.label;

class XBadgeStyle {
  static Style get container => Style(
        _container.color.black(),
        _container.borderRadius.all(10),
        _container.padding.horizontal(10),
        _container.padding.vertical(2),
      );

  static Style get label => Style(
        _label.textAlign.center(),
        _label.style.fontWeight.w500(),
        _label.style.fontSize(12),
        _label.style.color.white(),
      );

  static Style get base => Style(container(), label());
}
