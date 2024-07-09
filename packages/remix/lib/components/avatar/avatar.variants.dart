import 'package:mix/mix.dart';

abstract interface class IAvatarVariant extends Variant {
  const IAvatarVariant(super.name);
}

class AvatarVariant extends IAvatarVariant {
  const AvatarVariant(super.name);

  static const solid = AvatarVariant('remix.avatar.solid');
  static const soft = AvatarVariant('remix.avatar.soft');

  static List<AvatarVariant> get values => [solid, soft];
}

class AvatarSize extends IAvatarVariant {
  const AvatarSize(super.name);

  static const size1 = AvatarSize('remix.avatar.size1');
  static const size2 = AvatarSize('remix.avatar.size2');
  static const size3 = AvatarSize('remix.avatar.size3');
  static const size4 = AvatarSize('remix.avatar.size4');
  static const size5 = AvatarSize('remix.avatar.size5');
  static const size6 = AvatarSize('remix.avatar.size6');
  static const size7 = AvatarSize('remix.avatar.size7');
  static const size8 = AvatarSize('remix.avatar.size8');

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
  const AvatarRadius(super.name);

  static const none = AvatarRadius('remix.avatar.none');
  static const small = AvatarRadius('remix.avatar.small');
  static const medium = AvatarRadius('remix.avatar.medium');
  static const large = AvatarRadius('remix.avatar.large');
  static const full = AvatarRadius('remix.avatar.full');

  static List<AvatarRadius> get values => [none, small, medium, large, full];
}
