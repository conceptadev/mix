// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/avatar/avatar.variants.dart';
import 'package:remix/components/avatar/avatar_spec.dart';
import 'package:remix/helpers/utility_extension.dart';
import 'package:remix/tokens/remix_tokens.dart';

final _avatar = AvatarSpecUtility.self;
final _container = _avatar.container;
final _image = _avatar.image;
final _fallback = _avatar.fallback;
final _baseStyle = Style(
  _container.borderRadius(99),
  _image.fit.cover(),
  _fallback.textAlign.center(),
  _fallback.style.fontWeight(FontWeight.bold),
  _fallback.style.color($rx.neutral1()),
);

final _solidVariant = Style(
  _container.color($rx.accent9()),
);

final _softVariant = Style(
  _container.color($rx.accent4()),
);

final _size1 = Style(
  _container.size(16),
  _fallback.style.fontSize(10),
);

final _size2 = Style(
  _container.size(20),
  _fallback.style.fontSize(12),
);

final _size3 = Style(
  _container.size(24),
  _fallback.style.fontSize(14),
);

final _size4 = Style(
  _container.size(32),
  _fallback.style.fontSize(16),
);

final _size5 = Style(
  _container.size(40),
  _fallback.style.fontSize(20),
);

final _size6 = Style(
  _container.size(48),
  _fallback.style.fontSize(24),
);

final _size7 = Style(
  _container.size(56),
  _fallback.style.fontSize(28),
);

final _size8 = Style(
  _container.size(64),
  _fallback.style.fontSize(32),
);

final _radiusNone = Style(_container.borderRadius(0));
final _radiusSmall = Style(_container.borderRadius(4));
final _radiusMedium = Style(_container.borderRadius(6));
final _radiusLarge = Style(_container.borderRadius(8));
final _radiusFull = Style(_container.borderRadius(99));

Style buildDefaultAvatarStyle() {
  return Style(
    _baseStyle(),
    AvatarVariant.solid(_solidVariant()),
    AvatarVariant.soft(_softVariant()),

    // Sizes
    AvatarSize.size1(_size1()),
    AvatarSize.size2(_size2()),
    AvatarSize.size3(_size3()),
    AvatarSize.size4(_size4()),
    AvatarSize.size5(_size5()),
    AvatarSize.size6(_size6()),
    AvatarSize.size7(_size7()),
    AvatarSize.size8(_size8()),

    // Radius
    AvatarRadius.none(_radiusNone()),
    AvatarRadius.small(_radiusSmall()),
    AvatarRadius.medium(_radiusMedium()),
    AvatarRadius.large(_radiusLarge()),
    AvatarRadius.full(_radiusFull()),
  );
}
