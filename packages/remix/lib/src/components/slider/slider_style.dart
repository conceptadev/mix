part of 'slider.dart';

class SliderStyle extends SpecStyle<SliderSpecUtility> {
  const SliderStyle();

  @override
  Style makeStyle(SpecConfiguration<SliderSpecUtility> spec) {
    final $ = spec.utilities;

    return Style.create([
      // $.divisionRadius(1.5),
      // $.divisionColor.black.brighten(70),
      $.division.shape.circle(),
      $.division.color.black26(),
      $.division.height(3),
      $.division.width(3),

      $.padding.horizontal(24),
      $.thumb.color.white.withOpacity(1),
      $.thumb.shape.circle(),
      $.track.color.white.withLightness(0.9),
      $.activeTrack.color.white.withLightness(0.1),
      $.thumb.chain
        ..shape.circle.side.width(2)
        ..shape.circle.side.color.black()
        ..shape.circle.side.style.solid()
        ..shape.circle.side.strokeAlign(BorderSide.strokeAlignInside)
        ..height(20)
        ..width(20),
      $.track.height(6),
      $.track.borderRadius.all(10),
      $.activeTrack.height(6),
      $.activeTrack.borderRadius.all(10),
      spec.on.disabled($.activeTrack.color.white.withLightness(0.7)),
      (spec.on.hover | spec.on.dragged)(
        $.thumb.chain
          ..shadow.blurRadius(0)
          ..shadow.color.black.withOpacity(0.05)
          ..shadow.offset(0, 0)
          ..shadow.spreadRadius(8),
      ),
    ]).animate(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
    );
  }
}
