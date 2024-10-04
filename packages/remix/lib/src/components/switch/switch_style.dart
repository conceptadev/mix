part of 'switch.dart';

class SwitchStyle extends SpecStyle<SwitchSpecUtility> {
  const SwitchStyle();

  @override
  Style makeStyle(SpecConfiguration<SwitchSpecUtility> spec) {
    final $ = spec.utilities;

    final containerStyle = [
      $.container.chain
        ..height(24)
        ..width(44)
        ..borderRadius(99)
        ..padding.all(2)
        ..alignment.centerLeft()
        ..color.grey.shade300(),
      spec.on.selected(
        $.container.chain
          ..alignment.centerRight()
          ..color.black(),
      ),
      (spec.on.disabled & spec.on.selected)($.container.color.grey.shade500()),
    ];

    final indicatorStyle = [
      $.indicator.chain
        ..color.white()
        ..shape.circle()
        ..width(20)
        ..shadow.color.black12()
        ..shadow.offset(0, 2)
        ..shadow.blurRadius(4)
        ..shadow.spreadRadius(1),
      spec.on.disabled($.indicator.color.grey.shade100()),
    ];

    return Style.create([...containerStyle, ...indicatorStyle]);
  }
}

class SwitchDarkStyle extends SwitchStyle {
  const SwitchDarkStyle();

  @override
  Style makeStyle(SpecConfiguration<SwitchSpecUtility> spec) {
    final $ = spec.utilities;

    return Style.create([
      super.makeStyle(spec).call(),
      $.indicator.color.black(),
      $.container.color.white12(),
      spec.on.selected(
        $.container.color.white(),
      ),
      spec.on.disabled(
        $.indicator.color.black(),
        $.container.color.white38(),
      ),
    ]);
  }
}
