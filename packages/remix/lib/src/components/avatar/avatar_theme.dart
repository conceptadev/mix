part of 'avatar.dart';

class FortalezaAvatarStyle extends AvatarStyle {
  static const solid = Variant('avatar.solid');
  static const soft = Variant('avatar.soft');

  const FortalezaAvatarStyle();

  static List<Variant> get variants => [solid, soft];

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
    );

    return Style.create(
      [baseStyle(), solid(solidVariant()), soft(softVariant())],
    );
  }
}

class FortalezaDarkAvatarStyle extends FortalezaAvatarStyle {
  const FortalezaDarkAvatarStyle();

  @override
  Style makeStyle(SpecConfiguration<AvatarSpecUtility> spec) {
    final $ = spec.utilities;
    final baseStyle = super.makeStyle(spec);

    final solid = Style($.fallback.style.color.$neutral(12));
    final soft = Style(
      $.container.color.$accent(3),
      $.fallback.style.color.$accent(11),
    );

    return Style.create([
      baseStyle(),
      FortalezaAvatarStyle.solid(solid()),
      FortalezaAvatarStyle.soft(soft()),
    ]);
  }
}
