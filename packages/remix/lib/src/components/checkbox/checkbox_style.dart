part of 'checkbox.dart';

class CheckboxStyle extends SpecStyle<CheckboxSpecUtility> {
  const CheckboxStyle();

  @override
  Style makeStyle(SpecConfiguration<CheckboxSpecUtility> spec) {
    final $ = spec.utilities;

    final containerStyle = [
      $.container.chain
        ..borderRadius(4)
        ..border.all.color.black(),
      spec.on.selected($.container.color.black()),
    ];

    final indicatorStyle = [
      $.indicator.chain
        ..size(16)
        ..color.white()
        ..wrap.opacity(0),
      spec.on.selected($.indicator.wrap.opacity(1), $.indicator.color.white()),
    ];

    final labelStyle = $.label.chain
      ..style.color.black()
      ..style.fontSize(14)
      ..style.fontWeight.w500()
      ..textHeightBehavior.heightToFirstAscent.off();

    final containerLayoutStyle = $.containerLayout.chain
      ..crossAxisAlignment.center()
      ..mainAxisAlignment.start()
      ..mainAxisSize.min()
      ..gap(8);

    final disabledStyle = spec.on.disabled(
      $.container.border.all.color.grey(),
      $.label.style.color.grey(),
      spec.on.selected($.container.color.grey()),
    );

    return Style.create([
      ...containerStyle,
      ...indicatorStyle,
      labelStyle,
      containerLayoutStyle,
      disabledStyle,
    ]);
  }
}

class CheckboxDarkStyle extends CheckboxStyle {
  const CheckboxDarkStyle();

  @override
  Style makeStyle(SpecConfiguration<CheckboxSpecUtility> spec) {
    final $ = spec.utilities;

    return Style.create([
      super.makeStyle(spec).call(),
      $.container.border.all.color.white(),
      $.indicator.color.black(),
      spec.on.selected($.container.color.white()),
      spec.on.selected($.indicator.color.black()),
    ]);
  }
}
