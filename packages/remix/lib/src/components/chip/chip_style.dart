part of 'chip.dart';

class ChipStyle extends SpecStyle<ChipSpecUtility> {
  const ChipStyle();

  @override
  Style makeStyle(SpecConfiguration<ChipSpecUtility> spec) {
    final $ = spec.utilities;

    final flexStyle = [
      $.flex.chain
        ..mainAxisAlignment.center()
        ..crossAxisAlignment.center()
        ..mainAxisSize.min()
        ..gap(8),
    ];

    final iconStyle = [
      $.icon.chain
        ..size(20)
        ..color.black(),
    ];

    final labelStyle = [
      $.label.chain
        ..textHeightBehavior(
          const TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: true,
          ),
        )
        ..style.fontSize(14)
        ..style.height(1.5)
        ..style.color.black()
        ..style.fontWeight.w600(),
    ];

    final containerStyle = [
      $.container.chain
        ..borderRadius(6)
        ..color.white()
        ..border.all.width(1)
        ..border.color.grey.shade300()
        ..padding.vertical(8)
        ..padding.horizontal(12),
      spec.on.disabled($.container.color.grey.shade400()),
      spec.on.selected($.container.color.grey.shade100()),
    ];

    return Style.create([
      ...flexStyle,
      ...iconStyle,
      ...labelStyle,
      ...containerStyle,
    ]);
  }
}
