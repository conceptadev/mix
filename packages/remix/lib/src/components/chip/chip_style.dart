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
        ..textHeightBehavior.heightToFirstAscent.off()
        ..textHeightBehavior.heightToLastDescent.on()
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
        ..border.color.grey.shade200()
        ..padding.vertical(8)
        ..padding.horizontal(12),
      spec.on.selected($.container.color.grey.shade200()),
      spec.on.disabled(
        $.label.style.color.grey.shade800(),
        spec.on.selected($.container.color.grey.shade300()),
      ),
    ];

    return Style.create([
      ...flexStyle,
      ...iconStyle,
      ...labelStyle,
      ...containerStyle,
    ]);
  }
}

class ChipDarkStyle extends ChipStyle {
  const ChipDarkStyle();

  @override
  Style makeStyle(SpecConfiguration<ChipSpecUtility> spec) {
    final $ = spec.utilities;

    final containerStyle = [
      $.container.chain
        ..border.all.color.grey.shade900()
        ..color.black(),
      spec.on.selected($.container.color.grey.shade900()),
      spec.on.disabled(
        $.label.style.color.grey.shade600(),
        $.container.color.black(),
        spec.on.selected($.container.color.grey.shade900()),
      ),
    ];

    final labelStyle = $.label.chain..style.color.white();

    return Style.create([
      super.makeStyle(spec).call(),
      ...containerStyle,
      labelStyle,
    ]);
  }
}
