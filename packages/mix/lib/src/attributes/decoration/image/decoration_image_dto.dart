// ignore_for_file: prefer_relative_imports,avoid-importing-entrypoint-exports
import 'package:flutter/widgets.dart';
import 'package:mix/annotations.dart';

import '../../../../mix.dart';

part 'decoration_image_dto.g.dart';

@MixableDto()
final class DecorationImageDto extends Dto<DecorationImage>
    with _$DecorationImageDto {
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
  @override
  DecorationImage get defaultValue =>
      const DecorationImage(image: AssetImage('NONE'));
}
