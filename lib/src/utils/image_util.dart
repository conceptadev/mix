// ignore_for_file: long-parameter-list

import '../attributes/box_fit_attribute.dart';
import '../attributes/image_provider_attribute.dart';
import '../attributes/image_repeat_attribute.dart';
import '../attributes/size_attribute.dart';
import '../core/dto/color_dto.dart';
import '../specs/image_attribute.dart';

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

// const imageColor = ImageUtility.color;
// const imageScale = ImageUtility.scale;
// const imageColorBlendMode = ImageUtility.colorBlendMode;
// const imageFit = ImageUtility.fit;
// const imageAlignment = ImageUtility.alignment;
// const imageRepeat = ImageUtility.repeat;
