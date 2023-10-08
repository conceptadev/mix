import '../base/duration.attribute.dart';

class AnimationDurationAttribute extends DurationAttribute {
  const AnimationDurationAttribute(Duration duration) : super(duration);

  @override
  AnimationDurationAttribute merge(DurationAttribute? other) =>
      AnimationDurationAttribute(other?.duration ?? duration);
}
