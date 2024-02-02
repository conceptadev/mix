import 'package:flutter/widgets.dart';

import '../../../core/attribute.dart';
import '../../../factory/mix_provider_data.dart';

class DecorationImageDto extends Dto<DecorationImage>
    with Mergeable<DecorationImageDto> {
  final ImageProvider? image;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final Rect? centerSlice;
  final ImageRepeat? repeat;
  final FilterQuality? filterQuality;
  final bool? invertColors;
  final bool? isAntiAlias;

  const DecorationImageDto({
    this.image,
    this.fit,
    this.alignment,
    this.centerSlice,
    this.repeat,
    this.filterQuality,
    this.invertColors,
    this.isAntiAlias,
  });

  static DecorationImageDto? maybeFrom(DecorationImage? image) {
    if (image == null) return null;
    return DecorationImageDto(
      image: image.image,
      fit: image.fit,
      alignment: image.alignment,
      centerSlice: image.centerSlice,
      repeat: image.repeat,
      filterQuality: image.filterQuality,
      invertColors: image.invertColors,
      isAntiAlias: image.isAntiAlias,
    );
  }

  @override
  DecorationImageDto merge(covariant DecorationImageDto? other) {
    return DecorationImageDto(
      image: other?.image ?? image,
      fit: other?.fit ?? fit,
      alignment: other?.alignment ?? alignment,
      centerSlice: other?.centerSlice ?? centerSlice,
      repeat: other?.repeat ?? repeat,
      filterQuality: other?.filterQuality ?? filterQuality,
      invertColors: other?.invertColors ?? invertColors,
      isAntiAlias: other?.isAntiAlias ?? isAntiAlias,
    );
  }

  @override
  List<Object?> get props => [
        image,
        fit,
        alignment,
        centerSlice,
        repeat,
        filterQuality,
        invertColors,
        isAntiAlias,
      ];

  @override
  DecorationImage resolve(MixData mix) {
    return DecorationImage(
      image: image ?? const AssetImage(''),
      fit: fit,
      alignment: alignment ?? Alignment.center,
      centerSlice: centerSlice,
      repeat: repeat ?? ImageRepeat.noRepeat,
      filterQuality: filterQuality ?? FilterQuality.low,
      invertColors: invertColors ?? false,
      isAntiAlias: isAntiAlias ?? false,
    );
  }
}
