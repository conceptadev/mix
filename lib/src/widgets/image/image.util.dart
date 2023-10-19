// ignore_for_file: long-parameter-list

import '../../attributes/base/color.dto.dart';
import '../../attributes/enum/box_fit.attribute.dart';
import '../../attributes/size/height.attribute.dart';
import '../../attributes/size/width.attribute.dart';
import '../../image/image_provider.attribute.dart';
import '../../image/image_repeat.attribute.dart';
import '../image/image.attribute.dart';

ImageAttributes image({
  ImageProviderAttribute? imageProvider,
  WidthAttribute? width,
  HeightAttribute? height,
  ColorDto? color,
  ImageRepeatAttribute? repeat,
  BoxFitAttribute? fit,
}) {
  return ImageAttributes(
    image: imageProvider,
    width: width,
    height: height,
    color: color,
    repeat: repeat,
    fit: fit,
  );
}

ImageAttributes imageProvider(ImageProviderAttribute imageProvider) {
  return ImageAttributes(image: imageProvider);
}

@Deprecated('Use image(width: width)')
ImageAttributes imageWidth(WidthAttribute width) {
  return ImageAttributes(width: width);
}

ImageAttributes imageHeight(HeightAttribute height) {
  return ImageAttributes(height: height);
}

@Deprecated('Use image(color: color)')
ImageAttributes imageColor(ColorDto color) {
  return ImageAttributes(color: color);
}

@Deprecated('Use image(repeat: repeat)')
ImageAttributes imageRepeat(ImageRepeatAttribute repeat) {
  return ImageAttributes(repeat: repeat);
}

@Deprecated('Use image(fit: fit)')
ImageAttributes imageFit(BoxFitAttribute fit) {
  return ImageAttributes(fit: fit);
}
