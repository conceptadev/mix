import 'package:flutter/widgets.dart';

import '../../../../mix.dart';

class DecorationImageDto extends Dto<DecorationImage>
    with Mergeable<DecorationImageDto> {
  final ImageProvider? image;
  final BoxFit? fit;

  const DecorationImageDto({
    required this.image,
    this.fit,
  });

  static DecorationImageDto? maybeFrom(DecorationImage? image) {
    if (image == null) return null;
    return DecorationImageDto(
      image: image.image,
      fit: image.fit,
    );
  }

  @override
  DecorationImageDto merge(covariant DecorationImageDto? other) {
    return DecorationImageDto(
      image: other?.image ?? image,
      fit: other?.fit ?? fit,
    );
  }

  @override
  List<Object?> get props => [
        image,
        fit,
      ];

  @override
  DecorationImage resolve(MixData mix) {
    return DecorationImage(
      image: image ?? const AssetImage(''),
      fit: fit,
    );
  }
}
