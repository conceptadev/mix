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
      spec.on.disabled(
        $.container.border.all.color.black(),
        spec.on.selected($.container.color.black()),
      ),
    ];

    final indicatorStyle = [
      $.indicator.chain
        ..size(16)
        ..color.white()
        ..wrap.opacity(0),
      spec.on.selected($.indicator.wrap.opacity(1), $.indicator.color.white()),
    ];

    return Style.create([
      ...containerStyle,
      ...indicatorStyle,
    ]);
  }
}
