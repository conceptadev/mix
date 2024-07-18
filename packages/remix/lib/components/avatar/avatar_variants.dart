import 'package:remix/helpers/variant.dart';

abstract interface class IAvatarVariant extends RemixVariant {
  const IAvatarVariant(String name) : super('avatar.$name');
}

class AvatarVariant extends IAvatarVariant {
  const AvatarVariant(String name) : super('variant.$name');

  static const solid = AvatarVariant('solid');
  static const soft = AvatarVariant('soft');

  static List<AvatarVariant> get values => [solid, soft];
}

class AvatarSize extends IAvatarVariant {
  const AvatarSize(String name) : super('size.$name');

  static const size1 = AvatarSize('size1');
  static const size2 = AvatarSize('size2');
  static const size3 = AvatarSize('size3');
  static const size4 = AvatarSize('size4');
  static const size5 = AvatarSize('size5');
  static const size6 = AvatarSize('size6');
  static const size7 = AvatarSize('size7');
  static const size8 = AvatarSize('size8');

  static List<AvatarSize> get values => [
        size1,
        size2,
        size3,
        size4,
        size5,
        size6,
        size7,
        size8,
      ];
}

class AvatarRadius extends IAvatarVariant {
  const AvatarRadius(String name) : super('radius.$name');

  static const none = AvatarRadius('none');
  static const small = AvatarRadius('small');
  static const medium = AvatarRadius('medium');
  static const large = AvatarRadius('large');
  static const full = AvatarRadius('full');

  static List<AvatarRadius> get values => [none, small, medium, large, full];
}
