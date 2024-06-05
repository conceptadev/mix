import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../helpers/annotations.dart';

@MixSpec(name: 'ImageTest')
class ImageDef {
  const ImageDef({
    double? width,
    double? height,
    Color? color,
    ImageRepeat? repeat,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    Rect? centerSlice,
    FilterQuality? filterQuality,
    BlendMode? colorBlendMode,
  });
}
