// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/avatar/avatar_spec.dart';
import 'package:remix/components/avatar/avatar_variants.dart';
import 'package:remix/helpers/utility_extension.dart';
import 'package:remix/tokens/remix_tokens.dart';

final _avatar = AvatarSpecUtility.self;
final _container = _avatar.container;
final _image = _avatar.image;
final _fallback = _avatar.fallback;
Style get _baseStyle => Style(
      _container.borderRadius(99),
      _image.fit.cover(),
      _container.alignment.center(),
      _fallback.textAlign.center(),
      _fallback.style.fontWeight(FontWeight.bold),
      _fallback.style.color($rx.color.neutral(1)()),
    );

Style get _solidVariant => Style(
      _container.color($rx.color.accent()()),
    );

Style get _softVariant => Style(
      _container.color.ref($rx.color.accent(4)),
    );

Style get _size1 => Style(
      _container.size(16),
      _fallback.style.fontSize(10),
    );

Style get _size2 => Style(
      _container.size(20),
      _fallback.style.fontSize(12),
    );

Style get _size3 => Style(
      _container.size(24),
      _fallback.style.fontSize(14),
    );

Style get _size4 => Style(
      _container.size(32),
      _fallback.style.fontSize(16),
    );

Style get _size5 => Style(
      _container.size(40),
      _fallback.style.fontSize(20),
    );

Style get _size6 => Style(
      _container.size(48),
      _fallback.style.fontSize(24),
    );

Style get _size7 => Style(
      _container.size(56),
      _fallback.style.fontSize(28),
    );

Style get _size8 => Style(
      _container.size(64),
      _fallback.style.fontSize(32),
    );

Style get _radiusNone =>
    Style($with.clipRRect(borderRadius: BorderRadius.zero));
Style get _radiusSmall =>
    Style($with.clipRRect(borderRadius: BorderRadius.circular(4)));
Style get _radiusMedium =>
    Style($with.clipRRect(borderRadius: BorderRadius.circular(8)));
Style get _radiusLarge =>
    Style($with.clipRRect(borderRadius: BorderRadius.circular(12)));
Style get _radiusFull => Style($with.clipOval());

Style avatarStyle(Style? style, List<IAvatarVariant> variants) {
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
  ).merge(style).applyVariants(variants);
}
