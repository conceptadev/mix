part of 'slider.dart';

class SliderStyle extends SpecStyle<SliderSpecUtility> {
  const SliderStyle();

  @override
  Style makeStyle(SpecConfiguration<SliderSpecUtility> spec) {
    final $ = spec.utilities;

    return Style.create([
      $.divisionRadius(1.5),
      $.divisionColor.black.brighten(70),
      $.padding.horizontal(24),
      $.thumbColor.white(),
      $.thumbStrokeColor.black(),
      $.thumbStrokeWidth(4),
      $.thumbRadius(7),
      $.trackColor.white.withLightness(0.9),
      $.activeTrackColor.white.withLightness(0.1),
      $.trackHeight(6),
      spec.on.disabled(
        $.thumbStrokeColor.black.withValue(0.6),
        $.activeTrackColor.white.withLightness(0.7),
      ),
      spec.on.dragged($.thumbRadius(12)),
      spec.on.hover($.thumbRadius(12)),
    ]).animate(duration: const Duration(milliseconds: 200));
  }
}
