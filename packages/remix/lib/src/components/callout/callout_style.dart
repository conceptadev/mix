// ignore_for_file: camel_case_types

part of 'callout.dart';

final _callout = CalloutSpecUtility.self;
final _container = _callout.container;
final _flex = _callout.flex;
final _icon = _callout.icon;
final _text = _callout.text;

class XCalloutStyle {
  static Style get container => Style(
        _container.borderRadius(6),
        _container.color.white(),
        _container.border.all.color.black12(),
      );

  static Style get flex => Style(
        _flex.wrap.padding.all(12),
        _flex.gap(8),
        _flex.mainAxisSize.min(),
        _flex.direction.horizontal(),
      );

  static Style get icon => Style(_icon.color.black(), _icon.size(16));

  static Style get text => Style(
        _text.style.color.black(),
        _text.style.fontSize(16),
        _text.style.fontWeight.w500(),
      );

  static Style get base => Style(container(), icon(), flex(), text());
}

// Style get _baseStyle {
//   return Style(
//     _flex.gap(16),
//     _container.borderRadius(8),
//     _container.padding(16),
//     // _icon.color.$accentAlpha(11),
//     _icon.size(24),
//     _icon.size(20),
//     // _text.style.color.$accentAlpha(11),
//     _text.wrap.flexible(),
//   );
// }

// Style get _softVariant {
//   return Style(
//       // _container.color.$accentAlpha(3),
//       );
// }

// Style get _surfaceVariant {
//   return Style(
//     // _container.color.$accentAlpha(2),
//     _container.border.width(1),
//     // _container.border.color.$accentAlpha(5),
//   );
// }

// Style get _outlineVariant {
//   return Style(
//     _container.color.transparent(),
//     _container.border.width(1),
//     // _container.border.color.$accentAlpha(8),
//   );
// }

// Style calloutStyle(Style? style, List<ICalloutVariant> variants) {
//   return Style(
//     _baseStyle(),

//     // variants
//     // CalloutVariant.soft(_softVariant()),
//     // CalloutVariant.surface(_surfaceVariant()),
//     // CalloutVariant.outline(_outlineVariant()),
//   ).merge(style).applyVariants(variants);
// }
