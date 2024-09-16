part of 'avatar.dart';

class AvatarStyle extends SpecStyle<AvatarSpecUtility> {
  const AvatarStyle();

  @override
  Style makeStyle(SpecConfiguration<AvatarSpecUtility> spec) {
    final $ = spec.utilities;

    final fallbackStyle = [
      $.fallback.chain
        ..textAlign.center()
        ..style.fontWeight.w400()
        ..style.fontSize(16)
        ..style.color.black(),
    ];

    final containerStyle = [
      $.container.chain
        ..color.black12()
        ..alignment.center()
        ..size(40)
        ..wrap.clipOval(),
    ];

    final stackStyle = [$.stack.alignment.center()];

    final imageStyle = [$.image.fit.cover()];

    return Style.create([
      ...fallbackStyle,
      ...containerStyle,
      ...stackStyle,
      ...imageStyle,
    ]);
  }
}
