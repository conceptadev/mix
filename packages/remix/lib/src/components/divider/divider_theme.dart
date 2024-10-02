part of 'divider.dart';

class FortalezaDividerStyle extends DividerStyle {
  const FortalezaDividerStyle();

  @override
  Style makeStyle(SpecConfiguration<DividerSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);
    final containerStyle = [$.container.color.$neutral(5)];
    final labelStyle = $.label.chain
      ..style.color.$neutral(10)
      ..style.fontSize(14)
      ..textHeightBehavior(
        const TextHeightBehavior(
          applyHeightToFirstAscent: false,
          applyHeightToLastDescent: false,
        ),
      );

    return Style.create([baseStyle(), ...containerStyle, labelStyle]);
  }
}
