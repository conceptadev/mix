part of 'slider.dart';

class FortalezaSliderStyle extends SliderStyle {
  const FortalezaSliderStyle();

  @override
  Style makeStyle(SpecConfiguration<SliderSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);
    final divisions = $.division.color.$neutralAlpha(8);

    final thumb = $.thumb.chain
      ..color.$neutral(1)
      ..shape.circle.side.color.$accent(9);

    final track = $.track.chain
      ..color.resetDirectives()
      ..color.$accent(4)
      ..height(6)
      ..borderRadius.all(10);

    final activeTrack = $.activeTrack.chain
      ..color.resetDirectives()
      ..color.$accent(9)
      ..height(6)
      ..borderRadius.all(10);

    final disabled = spec.on.disabled(
      $.activeTrack.color.white.withLightness(0.7),
      $.thumb.shape.circle.side.color.black.withOpacity(0.5),
    );

    final animation = (spec.on.hover | spec.on.dragged)(
      $.thumb.shadow.spreadRadius(8),
      $.thumb.shadow.color.$accentAlpha(4),
    );

    return Style.create([
      baseStyle(),
      divisions,
      thumb,
      track,
      activeTrack,
      disabled,
      animation,
    ]).animate(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }
}
