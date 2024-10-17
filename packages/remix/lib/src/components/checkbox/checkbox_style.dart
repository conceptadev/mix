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
        $.container.border.all.color.grey(),
        spec.on.selected($.container.color.grey()),
      ),
    ];

    final indicatorStyle = [
      $.indicator.chain
        ..size(16)
        ..color.white()
        ..wrap.opacity(0),
      spec.on.selected($.indicator.wrap.opacity(1), $.indicator.color.white()),
    ];

    return Style.create([...containerStyle, ...indicatorStyle]);
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
