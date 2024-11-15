part of 'toast.dart';

class FortalezaToastStyle extends ToastStyle {
  const FortalezaToastStyle();

  @override
  Style makeStyle(SpecConfiguration<ToastSpecUtility> spec) {
    final $ = spec.utilities;

    final containerStyle = $.container.chain
      ..borderRadius.all.$radius(2)
      ..color.$neutral(2)
      ..border.all.color.$neutral(6)
      ..padding.all.$space(4)
      ..margin.all.$space(4)
      ..flex.gap.$space(5);

    final titleSubtitleContainerStyle =
        $.titleSubtitleContainer.flex.gap.$space(1);

    final titleStyle = $.title.chain
      ..style.$text(2)
      ..style.color.$neutral(12);

    final subtitleStyle = $.subtitle.chain
      ..style.$text(1)
      ..style.color.$neutral(9);

    return Style.create([
      super.makeStyle(spec).call(),
      containerStyle,
      titleSubtitleContainerStyle,
      titleStyle,
      subtitleStyle,
    ]);
  }
}
