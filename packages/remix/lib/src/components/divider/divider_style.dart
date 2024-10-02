part of 'divider.dart';

class DividerStyle extends SpecStyle<DividerSpecUtility> {
  static const vertical = Variant('divider.vertical');
  static const horizontal = Variant('divider.horizontal');

  const DividerStyle();

  @override
  Style makeStyle(SpecConfiguration<DividerSpecUtility> spec) {
    final $ = spec.utilities;

    final containerStyle = [
      $.container.chain
        ..color.black12()
        ..borderRadius(99),
      horizontal($.container.height(1)),
      vertical($.container.width(1)),
    ];

    final flexStyle = [
      $.flex.chain
        ..crossAxisAlignment.center
        ..mainAxisAlignment.center
        ..gap(8),
      horizontal($.flex.row()),
      vertical($.flex.column()),
    ];

    final labelStyle = $.label.chain..style.fontSize(14);

    return Style.create([...containerStyle, ...flexStyle, labelStyle]);
  }
}
