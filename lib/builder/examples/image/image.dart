import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../spec_definition.dart';

@SpecDefinition(name: 'ImageTest')
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
