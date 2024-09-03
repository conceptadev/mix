part of 'avatar.dart';

class AvatarThemeVariant extends Variant {
  static const solid = AvatarThemeVariant('solid');
  static const soft = AvatarThemeVariant('soft');

  static const values = [solid, soft];

  const AvatarThemeVariant(String value) : super('avatar.$value');
}

class XAvatarThemeStyle extends XAvatarStyle {
  static Style get value => Style(
        XAvatarStyle.base(),
        AvatarThemeVariant.solid(_solidVariant()),
        AvatarThemeVariant.soft(_softVariant()),
      );
}

Style get _solidVariant =>
    Style(_container.color.$accent(), _fallback.style.color.$neutral(1));

Style get _softVariant => Style(
      _container.color.$accent(4),
      _fallback.style.color.$accent(),
      $on.dark(
        _container.color.$accent(12),
        _fallback.style.color.$accent(7),
      ),
    );
