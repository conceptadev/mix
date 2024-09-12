part of 'avatar.dart';

class AvatarThemeVariant extends Variant {
  static const solid = AvatarThemeVariant('solid');
  static const soft = AvatarThemeVariant('soft');

  static const values = [solid, soft];

  const AvatarThemeVariant(String value) : super('avatar.$value');
}

class FortalezaAvatarStyle extends AvatarStyle {
  static const solid = AvatarThemeVariant.solid;
  static const soft = AvatarThemeVariant.soft;

  const FortalezaAvatarStyle();

  static List<AvatarThemeVariant> get variants => AvatarThemeVariant.values;

  @override
  Style makeStyle(SpecConfiguration<AvatarSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);

    final solidVariant = Style(
      $.container.color.$accent(),
      $.fallback.style.color.$neutral(1),
    );

    final softVariant = Style(
      $.container.color.$accent(4),
      $.fallback.style.color.$accent(),
      spec.on.dark(
        $.container.color.$accent(12),
        $.fallback.style.color.$accent(7),
      ),
    );

    return Style.create(
      [baseStyle(), solid(solidVariant()), soft(softVariant())],
    );
  }
}
