part of 'slider.dart';

class SliderStyle extends SpecStyle<SliderSpecUtility> {
  const SliderStyle();

  @override
  Style makeStyle(SpecConfiguration<SliderSpecUtility> spec) {
    final $ = spec.utilities;

    final divisions = $.division.chain
      ..shape.circle()
      ..color.black26()
      ..height(3)
      ..width(3);

    final thumb = $.thumb.chain
      ..shape.circle()
      ..color.white.withOpacity(1)
      ..height(20)
      ..width(20)
      ..shape.circle.side.width(2)
      ..shape.circle.side.color.black()
      ..shape.circle.side.style.solid()
      ..shape.circle.side.strokeAlign(BorderSide.strokeAlignInside);

    final track = $.track.chain
      ..color.white.withLightness(0.9)
      ..height(6)
      ..borderRadius.all(10);

    final activeTrack = $.activeTrack.chain
      ..color.white.withLightness(0.1)
      ..height(6)
      ..borderRadius.all(10);

    final disabled = spec.on.disabled(
      $.activeTrack.color.white.withLightness(0.7),
      $.thumb.shape.circle.side.color.black.withOpacity(0.5),
    );

    return Style.create([divisions, thumb, track, activeTrack, disabled])
        .animate(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
    );
  }
}
