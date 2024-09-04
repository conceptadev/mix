part of 'avatar.dart';

final _avatar = AvatarSpecUtility.self;
final _container = _avatar.container;
final _image = _avatar.image;
final _stack = _avatar.stack;
final _fallback = _avatar.fallback;

class XAvatarStyle {
  static final base = Style(
    _fallbackStyle(),
    _containerStyle(),
    _stackStyle(),
    _imageStyle(),
  );
}

Style get _fallbackStyle => Style(
      _fallback.chain
        ..textAlign.center()
        ..style.fontWeight.w400()
        ..style.fontSize(16)
        ..style.color.black(),
    );

Style get _containerStyle => Style(
      _container.chain
        ..color.black12()
        ..alignment.center()
        ..size(40)
        ..wrap.clipOval(),
    );

Style get _stackStyle => Style(_stack.alignment.center());

Style get _imageStyle => Style(_image.fit.cover());
