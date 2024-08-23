part of 'avatar.dart';

final _avatar = AvatarSpecUtility.self;
final _container = _avatar.container;
final _image = _avatar.image;
final _stack = _avatar.stack;
final _fallback = _avatar.fallback;

class XAvatarStyle {
  static Style get fallback => Style(
        _fallback.textAlign.center(),
        _fallback.style.fontWeight.w400(),
        _fallback.style.fontSize(20),
        _fallback.style.color.black(),
      );

  static Style get container => Style(
        _container.color.black12(),
        _container.alignment.center(),
        _container.size(40),
        _container.wrap.clipOval(),
      );

  static Style get stack => Style(_stack.alignment.center());

  static Style get image => Style(_image.fit.cover());

  static Style get base => Style(fallback(), container(), image());
}
