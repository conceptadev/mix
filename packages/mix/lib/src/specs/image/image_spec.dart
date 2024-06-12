import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../core/attribute.dart';
import '../../core/models/animated_data.dart';
import '../../core/models/mix_data.dart';
import '../../core/spec.dart';
import '../../exports/dtos.dart';
import '../../exports/utilities.dart';
import '../../factory/mix_provider.dart';

part 'image_spec.g.dart';

@MixableSpec()
class ImageSpec extends Spec<ImageSpec> with ImageSpecMixable {
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
