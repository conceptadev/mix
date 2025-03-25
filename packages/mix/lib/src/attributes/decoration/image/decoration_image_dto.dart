// ignore_for_file: prefer_relative_imports,avoid-importing-entrypoint-exports
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'decoration_image_dto.g.dart';

@MixableProperty()
final class DecorationImageMix extends Mixable<DecorationImage>
    with HasDefaultValue<DecorationImage>, _$DecorationImageMix {
  @MixableField(utilities: [MixableFieldUtility(alias: 'provider')])
  final ImageProvider? image;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final Rect? centerSlice;
  final ImageRepeat? repeat;
  final FilterQuality? filterQuality;
  final bool? invertColors;
  final bool? isAntiAlias;

  const DecorationImageMix({
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
