import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../../mix.dart';

part 'image_spec.g.dart';

@MixableSpec()
final class ImageSpec extends Spec<ImageSpec> with ImageSpecMixable {
  final double? width, height;
  final Color? color;
  final ImageRepeat? repeat;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final Rect? centerSlice;
  final FilterQuality? filterQuality;
  final BlendMode? colorBlendMode;

  static const of = ImageSpecMixable.of;

  static const from = ImageSpecMixable.from;

  const ImageSpec({
    this.width,
    this.height,
    this.color,
    this.repeat,
    this.fit,
    this.alignment,
    this.centerSlice,
    this.filterQuality,
    this.colorBlendMode,
    super.animated,
  });
}
