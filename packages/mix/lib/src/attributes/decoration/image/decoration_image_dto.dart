import 'package:flutter/widgets.dart';

import '../../../core/dto.dart';
import '../../../core/models/mix_data.dart';

@immutable
class DecorationImageDto extends Dto<DecorationImage> {
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
  DecorationImage resolve(MixData mix) {
    const defaultDecoration = DecorationImage(image: AssetImage(''));

    assert(
      image != null,
      'ImageProvider is required for DecorationImage',
    );

    return DecorationImage(
      image: image!,
      fit: fit,
      alignment: alignment ?? defaultDecoration.alignment,
      centerSlice: centerSlice,
      repeat: repeat ?? defaultDecoration.repeat,
      filterQuality: filterQuality ?? defaultDecoration.filterQuality,
      invertColors: invertColors ?? defaultDecoration.invertColors,
      isAntiAlias: isAntiAlias ?? defaultDecoration.isAntiAlias,
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
}

extension DecorationImageExt on DecorationImage {
  DecorationImageDto toDto() {
    return DecorationImageDto(
      image: image,
      fit: fit,
      alignment: alignment,
      centerSlice: centerSlice,
      repeat: repeat,
      filterQuality: filterQuality,
      invertColors: invertColors,
      isAntiAlias: isAntiAlias,
    );
  }
}
