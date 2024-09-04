// ignore_for_file: camel_case_types

part of 'badge.dart';

final _container = $badge.container;
final _label = $badge.label;

class XBadgeStyle {
  static final Style base = Style(_containerStyle(), _labelStyle());
}

Style get _containerStyle => Style(
      _container.chain
        ..color.black()
        ..borderRadius.all(10)
        ..padding.horizontal(10)
        ..padding.vertical(2),
    );

Style get _labelStyle => Style(
      _label.chain
        ..textHeightBehavior(
          const TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ),
        )
        ..textAlign.center()
        ..style.height(1.5)
        ..style.fontWeight.w500()
        ..style.fontSize(12)
        ..style.color.white(),
    );
