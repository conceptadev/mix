import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../../../mix.dart';

part 'decoration_image_dto.g.dart';

@MixableDto()
class DecorationImageDto extends Dto<DecorationImage>
    with DecorationImageDtoMixable {
  @MixableField(utility: MixableFieldUtility(alias: 'provider'))
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
}
